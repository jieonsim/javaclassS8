/**
 *  - 회원가입 폼 스크립트
	- 사용되는 페이지 : member/signup/form.jsp
 */

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	// 폼과 인풋 아이디
	const form = document.getElementById('signupForm');
	const emailInput = document.getElementById('inputEmail');
	const passwordInput = document.getElementById('inputPassword');
	const passwordConfirmInput = document.getElementById('inputPasswordConfirm');
	const nameInput = document.getElementById('inputName');
	const phoneInput = document.getElementById('inputCellphone');

	// 정규식 표현
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	const passwordRegex = /^(?!((?:[A-Za-z]+|\d+|[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+)$))[A-Za-z\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{8,12}$/;
	const nameRegex = /^[a-zA-Z가-힣]{2,10}$/;
	const phoneRegex = /^01[016789]\d{7,8}$/;

	// 비밀번호 암호화 보기, 텍스트 감추기 토글
	const togglePasswordBtn = document.querySelector('.togglePassword');
	const togglePasswordConfirm = document.querySelector('.togglePasswordConfirm');

	// 이메일 인증
	const getCertifyNumBtn = document.getElementById('getCertifyNumBtn');
	const certifyBlock = document.querySelector('.uBlock[style="display: none;"]');
	const certifyNumInput = document.getElementById('inputCertifyNum');
	const resendBtn = certifyBlock.querySelector('.uBtn.borderType:nth-child(1)');
	const confirmBtn = certifyBlock.querySelector('.uBtn.borderType:nth-child(2)');
	const accountValiBlock = document.querySelector('.accountValiBlock');
	const timeSpan = document.querySelector('.time');

	// 이메일 인증 유효시간 체크를 위한 타이머 변수
	let timer;

	// 이메일 인증 완료 여부를 저장할 변수
	let isEmailVerified = false;

	// 이메일 인증 및 모든 폼 정상 입력 시 가입완료 버튼 활성화를 위한 변수
	const submitBtn = document.querySelector('.uBtn.point');


	function showError(input, message) {
		const errorDiv = input.closest('.uBlock').querySelector('.uErrorText');
		errorDiv.textContent = message;
		errorDiv.style.display = 'block';
	}

	function hideError(input) {
		const errorDiv = input.closest('.uBlock').querySelector('.uErrorText');
		errorDiv.style.display = 'none';
	}

	// 정규식 확인
	function validateInput(input, regex, errorMessage) {
		if (!regex.test(input.value.trim())) {
			showError(input, errorMessage);
			return false;
		}
		hideError(input);
		return true;
	}

	// 이메일
	emailInput.addEventListener('input', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, emailRegex, '이메일 주소 양식에 맞게 작성해주세요.');
	});

	emailInput.addEventListener('blur', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, emailRegex, '이메일 주소 양식에 맞게 작성해주세요.');
	});


	// 비밀번호
	passwordInput.addEventListener('input', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, passwordRegex, '8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.');
	});

	passwordInput.addEventListener('blur', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, passwordRegex, '8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.');
	});

	// 비밀번호 확인
	passwordConfirmInput.addEventListener('input', function() {
		this.value = this.value.replace(/\s/g, '');
		if (this.value !== passwordInput.value) {
			showError(this, '비밀번호가 일치하지 않습니다.');
		} else {
			hideError(this);
		}
	});

	passwordConfirmInput.addEventListener('blur', function() {
		this.value = this.value.replace(/\s/g, '');
		if (this.value !== passwordInput.value) {
			showError(this, '비밀번호가 일치하지 않습니다.');
		} else {
			hideError(this);
		}
	});

	// 이름
	nameInput.addEventListener('input', function() {
		let trimmedValue = this.value.trim().replace(/\s+/g, ' ');
		if (trimmedValue.length > 10) {
			trimmedValue = trimmedValue.slice(0, 10);
			showError(this, '최대 10자까지 입력 가능합니다.');
		} else if (!nameRegex.test(trimmedValue)) {
			showError(this, '한글과 영문 대,소문자를 사용해주세요.');
		} else {
			hideError(this);
		}
		this.value = trimmedValue;
	});


	nameInput.addEventListener('blur', function() {
		let trimmedValue = this.value.trim().replace(/\s+/g, ' ');
		this.value = trimmedValue;
		validateInput(this, nameRegex, '한글과 영문 대,소문자를 사용해주세요.');
	});

	// 비밀번호 암호화 보기, 텍스트 감추기 토글
	function togglePasswordVisibility(inputField, toggleBtn) {
		if (inputField.type === 'password') {
			inputField.type = 'text';
			toggleBtn.textContent = '숨기기';
		} else {
			inputField.type = 'password';
			toggleBtn.textContent = '보기';
		}
	}

	togglePasswordBtn.addEventListener('click', function() {
		togglePasswordVisibility(passwordInput, this);
	});

	togglePasswordConfirm.addEventListener('click', function() {
		togglePasswordVisibility(passwordConfirmInput, this);
	});


	// 이미 가입된 이메일일 경우 계정 안내 후 로그인 유도하기
	function showAccountValiBlock(email, date) {
		accountValiBlock.querySelector('.account').textContent = email;
		accountValiBlock.querySelector('.date').textContent = `(${date})`;
		accountValiBlock.style.display = 'block';
	}

	// 이메일 인증 유효시간 타이머
	function startTimer() {
		let remainTime = 600; // 10분
		clearInterval(timer);
		timer = setInterval(() => {
			const minutes = Math.floor(remainTime / 60);
			const seconds = remainTime % 60;
			timeSpan.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
			if (remainTime === 0) {
				clearInterval(timer);
				certifyNumInput.disabled = true;
				alert('인증번호 유효시간이 초과되었습니다.');
			}
			remainTime--;
		}, 1000);
	}

	// 인증번호 받기 버튼 클릭 이벤트
	getCertifyNumBtn.addEventListener('click', function() {
		const email = emailInput.value.trim();

		// 이메일 공백 체크
		if (!email) {
			showError(emailInput, '필수 정보입니다. 이메일을 입력해주세요.');
			return;
		}

		// 이메일 정규식 검사
		if (!validateInput(emailInput, emailRegex, '이메일 주소 양식에 맞게 작성해주세요.')) {
			return;
		}

		// 인증번호받기 버튼 발송 중, 발송완료 상태로 변경하기 위함
		let originalButtonText = this.textContent;
		let originalButtonState = this.disabled;

		$.ajax({
			url: ctp + '/signup/checkEmail',
			type: 'POST',
			data: { email: email },
			success: function(response) {
				if (response.exists) {
					if (response.isWithdrawn) {
						showError(emailInput, '탈퇴한 이메일 아이디입니다. 다른 이메일로 다시 시도해주세요.');
					} else {
						showAccountValiBlock(email, response.registrationDate);
					}
				} else {
					hideError(emailInput);
					// 새 계정인 경우에만 버튼 상태 변경 및 인증 이메일 발송
					getCertifyNumBtn.textContent = '발송 중...';
					getCertifyNumBtn.disabled = true;
					sendCertificationEmail(email);
					accountValiBlock.style.display = 'none';
				}
			},
			error: function() {
				alert('이메일 확인 중 오류가 발생했습니다.');
				// 오류 발생 시 버튼 상태 발송중에서 원래대로 복원
				getCertifyNumBtn.textContent = originalButtonText;
				getCertifyNumBtn.disabled = originalButtonState;
			}
		});
	});

	// 이메일로 인증번호 보내기
	function sendCertificationEmail(email) {
		$.ajax({
			url: ctp + '/signup/sendCertification',
			type: 'POST',
			data: { email: email },
			success: function() {
				certifyBlock.style.display = 'block';
				startTimer();
				// 버튼 상태 발송 중에서 복원
				getCertifyNumBtn.textContent = '발송완료',
					getCertifyNumBtn.disabled = true;
			},
			error: function() {
				alert('인증번호 발송 중 오류가 발생했습니다.');
				// 버튼 상태 발송 중에서 복원
				getCertifyNumBtn.textContent = '인증번호받기',
					getCertifyNumBtn.disabled = false;
			}
		});
	}

	// 재발송 버튼 클릭 이벤트
	resendBtn.addEventListener('click', function() {
		getCertifyNumBtn.textContent = '발송 중...';
		getCertifyNumBtn.disabled = true;
		sendCertificationEmail(emailInput.value.trim());
	});

	// 모든 입력 필드의 유효성을 확인하는 함수
	function checkAllFieldsValid() {
		return isEmailVerified &&
			emailRegex.test(emailInput.value.trim()) &&
			passwordRegex.test(passwordInput.value) &&
			passwordInput.value === passwordConfirmInput.value &&
			nameRegex.test(nameInput.value.trim()) &&
			phoneRegex.test(phoneInput.value.trim());
	}

	// 버튼 비활성화 상태를 업데이트하는 함수
	function updateSubmitButtonState() {
		submitBtn.disabled = !checkAllFieldsValid();
	}

	// 각 입력 필드의 'input' 이벤트에 리스너 추가
	[emailInput, passwordInput, passwordConfirmInput, nameInput, phoneInput].forEach(input => {
		input.addEventListener('input', updateSubmitButtonState);
	});

	// 이메일 인증 완료 시 호출할 함수
	function setEmailVerified() {
		isEmailVerified = true;
		updateSubmitButtonState();
	}

	// 인증 확인 버튼 클릭 이벤트
	confirmBtn.addEventListener('click', function() {
		const inputNum = certifyNumInput.value.trim();
		if (!inputNum) {
			alert('인증번호를 입력해주세요.');
			return;
		}

		$.ajax({
			url: ctp + '/signup/verifyCertification',
			type: 'POST',
			data: {
				email: emailInput.value.trim(),
				certificationNumber: inputNum
			},
			success: function(response) {
				if (response) {
					alert('인증이 완료되었습니다.');
					clearInterval(timer);
					// 이메일 인증 완료 함수 호출
					setEmailVerified();

					// 인증번호받기 버튼 숨기기
					getCertifyNumBtn.style.display = 'none';

					// 새로운 인증완료 버튼 추가
					const newButton = document.createElement('button');
					newButton.type = 'button';
					newButton.className = 'uBtn borderType';
					newButton.textContent = '인증완료';

					// 새 버튼을 기존 버튼 위치에 추가
					getCertifyNumBtn.parentNode.appendChild(newButton);

					// 인증 입력 영역 숨기기
					certifyBlock.style.display = 'none';

				} else {
					alert('인증번호가 일치하지 않아요. 다시 확인해 주세요.');
				}
			},
			error: function() {
				alert('인증 확인 중 오류가 발생했습니다.');
			}
		});
	});

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();

		let isValid = true;

		// 이메일 유효성 검사
		let cleanEmail = emailInput.value.replace(/\s/g, '');
		emailInput.value = cleanEmail;
		isValid &= validateInput(emailInput, emailRegex, '이메일 주소 양식에 맞게 작성해주세요.');

		// 이메일 인증 확인
		if (!isEmailVerified) {
			showError(emailInput, '이메일 인증을 진행해주세요.');
			isValid = false;
		}

		// 비밀번호 유효성 검사
		let cleanPassword = passwordInput.value.replace(/\s/g, '');
		passwordInput.value = cleanPassword;
		isValid &= validateInput(passwordInput, passwordRegex, '8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.');

		// 비밀번호 확인 검사
		let cleanPasswordConfirm = passwordConfirmInput.value.replace(/\s/g, '');
		passwordConfirmInput.value = cleanPasswordConfirm;
		if (cleanPassword !== cleanPasswordConfirm) {
			showError(passwordConfirmInput, '비밀번호가 일치하지 않습니다.');
			isValid = false;
		} else {
			hideError(passwordConfirmInput);
		}

		// 이름 유효성 검사
		if (nameInput.value.trim() === '') {
			showError(nameInput, '이름을 입력해주세요.');
			isValid = false;
		} else {
			let trimmedName = nameInput.value.trim().replace(/\s+/g, ' ');
			if (trimmedName.length > 10) {
				showError(nameInput, '최대 10자까지 입력 가능합니다.');
				isValid = false;
			} else if (!nameRegex.test(trimmedName)) {
				showError(nameInput, '한글과 영문 대,소문자를 사용해주세요.');
				isValid = false;
			} else {
				hideError(nameInput);
				nameInput.value = trimmedName;  // 공백이 정리된 값을 다시 입력 필드에 설정
			}
		}

		// 전화번호 유효성 검사
		isValid &= validateInput(phoneInput, phoneRegex, '올바른 휴대폰 번호를 입력해주세요.');

		if (isValid) {
			// 모든 유효성 검사를 통과한 경우
			const formData = new FormData(form);

			fetch(ctp + '/signup/form', {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						window.location.href = ctp + '/signup/complete';
					} else {
						alert('회원가입 중 오류가 발생했습니다.');
					}
				})
				.catch(error => {
					console.error('Error: ', error);
					alert('회원가입 중 오류가 발생했습니다.');
				});
		} else {
			console.log('폼 제출 실패: 유효성 검사 오류');
		}
	});
});
