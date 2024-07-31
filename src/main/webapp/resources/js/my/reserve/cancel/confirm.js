/**
 * js/my/reserve/cancel/confirm.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const cancelForm = document.getElementById('cancelForm');

	cancelForm.addEventListener('submit', function(e) {
		e.preventDefault();

		const cancelConfirmed = confirm('해당 예매내역을 취소하시겠습니까?');
		if (cancelConfirmed) {
			fetch(`${ctp}/my/reserve/cancel`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				body: JSON.stringify({
					reservationId: reservationId
				}),
			})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						window.location.href = `${ctp}/my/reserve/cancel/completed?reservationId=${reservationId}`;
					} else {
						alert('취소 처리 중 오류가 발생했습니다: ' + data.message);
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('취소 요청 중 오류가 발생했습니다.');
				});
		}
	});
});