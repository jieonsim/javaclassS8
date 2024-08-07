/**
 * js/my/discount/advanceTicket.js
 */
document.addEventListener('DOMContentLoaded', function() {
	/* 예매권 등록 */
	const form = document.getElementById('advanceTicketRegisterForm');
	const input = document.getElementById('advanceTicketNoInput');

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		// 입력값에서 하이픈 제거
		let advanceTicketNumber = input.value.replace(/-/g, '');

		// 숫자만 입력되었는지 확인
		if (!/^\d+$/.test(advanceTicketNumber)) {
			alert('숫자만 입력해주세요.');
			return;
		}

		// 16자리인지 확인
		if (advanceTicketNumber.length !== 16) {
			alert('유효하지 않은 예매권 번호입니다.');
			return;
		}

		// 서버에 예매권 번호 유효성 검사 요청
		fetch(`${ctp}/my/discount/validateAdvanceTicket`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ advanceTicketNumber: advanceTicketNumber })
		})
			.then(response => response.json())
			.then(data => {
				if (data.valid) {
					// 유효한 예매권 번호인 경우, 등록 진행
					registerAdvanceTicket(advanceTicketNumber);
				} else {
					// 유효하지 않은 경우, 에러 메시지 표시
					alert(data.message || '유효하지 않은 예매권 번호입니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('예매권 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
			});
	});

	function registerAdvanceTicket(advanceTicketNumber) {
		fetch(`${ctp}/my/discount/registerAdvanceTicket`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ advanceTicketNumber: advanceTicketNumber })
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('예매권이 성공적으로 등록되었습니다.');
					location.reload();
				} else {
					alert(data.message || '예매권 등록에 실패했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('예매권 등록 중 오류가 발생했습니다. 다시 시도해주세요.');
			});
	}


	/* 예매권 리스트 필터 */
	const sortLinks = document.querySelectorAll('.mysort a');
	const ticketTable = document.querySelector('.basic_tbl table tbody');

	sortLinks.forEach(link => {
		link.addEventListener('click', function(e) {
			e.preventDefault();

			// 모든 링크에서 'on' 클래스 제거
			sortLinks.forEach(l => l.parentElement.classList.remove('on'));
			// 클릭된 링크에 'on' 클래스 추가
			this.parentElement.classList.add('on');

			const stateType = this.getAttribute('data-statetype');

			fetch(`${ctp}/my/discount/filterAdvanceTickets?stateType=${stateType}`)
				.then(response => response.json())
				.then(data => {
					updateTicketTable(data);
				})
				.catch(error => console.error('Error:', error));
		});
	});

	function updateTicketTable(tickets) {
		let html = '';
		if (tickets.length === 0) {
			html = `<tr>
                        <td class="no_data" colspan="5">
                            <div class="td">등록된 예매권이 없습니다.</div>
                        </td>
                    </tr>`;
		} else {
			tickets.forEach(ticket => {
				html += `<tr>
                            <td class="number">${ticket.advanceTicketNumber}</td>
                            <td>스포츠</td>
                            <td>1매</td>
                            <td class="color_black">${ticket.formattedExpiresAt}</td>
                            <td class="${ticket.statusClass}">${ticket.status}</td>
                        </tr>`;
			});
		}
		ticketTable.innerHTML = html;
	}
});