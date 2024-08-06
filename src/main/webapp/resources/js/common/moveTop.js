/**js/common/moveTop.js*/
document.addEventListener('DOMContentLoaded', function() {
    var backToTop = document.getElementById('back_to_top');
    var docElem = document.documentElement;
    var offset = 100;
    var scrollPos;
    var isScrolling;

    window.addEventListener('scroll', function() {
        scrollPos = docElem.scrollTop;

        backToTop.classList.toggle('is-active', scrollPos > offset);

        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            backToTop.classList.add('is-stuck');
        } else {
            backToTop.classList.remove('is-stuck');
        }

        // 스크롤 중임을 표시
        clearTimeout(isScrolling);
        isScrolling = setTimeout(function() {
            // 스크롤이 멈추고 500ms 후에 실행
            if (scrollPos <= offset) {
                backToTop.classList.remove('is-active');
            }
        }, 500);
    });

    backToTop.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });

        // 스크롤 애니메이션이 끝난 후 버튼 숨기기
        setTimeout(function() {
            backToTop.classList.remove('is-active', 'is-stuck');
        }, 500); // 500ms는 대략적인 시간이므로 필요에 따라 조정하세요
    });
});
/*document.addEventListener('DOMContentLoaded', function() {
    var backToTop = document.getElementById('back_to_top');
    var docElem = document.documentElement;
    var offset = 100; // 버튼이 나타나는 스크롤 위치
    var scrollPos, docHeight;

    // 문서 높이 구하기
    docHeight = Math.max(docElem.scrollHeight, docElem.offsetHeight);
    if (docHeight != 'undefined') {
        offset = docHeight / 4;
    }

    // 스크롤 이벤트 리스너
    window.addEventListener('scroll', function() {
        scrollPos = docElem.scrollTop;

        backToTop.className = (scrollPos > offset) ? 'btn_move_top is-active' : 'btn_move_top';

        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            backToTop.className = 'btn_move_top is-active is-stuck';
        }
    });

    // 클릭 이벤트 리스너
    backToTop.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});*/
/*window.addEventListener('scroll', function() {
	var moveTopBtn = $('.btn_move_top');
	var footer = $('.common_footer');
	var nowScrollTop = $(window).scrollTop();
	var nowScrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
	nowScrollTop !== 0 ? moveTopBtn.addClass('is-active') : moveTopBtn.removeClass('is-active');
	nowScrollBottom - footer.height() < 20 ? moveTopBtn.addClass('is-stuck') : moveTopBtn.removeClass('is-stuck');
});
*/