/**
- 비밀번호 찾기 Depth2 : matchPassword에서 계정 확인 및 이메일 인증 거친 후 이동한 페이지
- 사용되는 페이지 : views/member/search/resetPassword.jsp
- email은 세션을 통해 input value로 들어가고 disabled 처리됨
*/

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	// 폼과 인풋 아이디 및 클래스 변수 선언
	const form = document.getElementById('restPasswordForm');
	const emailInput = document.getElementById('inputEmail');
	const newPasswordInput = document.getElementById('inputNewPassword');
	const newPasswordConfirmInput = document.getElementById('inputNewPasswordConfirm');

	// 비밀번호 정규식 표현
	const passwordRegex = /^(?!((?:[A-Za-z]+|\d+|[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+)$))[A-Za-z\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{8,12}$/;

	// 인풋 내용 삭제 버튼
	const newPwdDelBtn = document.querySelector('#inputNewPassword + .btnDel');
	const newPwdConfirmDelBtn = document.querySelector('#inputNewPasswordConfirm + .btnDel');

	// 새로운 비밀번호 인풋 다시입력 버튼
	newPwdDelBtn.addEventListener('click', function() {
		newPasswordInput.value = '';
		newPasswordInput.focus();
	});

	// 새로운 비밀번호 확인 인풋 다시입력 버튼
	newPwdConfirmDelBtn.addEventListener('click', function() {
		newPasswordConfirmInput.value = '';
		newPasswordConfirmInput.focus();
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

	// 새로운 비밀번호 입력 시 정규식 체크
	newPasswordInput.addEventListener('input', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, passwordRegex, '비밀번호 설정 규칙에 맞지 않습니다.');
	});

	newPasswordInput.addEventListener('blur', function() {
		this.value = this.value.replace(/\s/g, '');
		validateInput(this, passwordRegex, '비밀번호 설정 규칙에 맞지 않습니다.');
	});

	// 새로운 비밀번호 확인 입력 시 새로운 비밀번호와 일치한지 체크
	newPasswordConfirmInput.addEventListener('input', function() {
		this.value = this.value.replace(/\s/g, '');
		if (this.value !== newPasswordInput.value) {
			showError('비밀번호가 일치하지 않습니다.');
		} else {
			hideError();
		}
	});

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const email = emailInput.value.trim();
		const newPassword = newPasswordInput.value.trim();
		const newPasswordConfirm = newPasswordConfirmInput.value.trim();

		if (!email) {
			alert('이메일 아이디의 정보가 없습니다. 재인증 후 시도해주세요.');
			window.location.href = ctp + '/search/matchPassword';
			return;
		}

		if (!newPassword) {
			showError('영문, 숫자, 특수문자 8~12자로 입력해주세요.');
			return;
		}

		if (!validateInput(newPasswordInput, passwordRegex, '비밀번호 설정 규칙에 맞지 않습니다.')) {
			return;
		}

		if (!newPasswordConfirm || newPasswordConfirm !== newPassword) {
			showError('비밀번호가 일치하지 않습니다.');
			return;
		}

		// 서버에 새 비밀번호 설정 요청
		fetch(ctp + '/search/resetPassword', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				email: email,
				newPassword: newPassword
			}),
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('회원님께서 요청하신 새로운 비밀번호로 변경하였습니다.');
					window.location.href = ctp + '/';
				} else if (data.error === 'SAME_PASSWORD') {
					showError('현재의 비밀번호와 새로운 비밀번호를 다르게 설정해 주세요.');
				} else {
					showError('비밀번호 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				showError('비밀번호 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
			})
	});
});