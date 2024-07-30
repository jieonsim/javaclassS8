/**
 * js/my/reserve/print.js
 */
document.addEventListener('DOMContentLoaded', function() {
	// 프린트 버튼
	const printBtn = document.getElementById('printBtn');
	printBtn.addEventListener('click', function() {
		window.print();
	});
	// 닫기 버튼
	const closeBtn = document.getElementById('closeBtn');
	closeBtn.addEventListener('click', function() {
		window.close();
	});
});