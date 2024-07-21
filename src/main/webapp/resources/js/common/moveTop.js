/**
 * 
 */

window.addEventListener('scroll', function() {
	var moveTopBtn = $('.btn_move_top');
	var footer = $('.common_footer');
	var nowScrollTop = $(window).scrollTop();
	var nowScrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
	nowScrollTop !== 0 ? moveTopBtn.addClass('is-active') : moveTopBtn.removeClass('is-active');
	nowScrollBottom - footer.height() < 20 ? moveTopBtn.addClass('is-stuck') : moveTopBtn.removeClass('is-stuck');
});
