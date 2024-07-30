/*js/reserve/confirm.js */
document.addEventListener('DOMContentLoaded', function() {

	// 내역 프린트 버튼 처리
	const printBtn = document.querySelector('.reserve_btn .btn_blank');
	printBtn.addEventListener('click', function(e) {
		e.preventDefault();

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