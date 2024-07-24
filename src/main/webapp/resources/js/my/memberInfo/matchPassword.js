/**
 * js/my/memberInfo/matchPassword.js
 */

document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('matchPasswordForm');
	const inputPassword = document.getElementById('inputPassword');
	const inputBx = document.querySelector('.inp_bx');
	const errorBox = document.getElementById('errorBox');

	// 포커스 및 값 입력에 따른 클래스 변경
	inputPassword.addEventListener('focus', function() {
		inputBx.classList.add('is_focus');
	});

	inputPassword.addEventListener('blur', function() {
		inputBx.classList.remove('is_focus');
	});

	form.addEventListener('submit', function(e) {
		e.preventDefault();
		const password = inputPassword.value;

		fetch(`${ctp}/my/memberInfo/matchPassword`, {
			method: 'POST',
			headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ password: password })
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					window.location.href = `${ctp}/my/memberInfo/modify`;
				} else {
					inputBx.classList.add('error');
					errorBox.textContent = '비밀번호가 일치하지 않습니다.';
					errorBox.style.display = 'block';
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('비밀번호 확인 중 오류가 발생했습니다.');
			});
	});
});