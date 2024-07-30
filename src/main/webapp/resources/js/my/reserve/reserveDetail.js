/**
 *js/my/reserve/reserveDetail.js 
 */
document.addEventListener('DOMContentLoaded', function() {
	// 내역 프린트 버튼 처리
	const printPopupBtn = document.getElementById('printPopupBtn');

	printPopupBtn.addEventListener('click', function(e) {
		e.preventDefault();
		window.open(`${ctp}/my/reserve/print?reservationId=${reservationId}`, '티켓챔프', 'width=500,height=744');
	});
});