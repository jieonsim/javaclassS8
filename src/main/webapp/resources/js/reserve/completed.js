/*js/reserve/completed.js */
document.addEventListener('DOMContentLoaded', function() {

	// 내역 프린트 버튼 처리
	const printPopupBtn = document.getElementById('printPopupBtn');
	printPopupBtn.addEventListener('click', function(e) {
		e.preventDefault();
		window.open(`${ctp}/my/reserve/print?reservationId=${reservationId}`, '티켓챔프_프린트', 'width=500,height=744,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	});

	// 예매확인 버튼 처리
	const goToReserveListBtn = document.querySelector('.reserve_btn .btn_full')
	goToReserveListBtn.addEventListener('click', function(e) {
		e.preventDefault();
		// 부모 창으로 메시지 보내기
		window.opener.postMessage('navigateToReserveList', '*');
		// 현재 창 닫기
		window.close();
	});
});