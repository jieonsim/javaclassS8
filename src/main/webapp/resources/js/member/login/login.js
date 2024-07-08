/**
- 로그인 폼
- 사용되는 페이지 : member/login/login.jsp
 */

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	// 폼과 인풋 요소들
	const form = document.getElementById('loginForm');
	const emailInput = document.getElementById('userId');
	const passwordInput = document.getElementById('userPwd');
	const saveSessionCheckbox = document.getElementById('saveSession');

	// 에러 메시지 표시 함수
	function showError(message) {
		const errorDiv = document.querySelector('.message');
		errorDiv.textContent = message;
		errorDiv.style.display = 'block';
	}

	// 에러 메시지 숨기기 함수
	function hideError() {
		const errorDiv = document.querySelector('.message');
		errorDiv.style.display = 'none';
	}

	/*	// 로그인 성공 처리 함수
		function handleLoginSuccess(member) {
			console.log('로그인 성공:', member);  // member 객체 로깅
			sessionStorage.setItem('isLoggedIn', 'true');
			sessionStorage.setItem('userEmail', member.email);
			sessionStorage.setItem('userRole', member.role);
			// 위 세개 추가
			window.location.href = ctp + '/';
		}*/

	function handleLoginSuccess(member) {
		console.log('로그인 성공:', member);
		sessionStorage.setItem('isLoggedIn', 'true');
		sessionStorage.setItem('userEmail', member.email);
		sessionStorage.setItem('userRole', member.role);

		// 메뉴 업데이트 함수 호출
		if (typeof window.updateMenuAfterLogin === 'function') {
			window.updateMenuAfterLogin({ email: member.email, role: member.role });
		}

		// 홈페이지로 리다이렉트
		window.location.href = ctp + '/';
	}

	form.addEventListener('submit', function(e) {
		e.preventDefault();
		hideError();

		const email = emailInput.value.trim();
		const password = passwordInput.value.trim();
		const saveSession = saveSessionCheckbox.checked;

		if (email === '') {
			showError('이메일을 입력해 주세요.');
			emailInput.focus();
			return;
		}

		if (password == '') {
			showError('비밀번호를 입력해 주세요.');
			passwordInput.focus();
			return;
		}

		// 로그인 요청 보내기
		fetch(ctp + '/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				email: email,
				password: password,
				saveSession: saveSession
			}),
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					handleLoginSuccess(result.member);
				} else {
					showError(result.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				showError('로그인 처리 중 오류가 발생했습니다.');
			});
	});

	// 입력 필드 변경 시 에러 메시지 숨기기
	emailInput.addEventListener('input', hideError);
	passwordInput.addEventListener('input', hideError);

	// 비밀번호 보이기 / 숨기기 필드
	const pwToggleBtn = document.querySelector('.btnShowToggle');
	pwToggleBtn.addEventListener('click', function() {
		if (passwordInput.type === 'password') {
			passwordInput.type = 'text';
			this.classList.add('active');
		} else {
			passwordInput.type = 'password';
			this.classList.remove('active');
		}
	});

	// 입력 삭제 버튼(이메일 필드)
	const emailDelBtn = document.querySelector('.inputId .btnDel');
	emailDelBtn.addEventListener('click', function() {
		emailInput.value = '';
		emailInput.focus();
	});
});