// 자동 로그인 체크
document.addEventListener('DOMContentLoaded', function() {
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
});