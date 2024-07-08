/**
 *  - 자동 로그인 체크 스크립트
	  - common/utility.jsp에 임포트 시켜 모든 페이지에서 확인할 수 있도록 처리
 */

// 자동 로그인 체크
function checkAutoLogin() {
    fetch(ctp + '/autoLogin', {
        method: 'GET',
        credentials: 'include'  // 중요: 쿠키를 포함하여 요청
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(result => {
        if (result.success) {
            console.log('자동 로그인 성공:', result.member);
            window.location.reload();
        }
    })
    .catch(error => {
        console.error('Auto login error:', error);
    });
}

// 페이지 로드 시 자동 로그인 체크
document.addEventListener('DOMContentLoaded', checkAutoLogin);
/*function checkAutoLogin() {
	// 이미 로그인되어 있다면 체크하지 않음
	if (document.cookie.includes('autoLoginChecked=true')) {
		return;
	}

	fetch(ctp + '/autoLogin')
		.then(response => {
			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}
			return response.json();
		})
		.then(result => {
			if (result.success) {
				console.log('자동 로그인 성공:', result.member);
				// 자동 로그인 체크 완료 쿠키 설정 (30일)
				const expirationDate = new Date();
				expirationDate.setDate(expirationDate.getDate() + 30);
				document.cookie = `autoLoginChecked=true; path=/; expires=${expirationDate.toUTCString()}`;
				window.location.reload();
			}
		})
		.catch(error => {
			console.error('Auto login error:', error);
		});
}

// 페이지 로드 시 자동 로그인 체크
document.addEventListener('DOMContentLoaded', checkAutoLogin);*/