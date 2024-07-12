document.addEventListener('DOMContentLoaded', function() {
	const API = {
		logout: `${ctp}/logout`,
		myInfo: `${ctp}/my/memberInfo/info`,
		myReserve: `${ctp}/my/reserve`,
		login: `${ctp}/login`,
		signup: `${ctp}/signup/agreement`,
		helpMain: `${ctp}/help/main`,
		adminMain: `${ctp}/admin/main`
	};

	function checkLoginStatus() {
		fetch(`${ctp}/checkLoginStatus`, {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(data => {
				if (data.isLoggedIn) {
					sessionStorage.setItem('isLoggedIn', 'true');
					sessionStorage.setItem('userEmail', data.email);
					sessionStorage.setItem('userRole', data.role);
					updateMenu({ email: data.email, role: data.role });

					if (data.autoLoginSuccess) {
						console.log("자동 로그인 성공");
					}
				} else {
					clearLoginSession();
				}
			})
			.catch(error => {
				console.error('Error checking login status:', error);
				clearLoginSession();
			});
	}
	
	function clearLoginSession() {
		sessionStorage.removeItem('isLoggedIn');
		sessionStorage.removeItem('userEmail');
		sessionStorage.removeItem('userRole');
		updateMenu(null);
	}

	window.updateMenu = function(user) {
		const nav = document.querySelector('.nav');
		nav.innerHTML = user ? getLoggedInMenu(user) : getLoggedOutMenu();
	};

	window.handleLogout = function() {
		clearLoginSession();
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

	document.addEventListener('click', function(e) {
		if (e.target && e.target.matches('a[href$="/logout"]')) {
			e.preventDefault();
			fetch(e.target.href, {
				method: 'GET',
				credentials: 'include'
			}).then(() => {
				handleLogout();
				window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
			}).catch(error => console.error('Logout error:', error));
		}
	});
});