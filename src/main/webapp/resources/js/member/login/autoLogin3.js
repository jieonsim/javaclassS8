/*
- 자동 로그인 스크립트
*/

document.addEventListener('DOMContentLoaded', function() {
	const API = {
		/*autoLogin: `${ctp}/autoLogin`,*/
		logout: `${ctp}/logout`,
		myInfo: `${ctp}/my/memberInfo/info`,
		myReserve: `${ctp}/my/reserve`,
		login: `${ctp}/login`,
		signup: `${ctp}/signup/agreement`,
		helpMain: `${ctp}/help/main`,
		adminMain: `${ctp}/admin/main`
	};

	function checkLoginStatus() {
		if (sessionStorage.getItem('isLoggedIn') === 'true') {
			const userEmail = sessionStorage.getItem('userEmail');
			const userRole = sessionStorage.getItem('userRole');
			updateMenu({ email: userEmail, role: userRole });
		} else {
			updateMenu(null); // 로그인 되지 않은 상태로 메뉴 업데이트
		}
	}

	/*function checkAutoLogin() {
		fetch(API.autoLogin, {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => {
				if (!response.ok) {
					throw new Error(`HTTP error! status: ${response.status}`);
				}
				return response.json();
			})
			.then(handleLoginResult)
			.catch(handleLoginError);
	}*/

	/*function handleLoginResult(result) {
		if (result.success) {
			console.log('자동 로그인 성공');
			const safeUserData = sanitizeUserData(result.member);
			sessionStorage.setItem('isLoggedIn', 'true');
			sessionStorage.setItem('userEmail', safeUserData.email);
			sessionStorage.setItem('userRole', safeUserData.role);
			updateMenu(safeUserData);
		} else {
			//console.warn('자동 로그인 실패:', result.message);
			clearLoginSession();
		}
	}*/

	/*function handleLoginError(error) {
		console.error('Auto login error:', error);
		clearLoginSession();
	}*/

	/*function clearLoginSession() {
		sessionStorage.removeItem('isLoggedIn');
		sessionStorage.removeItem('userEmail');
		sessionStorage.removeItem('userRole');
		updateMenu(null);
	}*/

	/*function sanitizeUserData(userData) {
		return {
			email: escapeHtml(userData.email),
			role: userData.role
		};
	}*/

	/*function escapeHtml(unsafe) {
		return unsafe
			.replace(/&/g, "&amp;")
			.replace(/</g, "&lt;")
			.replace(/>/g, "&gt;")
			.replace(/"/g, "&quot;")
			.replace(/'/g, "&#039;");
	}*/

	window.updateMenu = function(user) {
		const nav = document.querySelector('.nav');
		nav.innerHTML = user ? getLoggedInMenu(user) : getLoggedOutMenu();
	};

	window.handleLogout = function() {
		sessionStorage.removeItem('isLoggedIn');
		sessionStorage.removeItem('userEmail');
		sessionStorage.removeItem('userRole');
		updateMenu(null);
	};

	function getLoggedInMenu(user) {
		return `
            <li class="nav-item"><a href="${API.myInfo}" class="nav-link">${user.email}</a></li>
            <li class="nav-item"><a href="${API.myReserve}" class="nav-link">예매확인/취소</a></li>
            <li class="nav-item"><a href="${API.logout}" class="nav-link">로그아웃</a></li>
            <li class="nav-item"><a href="${API.helpMain}" class="nav-link">고객센터</a></li>
            ${user.role === 'ADMIN' ? `<li class="nav-item"><a href="${API.adminMain}" class="nav-link">어드민</a></li>` : ''}
        `;
	}

	function getLoggedOutMenu() {
		return `
            <li class="nav-item"><a href="${API.login}" class="nav-link">로그인</a></li>
            <li class="nav-item"><a href="${API.signup}" class="nav-link">회원가입</a></li>
            <li class="nav-item"><a href="${API.helpMain}" class="nav-link">고객센터</a></li>
        `;
	}

	checkLoginStatus();

	if (sessionStorage.getItem('isLoggedIn') === 'true') {
		const userEmail = sessionStorage.getItem('userEmail');
		const userRole = sessionStorage.getItem('userRole');
		updateMenu({ email: userEmail, role: userRole });
	}
	
	document.addEventListener('click', function(e) {
		if (e.target && e.target.matches('a[href$="/logout"]')) {
			e.preventDefault();
			fetch(e.target.href, {
				method: 'GET',
				credentials: 'include'
			}).then(() => {
				window.handleLogout();
				window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
			}).catch(error => console.error('Logout error:', error));
		}
	});
});