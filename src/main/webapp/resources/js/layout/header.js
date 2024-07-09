/**
 * 유저 페이지 헤더 스크립트
 */

// PC 헤더에서 각 메뉴 클릭 시 is-active 활성화하여 접속한 페이지의 메뉴의 폰트 bold + 색상 레드로 변경
document.addEventListener('DOMContentLoaded', function() {
	const navLinks = document.querySelectorAll('.header_gnb .nav-link');
	const currentPath = window.location.pathname;

	navLinks.forEach(link => {
		if (link.getAttribute('href') === currentPath) {
			link.classList.add('is-active');
		}
	});
});
