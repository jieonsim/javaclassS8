/**
 * js/sports/reserve/price.js
 */
document.addEventListener('DOMContentLoaded', function() {
	// 전역 변수
	const bookingFeePerTicket = parseFloat(document.getElementById('bookingFeePerTicket').getAttribute('data-booking-fee'));

	// 유틸리티 함수
	function calculateTotalSelected() {
		return Array.from(document.querySelectorAll('.select._price_cnt'))
			.reduce((total, element) => total + parseInt(element.textContent, 10), 0);
	}

	function updateBookingInfo() {
		let totalTicketPrice = 0;
		let totalQuantity = 0;
		let advanceTicketQuantity = 0;

		document.querySelectorAll('.select_list li._selected').forEach(function(selectedLi) {
			const price = parseInt(selectedLi.getAttribute('data-price'), 10);
			const quantity = parseInt(selectedLi.getAttribute('data-value'), 10);
			const certificationCode = selectedLi.getAttribute('data-certification-code');

			totalTicketPrice += price * quantity;
			totalQuantity += quantity;

			if (certificationCode === 'ADVANCE_TICKET') {
				// 스포츠 예매권 선택 시 총 수량에 추가
				advanceTicketQuantity += quantity;
			}
		});

		// 체크된 스포츠 예매권 계산
		let checkedAdvanceTicketQuantity = 0;
		document.querySelectorAll('input[name="ticket_checkbox"]:checked').forEach(function(checkbox) {
			checkedAdvanceTicketQuantity++;
		});

		// 체크된 스포츠 예매권 수만큼 티켓 금액과 수량에서 제외
		const advanceTicketPrice = parseInt(document.querySelector('.select_list li[data-certification-code="ADVANCE_TICKET"]').getAttribute('data-price'), 10);
		totalTicketPrice -= advanceTicketPrice * checkedAdvanceTicketQuantity;

		// 예매 수수료 계산
		const totalBookingFee = bookingFeePerTicket * (totalQuantity - checkedAdvanceTicketQuantity);

		// 총 결제 금액 계산
		const totalAmount = totalTicketPrice + totalBookingFee;

		// 화면 업데이트
		document.getElementById('_price_ticket').textContent = totalTicketPrice.toLocaleString() + '원';
		document.getElementById('_price_fee').textContent = totalBookingFee.toLocaleString() + '원';
		document.getElementById('_price_amount').textContent = totalAmount.toLocaleString() + '원';
	}

	// 체크박스 이벤트 리스너 수정
	function addCheckboxEventListener(checkbox) {
		checkbox.addEventListener('change', function() {
			const span = this.closest('.checkbox');
			span.classList.toggle('checked', this.checked);
			updateBookingInfo();
		});
	}


	// 초기화 함수
	function initializeSelectBoxes() {
		document.querySelectorAll('.select._price_cnt').forEach(function(selectElement) {
			selectElement.addEventListener('click', function(e) {
				e.preventDefault();
				this.closest('.selectbox').classList.toggle('is-active');
			});
		});

		document.querySelectorAll('.select_list li').forEach(function(liElement) {
			liElement.addEventListener('click', function(e) {
				e.preventDefault();
				const selectedValue = parseInt(this.querySelector('a').textContent, 10);
				const selectBox = this.closest('.selectbox');
				const priceCnt = selectBox.querySelector('.select._price_cnt');
				const previousValue = parseInt(priceCnt.textContent, 10);
				const quantity = parseInt(selectBox.querySelector('.select_list').getAttribute('data-limit-count'), 10);

				if (calculateTotalSelected() - previousValue + selectedValue > quantity) {
					alert('좌석 매수를 초과하여 권종을 선택할 수 없습니다.');
					return;
				}

				// 스포츠 예매권인 경우 예매권 리스트 업데이트
				if (this.getAttribute('data-certification-code') === 'ADVANCE_TICKET') {
					const ticketTypeId = this.closest('.select_list').id.replace('selectList', '');
					renderAdvanceTickets(ticketTypeId);
				}

				priceCnt.textContent = selectedValue;
				selectBox.classList.remove('is-active');
				selectBox.querySelectorAll('.select_list li').forEach(item => item.classList.remove('_selected'));
				this.classList.add('_selected');
				updateBookingInfo();
			});
		});
	}

	function initializeCertifyButtons() {
		document.querySelectorAll('.btn_ly._certifyDivButton').forEach(button => {
			button.addEventListener('click', function() {
				const ticketTypeId = this.getAttribute('data-ticketType-id');
				const selectedQuantity = parseInt(this.closest('tr').querySelector('.select._price_cnt').textContent, 10);

				if (selectedQuantity === 0) {
					alert('권종 매수를 선택해주세요.');
					return;
				}

				this.classList.toggle('close');
				this.classList.toggle('open');
				const blindSpan = this.querySelector('.blind');
				if (this.classList.contains('open')) {
					blindSpan.textContent = '인증영역 닫기';
					showCertificationArea(this, ticketTypeId);
				} else {
					blindSpan.textContent = '인증영역 열기';
					hideCertificationArea(ticketTypeId);
				}
			});
		});
	}

	// 인증 영역 관련 함수
	function showCertificationArea(button, ticketTypeId) {
		const certificationHTML = `
            <tr>
                <td colspan="4" class="td_ly" id="certify${ticketTypeId}" style="display: table-cell;">
                    <div class="confirm_area _coupon">
                        <div class="cnfbx">
                            <div class="cell">
                                <span class="inp_tx">
                                    <label for="ticket_num">예매권번호</label>
                                    <input type="text" id="ticket_num" value="">
                                </span>
                            </div>
                            <div class="cell" style="width: 62px">
                                <button type="button" class="btn btn_blank" data-certification-code="ADVANCE_TICKET">
                                    <span>등록하기</span>
                                </button>
                            </div>
                        </div>
                        <table class="table3">
                            <caption><span>권종인증 리스트</span></caption>
                            <colgroup>
                                <col style="width: 15%"><col style="width: 45%">
                                <col style="width: 20%"><col style="width: 20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">선택</th><th scope="col">예매권번호</th>
                                    <th scope="col">사용가능매수</th><th scope="col">유효기간</th>
                                </tr>
                            </thead>
                            <tbody id="coupon${ticketTypeId}"></tbody>
                        </table>
                    </div>
                </td>
            </tr>
        `;

		button.closest('tr').insertAdjacentHTML('afterend', certificationHTML);
		//renderAdvanceTickets(ticketTypeId);
		//initializeTicketInput(ticketTypeId);
		// certify 요소가 생성되었는지 확인
		const certifyElement = document.getElementById(`certify${ticketTypeId}`);
		if (certifyElement) {
			console.log('Certify element created successfully');
			renderAdvanceTickets(ticketTypeId);
			initializeTicketInput(ticketTypeId);
		} else {
			console.error('Failed to create certify element');
		}
	}

	function initializeTicketInput(ticketTypeId) {
		const ticketNumberInput = document.getElementById('ticket_num');
		const ticketNumberLabel = document.querySelector('label[for="ticket_num"]');

		ticketNumberInput.addEventListener('focus', () => ticketNumberLabel.style.display = 'none');
		ticketNumberInput.addEventListener('blur', () => {
			if (ticketNumberInput.value === '') ticketNumberLabel.style.display = '';
		});

		const registerButton = document.querySelector(`#certify${ticketTypeId} .btn.btn_blank`);
		if (registerButton) {
			registerButton.addEventListener('click', () => validateAndRegisterTicket(ticketTypeId));
		}
	}

	function validateAndRegisterTicket(ticketTypeId) {
		let advanceTicketNumber = document.getElementById('ticket_num').value.replace(/-/g, '');

		if (!/^\d{16}$/.test(advanceTicketNumber)) {
			alert('유효하지 않은 예매권 번호입니다.');
			return;
		}

		fetch(`${ctp}/sports/reserve/validateAdvanceTicket`, {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ advanceTicketNumber })
		})
			.then(response => response.json())
			.then(data => {
				if (data.valid) {
					registerAdvanceTicket(advanceTicketNumber, ticketTypeId);
				} else {
					alert(data.message || '유효하지 않은 예매권 번호입니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('예매권 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
			});
	}

	function registerAdvanceTicket(advanceTicketNumber, ticketTypeId) {
		fetch(`${ctp}/sports/reserve/registerAdvanceTicket`, {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ advanceTicketNumber })
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('예매권이 성공적으로 등록되었습니다.');
					addNewTicketToList(data.ticket, ticketTypeId);
				} else {
					alert(data.message || '예매권 등록에 실패했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('예매권 등록 중 오류가 발생했습니다. 다시 시도해주세요.');
			});
	}

	function addNewTicketToList(newTicket, ticketTypeId) {
		const couponBody = document.getElementById(`coupon${ticketTypeId}`);
		const newRow = document.createElement('tr');
		newRow.innerHTML = `
            <td>
                <span class="checkbox">
                    <input type="checkbox" id="ticket_${newTicket.advanceTicketNumber}" name="ticket_checkbox">
                </span>
            </td>
            <td class="number">${newTicket.advanceTicketNumber}</td>
            <td>1매</td>
            <td>${newTicket.formattedExpiresAt}</td>
        `;

		couponBody.insertBefore(newRow, couponBody.firstChild);
		document.getElementById('ticket_num').value = '';

		const noDataRow = couponBody.querySelector('._noData');
		if (noDataRow) noDataRow.remove();

		addCheckboxEventListener(newRow.querySelector('input[type="checkbox"]'));
	}

	function renderAdvanceTickets(ticketTypeId) {
		console.log('Rendering advance tickets for ticketTypeId:', ticketTypeId);
		let couponBody = document.getElementById(`coupon${ticketTypeId}`);

		if (!couponBody) {
			console.log('Coupon body not found, creating one');
			const certifyArea = document.getElementById(`certify${ticketTypeId}`);
			if (certifyArea) {
				const table = certifyArea.querySelector('table');
				if (table) {
					couponBody = document.createElement('tbody');
					couponBody.id = `coupon${ticketTypeId}`;
					table.appendChild(couponBody);
				} else {
					console.error('Table not found in certify area');
					return;
				}
			} else {
				console.error('Certify area not found');
				return;
			}
		}

		const advanceTickets = window.advanceTicketsData || [];
		const selectedQuantity = getSelectedQuantity(ticketTypeId);

		console.log('Advance tickets:', advanceTickets);
		console.log('Selected quantity:', selectedQuantity);

		if (advanceTickets.length === 0) {
			couponBody.innerHTML = '<tr class="_noData"><td colspan="4">예매권을 등록해주세요.</td></tr>';
		} else {
			couponBody.innerHTML = advanceTickets.map(ticket => `
            <tr>
                <td>
                    <span class="checkbox">
                        <input type="checkbox" id="ticket_${ticket.advanceTicketNumber}" name="ticket_checkbox" data-ticket-number="${ticket.advanceTicketNumber}">
                    </span>
                </td>
                <td class="number">${ticket.advanceTicketNumber}</td>
                <td>1매</td>
                <td>${ticket.formattedExpiresAt}</td>
            </tr>
        `).join('');
		}

		couponBody.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
			checkbox.addEventListener('change', function(event) {
				const checkedCount = couponBody.querySelectorAll('input[type="checkbox"]:checked').length;
				if (checkedCount > selectedQuantity) {
					alert('선택한 예매권 매수를 초과하여 선택할 수 없습니다.');
					this.checked = false;
					return;
				}
				const span = this.closest('.checkbox');
				span.classList.toggle('checked', this.checked);
				updateBookingInfo();
			});
		});
	}

	// 추가
	function getSelectedQuantity(ticketTypeId) {
		const selectElement = document.querySelector(`#selectList${ticketTypeId} .select._price_cnt`);
		return selectElement ? parseInt(selectElement.textContent, 10) : 0;
	}

	function hideCertificationArea(ticketTypeId) {
		const certificationArea = document.getElementById(`certify${ticketTypeId}`);
		if (certificationArea) certificationArea.closest('tr').remove();
	}

	// 초기화
	initializeSelectBoxes();
	initializeCertifyButtons();
	updateBookingInfo();
});