/**
 *  - 자동 로그인 체크 스크립트
	  - common/utility.jsp에 임포트 시켜 모든 페이지에서 확인할 수 있도록 처리
 */

// 자동 로그인 체크
document.addEventListener('DOMContentLoaded', function() {
	const API = {
		autoLogin: `${ctp}/autoLogin`,
		logout: `${ctp}/logout`,
		myInfo: `${ctp}/my/memberInfo/info`,
		myReserve: `${ctp}/my/reserve`,
		login: `${ctp}/login`,
		signup: `${ctp}/signup/agreement`,
		helpMain: `${ctp}/help/main`,
		adminMain: `${ctp}/admin/main`
	};
	
	/*function checkAutoLogin() {
		// 자동 로그인 토큰이 있는 경우에만 자동 로그인 시도
		if (document.cookie.includes('autoLoginToken')) {
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
		} else {
			// 자동 로그인 토큰이 없는 경우, 로그아웃 상태로 처리
			updateMenu(null);
		}
	}*/
	function checkAutoLogin() {
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
	}

	/*function handleLoginResult(result) {
		if (result.success) {
			console.log('자동 로그인 성공');
			const safeUserData = sanitizeUserData(result.member);
			sessionStorage.setItem('isLoggedIn', 'true');
			sessionStorage.setItem('userEmail', safeUserData.email);
			sessionStorage.setItem('userRole', safeUserData.role);
			updateMenu(safeUserData);
		} else {
			console.warn('자동 로그인 실패:', result.message);
			clearLoginSession();
		}
	}

	function handleLoginError(error) {
		console.error('자동 로그인 오류:', error);
		clearLoginSession();
	}*/

	function handleLoginResult(result) {
		if (result.success) {
			console.log('자동 로그인 성공');
			const safeUserData = sanitizeUserData(result.member);
			sessionStorage.setItem('isLoggedIn', 'true');
			sessionStorage.setItem('userEmail', safeUserData.email);
			sessionStorage.setItem('userRole', safeUserData.role);
			updateMenu(safeUserData);
		} else {
			console.warn('자동 로그인 실패:', result.message);
			clearLoginSession();
		}
	}

	function handleLoginError(error) {
		console.error('Auto login error:', error);
		clearLoginSession();
	}

	function clearLoginSession() {
		sessionStorage.removeItem('isLoggedIn');
		sessionStorage.removeItem('userEmail');
		sessionStorage.removeItem('userRole');
		updateMenu(null);
	}

	function sanitizeUserData(userData) {
		return {
			email: escapeHtml(userData.email),
			role: userData.role
		};
	}

	function escapeHtml(unsafe) {
		return unsafe
			.replace(/&/g, "&amp;")
			.replace(/</g, "&lt;")
			.replace(/>/g, "&gt;")
			.replace(/"/g, "&quot;")
			.replace(/'/g, "&#039;");
	}

	function updateMenu(user) {
		const nav = document.querySelector('.nav');
		nav.innerHTML = user ? getLoggedInMenu(user) : getLoggedOutMenu();
	}

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

	checkAutoLogin();

	// 페이지 로드 시 세션 스토리지 확인 또는 자동 로그인 시도
	if (sessionStorage.getItem('isLoggedIn') === 'true') {
		const userEmail = sessionStorage.getItem('userEmail');
		const userRole = sessionStorage.getItem('userRole');
		updateMenu({ email: userEmail, role: userRole });
	} else {
		checkAutoLogin();
	}

	/*
	if (sessionStorage.getItem('isLoggedIn') === 'true') {
	const userEmail = sessionStorage.getItem('userEmail');
	const userRole = sessionStorage.getItem('userRole');
	updateMenu({ email: userEmail, role: userRole });}*/
});

/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					// 세션 스토리지에 로그인 상태 저장
					sessionStorage.setItem('isLoggedIn', 'true');
					sessionStorage.setItem('member', JSON.stringify(result.member));
					updateMenu(result.member); // 메뉴 업데이트
				} else {
					console.warn('자동 로그인 실패:', result.message);
					sessionStorage.removeItem('isLoggedIn');
					sessionStorage.removeItem('member');
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 메뉴 업데이트 함수
	function updateMenu(member) {
		const nav = document.querySelector('.nav');
		if (member) {
			nav.innerHTML = `
				<li class="nav-item">
					<a href="${ctp}/my/memberInfo/info" class="nav-link">${member.email}</a>
				</li>
				<li class="nav-item">
					<a href="${ctp}/my/reserve" class="nav-link">예매확인/취소</a>
				</li>
				<li class="nav-item">
					<a href="${ctp}/logout" class="nav-link">로그아웃</a>
				</li>
				<li class="nav-item">
					<a href="${ctp}/help/main" class="nav-link">고객센터</a>
				</li>
				${member.role === 'ADMIN' ? `
				<li class="nav-item">
					<a href="${ctp}/admin/main" class="nav-link">어드민</a>
				</li>` : ''}
			`;
		} else {
			nav.innerHTML = `
				<li class="nav-item">
					<a href="${ctp}/login" class="nav-link">로그인</a>
				</li>
				<li class="nav-item">
					<a href="${ctp}/signup/agreement" class="nav-link">회원가입</a>
				</li>
				<li class="nav-item">
					<a href="${ctp}/help/main" class="nav-link">고객센터</a>
				</li>
			`;
		}
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();

	// 로그인 상태를 확인하여 메뉴 업데이트
	if (sessionStorage.getItem('isLoggedIn') === 'true') {
		const member = JSON.parse(sessionStorage.getItem('member'));
		updateMenu(member);
	}
});*/
/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					// 세션 스토리지에 로그인 상태 저장
					sessionStorage.setItem('isLoggedIn', 'true');
					sessionStorage.setItem('member', JSON.stringify(result.member));
					// 로그인 페이지가 아닌 경우에만 리다이렉트
					if (window.location.pathname === '/login') {
						window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
					}
				} else {
					console.warn('자동 로그인 실패:', result.message);
					sessionStorage.removeItem('isLoggedIn');
					sessionStorage.removeItem('member');
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();

	// 로그인 상태를 확인하여 필요한 경우 리다이렉트
	if (sessionStorage.getItem('isLoggedIn') === 'true') {
		console.log('이미 로그인된 상태입니다.');
		if (window.location.pathname === '/login') {
			window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
		}
	}
});
*/

