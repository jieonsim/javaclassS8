/**
 * matchPassword.js
 사용되는 페이지 : 비밀번호 찾기 (member/search/matchPassword.jsp)
 */

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	// 인풋 아이디 및 클래스 변수 선언
	const nameInput = document.getElementById('inputName');
	const emailInput = document.getElementById('inputEmail');
	const certNoInput = document.getElementById('inputEmailCertNo');
	const certBtn = document.querySelector('.certBtn');
	const confirmBtn = document.querySelector('.confirmBtn');
	const resendBtn = document.querySelector('.buttonStyle button');
	const timerElement = document.querySelector('.count');
	const hasButtonWrap = document.querySelector('.hasButtonWrap');
	const intToast = document.querySelector('.intToast');

	// 정규식 표현
	const nameRegex = /^[a-zA-Z가-힣]{2,10}$/;
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	// 인풋 내용 삭제 버튼
	const nameDelBtn = document.querySelector('#inputName + .btnDel');
	const emailDelBtn = document.querySelector('#inputEmail + .btnDel');

	let timer;
	//let certificationNumber;

	// 이름 인풋 다시입력 버튼
	nameDelBtn.addEventListener('click', function() {
		nameInput.value = '';
		nameInput.focus();
	});

	// 이메일 인풋 다시입력 버튼
	emailDelBtn.addEventListener('click', function() {
		emailInput.value = '';
		emailInput.focus();
	});

	// 에러 메시지 표시 함수
	function showError(message) {
		const errorDiv = document.querySelector('.errorMessage .message');
		errorDiv.textContent = message;
		errorDiv.style.display = 'block';
	}

	// 에러 메시지 숨기기 함수
	function hideError() {
		const errorDiv = document.querySelector('.errorMessage .message');
		errorDiv.style.display = 'none';
	}

	// 정규식 확인
	function validateInput(input, regex, errorMessage) {
		if (!regex.test(input.value.trim())) {
			showError(errorMessage);
			return false;
		}
		hideError();
		return true;
	}

	// 타이머
	function startTimer() {
		let remainTime = 600; // 10분
		clearInterval(timer);
		timer = setInterval(() => {
			const minutes = Math.floor(remainTime / 60);
			const seconds = remainTime % 60;
			timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
			if (remainTime === 0) {
				clearInterval(timer);
				showError('인증번호 유효시간이 초과되었습니다.');
				certNoInput.disabled = true;
			}
			remainTime--;
		}, 1000);
	}

	// 인증번호가 발송되었어요 토스트
	function showToast() {
		intToast.style.display = 'block';
		setTimeout(() => {
			intToast.style.display = 'none';
		}, 3000);
	}

	// 인증번호 발송 함수
	function sendCertification() {
		const name = nameInput.value.trim();
		const email = emailInput.value.trim();

		// certBtn과 resendBtn 모두 처리
		[certBtn, resendBtn].forEach(btn => {
			btn.textContent = '발송 중';
			btn.disabled = true;
		});

		fetch(ctp + '/search/sendPasswordCertification', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ name, email }),
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					certificationNumber = data.certificationNumber;
					hasButtonWrap.removeAttribute('style'); // style 속성 자체를 제거
					startTimer();
					showToast();
					certBtn.style.display = 'none';
					confirmBtn.style.display = 'block';
					resendBtn.textContent = '다시 받기';
					resendBtn.disabled = false;
				} else {
					showError(data.message);
					// certBtn과 resendBtn 모두 원래 상태로 복구
					certBtn.textContent = '인증번호 받기';
					certBtn.disabled = false;
					resendBtn.textContent = '다시 받기';
					resendBtn.disabled = false;
				}
			})
			.catch(error => {
				console.error('Error:', error);
				showError('인증번호 발송 중 오류가 발생했습니다.');
				// certBtn과 resendBtn 모두 원래 상태로 복구
				certBtn.textContent = '인증번호 받기';
				certBtn.disabled = false;
				resendBtn.textContent = '다시 받기';
				resendBtn.disabled = false;
			});
	}


	// 인증번호 받기 버튼 클릭 이벤트
	certBtn.addEventListener('click', function() {
		const name = nameInput.value.trim();
		const email = emailInput.value.trim();

		// 이름 공백 체크
		if (!name) {
			showError('이름을 입력해주세요.');
			return;
		}

		// 이름 정규식 검사
		if (!validateInput(nameInput, nameRegex, '이름은 한글과 영문 대,소문자를 사용해주세요.')) {
			return;
		}

		// 이메일 공백 체크
		if (!email) {
			showError('이메일을 입력해 주세요.');
			return;
		}

		// 이메일 정규식 검사
		if (!validateInput(emailInput, emailRegex, '잘못된 이메일 형식입니다.')) {
			return;
		}

		sendCertification();
	});

	// 인증번호 다시 받기 버튼 클릭 이벤트
	resendBtn.addEventListener('click', function() {
		const name = nameInput.value.trim();
		const email = emailInput.value.trim();

		// 이름 공백 체크
		if (!name) {
			showError('이름을 입력해주세요.');
			return;
		}

		// 이름 정규식 검사
		if (!validateInput(nameInput, nameRegex, '이름은 한글과 영문 대,소문자를 사용해주세요.')) {
			return;
		}

		// 이메일 공백 체크
		if (!email) {
			showError('이메일을 입력해 주세요.');
			return;
		}

		// 이메일 정규식 검사
		if (!validateInput(emailInput, emailRegex, '잘못된 이메일 형식입니다.')) {
			return;
		}

		// 버튼 텍스트 변경 및 비활성화
		this.textContent = '발송 중';
		this.disabled = true;
		
		sendCertification();
	});

	// 인증번호 일치여부 확인 버튼 클릭 이벤트
	confirmBtn.addEventListener('click', function() {
		const name = nameInput.value.trim();
		const email = emailInput.value.trim();

		// 이름 공백 체크
		if (!name) {
			showError('이름을 입력해주세요.');
			return;
		}

		// 이름 정규식 검사
		if (!validateInput(nameInput, nameRegex, '이름은 한글과 영문 대,소문자를 사용해주세요.')) {
			return;
		}

		// 이메일 공백 체크
		if (!email) {
			showError('이메일을 입력해 주세요.');
			return;
		}

		// 이메일 정규식 검사
		if (!validateInput(emailInput, emailRegex, '잘못된 이메일 형식입니다.')) {
			return;
		}

		const inputCertNo = certNoInput.value.trim();

		if (!inputCertNo) {
			showError('인증번호를 입력해 주세요.');
			return;
		}

		fetch(ctp + '/search/verifyPasswordCertification', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				name: name,
				email: email,
				certificationNumber: inputCertNo
			}),
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					window.location.href = ctp + '/search/resetPassword';
				} else {
					showError(data.message);
				}
			})
			.catch(error => {
				console.error('Error: ', error);
				showError('인증 확인 중 오류가 발생했습니다.');
			})
	});
});