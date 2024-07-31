/**
 * js/my/memberInfo/changePassword.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('changePasswordForm');
	const input_old_password = document.getElementById('input_old_password');
	const input_new_password = document.getElementById('input_new_password');
	const input_confirm_password = document.getElementById('input_confirm_password');

	// 정규식 표현
	const passwordRegex = /^(?!((?:[A-Za-z]+|\d+|[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+)$))[A-Za-z\d!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{8,12}$/;

	function handleFocus(input) {
		input.closest('.inp_bx').classList.add('is_focus');
	}

	function handleBlur(input) {
		const inputBx = input.closest('.inp_bx');
		inputBx.classList.remove('is_focus');
	}

	function showError(input, message) {
		const inputBx = input.closest('.inp_bx');
		const errorBox = inputBx.querySelector('.error_txt');
		inputBx.classList.add('error');
		errorBox.textContent = message;
		errorBox.style.display = 'block';
	}

	function hideError(input) {
		const inputBx = input.closest('.inp_bx');
		const errorBox = inputBx.querySelector('.error_txt');
		inputBx.classList.remove('error');
		errorBox.style.display = 'none';
	}

	function validateInput(input, regex, errorMessage) {
		const value = input.value.trim();
		if (!value) {
			showError(input, errorMessage);
			return false;
		}
		if (regex && !regex.test(value)) {
			showError(input, '8~12자의 영문, 숫자, 특수문자 중 2가지 이상 포함하여 입력해주세요.');
			return false;
		}
		hideError(input);
		return true;
	}

	[input_old_password, input_new_password, input_confirm_password].forEach(input => {
		input.addEventListener('focus', () => handleFocus(input));
		input.addEventListener('blur', () => handleBlur(input));
		input.addEventListener('input', () => {
			if (input === input_old_password) {
				validateInput(input, null, '비밀번호를 입력해 주세요.');
			} else if (input === input_new_password) {
				validateInput(input, passwordRegex, '신규 비밀번호를 입력해 주세요.');
				if (input_confirm_password.value) {
					validateConfirmPassword();
				}
			} else if (input === input_confirm_password) {
				validateConfirmPassword();
			}
		});
	});

	function validateConfirmPassword() {
		if (input_confirm_password.value !== input_new_password.value) {
			showError(input_confirm_password, '신규 비밀번호가 일치하지 않습니다.');
		} else {
			hideError(input_confirm_password);
		}
	}

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const isOldPasswordValid = validateInput(input_old_password, null, '비밀번호를 입력해 주세요.');
		const isNewPasswordValid = validateInput(input_new_password, passwordRegex, '신규 비밀번호를 입력해 주세요.');
		const isConfirmPasswordValid = validateInput(input_confirm_password, null, '신규 비밀번호를 다시 한번 입력해 주세요.');

		if (isOldPasswordValid && isNewPasswordValid && isConfirmPasswordValid) {
			if (input_new_password.value !== input_confirm_password.value) {
				showError(input_confirm_password, '신규 비밀번호가 일치하지 않습니다.');
				return;
			}

			const formData = new FormData(form);

			fetch(`${ctp}/my/memberInfo/changePassword`, {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						alert('비밀번호가 성공적으로 수정되었습니다.');
						window.location.href = `${ctp}/my/memberInfo/info`;
					} else {
						switch (data.error) {
							case 'INCORRECT_OLD_PASSWORD':
								showError(input_old_password, '현재 비밀번호와 일치하지 않습니다.');
								break;
							case 'SAME_PASSWORD':
								showError(input_new_password, '현재의 비밀번호와 신규 비밀번호를 다르게 설정해 주세요.');
								break;
							case 'USER_NOT_FOUND':
								alert('사용자 정보를 찾을 수 없습니다.');
								break;
							case 'UPDATE_FAILED':
								alert('비밀번호 업데이트에 실패했습니다. 다시 시도해주세요.');
								break;
							case 'SERVER_ERROR':
								alert('서버 오류가 발생했습니다. 나중에 다시 시도해주세요.');
								break;
							default:
								alert('비밀번호 변경에 실패했습니다.: ' + data.error);
						}
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('비밀번호 수정 중 오류가 발생했습니다.');
				});
		}
	});
});