/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					// 로그인 페이지가 아닌 경우에만 리다이렉트
					if (window.location.pathname === '/login') {
						window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
					}
				} else {
					console.warn('자동 로그인 실패:', result.message);
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();
});
*/

/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					// 홈 페이지가 아니고 로그인 페이지가 아닌 경우에만 리다이렉트
					if (window.location.pathname !== '/' && window.location.pathname !== '/login') {
						window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
					}
				} else {
					console.warn('자동 로그인 실패:', result.message);
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();
});*/

/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					if (!window.location.pathname.endsWith('/')) {
						window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
					}
				} else {
					console.warn('자동 로그인 실패:', result.message);
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();
});*/
/*document.addEventListener('DOMContentLoaded', function() {
	function checkAutoLogin() {
		fetch(ctp + '/autoLogin', {
			method: 'GET',
			credentials: 'include'
		})
			.then(response => response.json())
			.then(result => {
				if (result.success) {
					console.log('자동 로그인 성공:', result.member);
					window.location.href = ctp + '/'; // 홈페이지로 리다이렉트
				} else {
					console.warn('자동 로그인 실패:', result.message);
				}
			})
			.catch(error => {
				console.error('Auto login error:', error);
			});
	}

	// 페이지 로드 시 자동 로그인 체크
	checkAutoLogin();
});*/