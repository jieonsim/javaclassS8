/**
 * js/my/memberInfo/matchPassword.js
 */

document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('memberInfoModifyForm');
	const inputName = document.getElementById('inputName');
	const inputPhone = document.getElementById('inputPhone');
	const errorBox1 = document.getElementById('errorBox1');
	const errorBox2 = document.getElementById('errorBox2');

	// 정규식 표현
	const nameRegex = /^[a-zA-Z가-힣]{2,10}$/;
	const phoneRegex = /^01[016789]\d{7,8}$/;

	function handleFocus(input) {
		input.closest('.inp_bx').classList.add('is_focus');
	}

	function handleBlur(input) {
		const inputBx = input.closest('.inp_bx');
		inputBx.classList.remove('is_focus');
		if (input.value.trim()) {
			inputBx.classList.add('is_value');
		} else {
			inputBx.classList.remove('is_value');
		}
	}

	function showError(input, message) {
		const inputBx = input.closest('.inp_bx');
		const errorBox = input === inputName ? errorBox1 : errorBox2;
		inputBx.classList.add('error');
		errorBox.textContent = message;
		errorBox.style.display = 'block';
	}

	function hideError(input) {
		const inputBx = input.closest('.inp_bx');
		const errorBox = input === inputName ? errorBox1 : errorBox2;
		inputBx.classList.remove('error');
		errorBox.style.display = 'none';
	}

	function validateInput(input, regex, errorMessage) {
		const value = input.value.trim();
		if (!value) {
			showError(input, '필수 정보입니다.');
			return false;
		}
		if (!regex.test(value)) {
			showError(input, errorMessage);
			return false;
		}
		hideError(input);
		return true;
	}

	[inputName, inputPhone].forEach(input => {
		input.addEventListener('focus', () => handleFocus(input));
		input.addEventListener('blur', () => handleBlur(input));
		input.addEventListener('input', () => {
			input.closest('.inp_bx').classList.add('is_value');
			if (input === inputName) {
				validateInput(input, nameRegex, '한글과 영문 대,소문자를 사용해주세요.');
			} else {
				validateInput(input, phoneRegex, '올바른 휴대폰 번호를 입력해주세요.');
			}
		});
	});

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const isNameValid = validateInput(inputName, nameRegex, '한글과 영문 대,소문자를 사용해주세요.');
		const isPhoneValid = validateInput(inputPhone, phoneRegex, '올바른 휴대폰 번호를 입력해주세요.');

		if (isNameValid && isPhoneValid) {
			const formData = new FormData(form);

			fetch(`${ctp}/my/memberInfo/modify`, {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					if (data) {
						alert('회원 정보가 성공적으로 수정되었습니다.');
						window.location.href = `${ctp}/my/memberInfo/info`;
					} else {
						alert('회원 정보 수정에 실패했습니다.' + data.message);
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('회원 정보 수정 중 오류가 발생했습니다.');
				});
		}

	});
});