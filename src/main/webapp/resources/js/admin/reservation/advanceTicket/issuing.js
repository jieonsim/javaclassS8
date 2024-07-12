/**
 * /admin/reservation/advanaceTicket/issuing 예매권 발행하기
 */

document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('advanceTicketIssuingForm');

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const quantitySelect = document.getElementById('quantitySelect');
		const quantity = parseInt(quantitySelect.value);

		if (isNaN(quantity) || quantity < 1 || quantity > 10) {
			alert("올바른 예매권 매수를 선택해 주세요.");
			return;
		}

		fetch(ctp + '/admin/reservation/advanceTicket/issuing', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ quantity: quantity }),
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('서버 응답이 올바르지 않습니다.');
				}
				return response.json();
			})
			.then(data => {
				if (data.success) {
					alert(`${quantity}개의 예매권이 성공적으로 발행되었습니다.`);
					updateTicketList(data.newTickets);
					form.reset();
				} else {
					alert('예매권 발행 중 오류가 발생했습니다.' + (data.message ? ': ' + data.message : ''));
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('예매권 발행 요청 중 오류가 발생했습니다.');
			});
	});
});

function updateTicketList(newTickets) {
	const ticketList = document.getElementById('ticketList');
	if (!ticketList) {
		console.error('티켓 리스트 요소를 찾을 수 없습니다.');
		return;
	}

	newTickets.forEach(ticket => {
		const li = document.createElement('li');
		li.textContent = `예매권 번호: ${ticket.advanceTicketNumber}, 만료일: ${ticket.expiresAt}`;
		li.classList.add('new-ticket');
		ticketList.appendChild(li);

		// 새로 추가된 티켓에 강조 효과 주기
		setTimeout(() => {
			li.classList.remove('new-ticket');
		}, 3000);
	});
}