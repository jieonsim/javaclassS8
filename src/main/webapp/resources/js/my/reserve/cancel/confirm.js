/**
 * js/my/reserve/confirm.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const cancelBtn = document.getElementById('cancelBtn');
	cancelBtn.addEventListener('click', function(e) {
		e.preventDefault();
		const cancelConfirmed = confirm('해당 예매내역을 취소하시겠습니까?');
		if (cancelConfirmed) {
			window.location.href = `${ctp}/my/reserve/cancel/completed?reservationId=${reservationId}`;
		}
	});
});