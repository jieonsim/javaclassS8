/**
 * 유저 페이지 푸터 스크립트
 */

// 모바일 푸터 사업자 정보 자세히 보기 / 닫기 토글
document
	.addEventListener(
		'DOMContentLoaded',
		function() {
			const toggleBtn = document
				.querySelector('.footer_toggle_btn');
			const toggleCont = document
				.querySelector('.footer_toggle_cont');

			toggleBtn
				.addEventListener(
					'click',
					function() {
						const expanded = this
							.getAttribute('aria-expanded') === 'true' || false;
						this.setAttribute('aria-expanded',
							!expanded);

						if (!expanded) {
							toggleCont.style.display = 'block';
							this.querySelector('.blind').textContent = '사업자 정보 닫기';
						} else {
							toggleCont.style.display = 'none';
							this.querySelector('.blind').textContent = '사업자 정보 자세히 보기';
						}
					});
		});