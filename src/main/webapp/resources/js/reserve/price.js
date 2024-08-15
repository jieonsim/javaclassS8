/*js/reserve/prcie.js */
document.addEventListener('DOMContentLoaded', function() {
	const bookingFeePerTicketElement = document.getElementById('bookingFeePerTicket');
	const bookingFeePerTicket = bookingFeePerTicketElement ? parseFloat(bookingFeePerTicketElement.getAttribute('data-booking-fee')) : 0;

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
				advanceTicketQuantity += quantity;
			}
		});

		let checkedAdvanceTicketQuantity = 0;
		document.querySelectorAll('input[name="ticket_checkbox"]:checked').forEach(function(checkbox) {
			checkedAdvanceTicketQuantity++;
		});

		const advanceTicketElement = document.querySelector('.select_list li[data-certification-code="ADVANCE_TICKET"]');
		if (advanceTicketElement) {
			const advanceTicketPrice = parseInt(advanceTicketElement.getAttribute('data-price'), 10);
			totalTicketPrice -= advanceTicketPrice * checkedAdvanceTicketQuantity;
		}

		const totalBookingFee = bookingFeePerTicket * (totalQuantity - checkedAdvanceTicketQuantity);

		const totalAmount = totalTicketPrice + totalBookingFee;

		document.getElementById('_price_ticket').textContent = totalTicketPrice.toLocaleString() + '원';
		document.getElementById('_price_fee').textContent = totalBookingFee.toLocaleString() + '원';
		document.getElementById('_price_amount').textContent = totalAmount.toLocaleString() + '원';
	}


	// 초기화 함수 수정
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

				priceCnt.textContent = selectedValue;
				selectBox.classList.remove('is-active');
				selectBox.querySelectorAll('.select_list li').forEach(item => item.classList.remove('_selected'));
				this.classList.add('_selected');
				updateBookingInfo();

				const certifyButton = selectBox.closest('tr').querySelector('.btn_ly._certifyDivButton');
				const ticketTypeId = this.getAttribute('data-ticketType-id');
				if (certifyButton) {
					certifyButton.setAttribute('data-ticketType-id', ticketTypeId);
					// 선택된 매수가 변경되면 예매권 체크박스 상태 초기화
					document.querySelectorAll(`#coupon${ticketTypeId} input[name="ticket_checkbox"]`).forEach(checkbox => {
						checkbox.checked = false;
						checkbox.closest('.checkbox').classList.remove('checked');
					});
					updateBookingInfo();
				}
			});
		});
	}

	function initializeCertifyButtons() {
		document.querySelectorAll('.btn_ly._certifyDivButton').forEach(button => {
			button.addEventListener('click', function() {
				const ticketTypeId = this.getAttribute('data-ticketType-id');
				console.log('Certify Button Ticket Type ID:', ticketTypeId); // 디버깅을 위해 추가
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
					showCertificationArea(this, ticketTypeId, selectedQuantity);
				} else {
					blindSpan.textContent = '인증영역 열기';
					hideCertificationArea(ticketTypeId);
				}
			});
		});
	}

	function showCertificationArea(button, ticketTypeId, selectedQuantity) {
		console.log('showCertificationArea Ticket Type ID:', ticketTypeId);
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
		renderAdvanceTickets(ticketTypeId, selectedQuantity);
		initializeTicketInput(ticketTypeId);
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

		fetch(`${ctp}/reserve/validateAdvanceTicket`, {
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
		fetch(`${ctp}/reserve/registerAdvanceTicket`, {
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
                <input type="checkbox" id="ticket_${newTicket.advanceTicketNumber}" name="ticket_checkbox" data-ticket-number="${newTicket.advanceTicketNumber}" data-ticket-id="${newTicket.id}">
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

		// 새로 추가된 체크박스에 이벤트 리스너 추가
		const checkbox = newRow.querySelector('.checkbox');
		checkbox.addEventListener('click', function(e) {
			const input = this.querySelector('input[type="checkbox"]');
			input.checked = !input.checked;
			const selectedQuantity = parseInt(document.querySelector(`#selectList${ticketTypeId} li._selected`).getAttribute('data-value'), 10);
			const checkedCount = document.querySelectorAll(`#coupon${ticketTypeId} input[name="ticket_checkbox"]:checked`).length;

			// 매수 체크 로직
			if (checkedCount > selectedQuantity) {
				alert('선택한 매수 이상의 예매권을 사용할 수 없습니다.');
				input.checked = false;
			}
			this.classList.toggle('checked', input.checked);
			updateBookingInfo();
			e.preventDefault(); // 이벤트 전파 방지
		});

		// 전역 advanceTicketsData 업데이트
		if (!window.advanceTicketsData) {
			window.advanceTicketsData = [];
		}
		window.advanceTicketsData.push(newTicket);

		updateBookingInfo();
	}

	function renderAdvanceTickets(ticketTypeId, selectedQuantity) {
		const couponBody = document.getElementById(`coupon${ticketTypeId}`);
		const advanceTickets = window.advanceTicketsData || [];

		if (advanceTickets.length === 0) {
			couponBody.innerHTML = '<tr class="_noData"><td colspan="4">예매권을 등록해주세요.</td></tr>';
		} else {
			couponBody.innerHTML = advanceTickets.map(ticket => `
            <tr>
                <td>
                    <span class="checkbox">
                        <input type="checkbox" id="ticket_${ticket.advanceTicketNumber}" name="ticket_checkbox" data-ticket-number="${ticket.advanceTicketNumber}" data-ticket-id="${ticket.id}">
                    </span>
                </td>
                <td class="number">${ticket.advanceTicketNumber}</td>
                <td>1매</td>
                <td>${ticket.formattedExpiresAt}</td>
            </tr>
        `).join('');
		}

		// 체크박스 이벤트 리스너 추가
		document.querySelectorAll(`#coupon${ticketTypeId} .checkbox`).forEach(function(checkbox) {
			checkbox.addEventListener('click', function(e) {
				const input = this.querySelector('input[type="checkbox"]');
				input.checked = !input.checked;
				const selectedQuantity = parseInt(document.querySelector(`#selectList${ticketTypeId} li._selected`).getAttribute('data-value'), 10);
				const checkedCount = document.querySelectorAll(`#coupon${ticketTypeId} input[name="ticket_checkbox"]:checked`).length;
				if (checkedCount > selectedQuantity) {
					alert('선택한 매수 이상의 예매권을 사용할 수 없습니다.');
					input.checked = false;
				}
				this.classList.toggle('checked', input.checked);
				updateBookingInfo();
				e.preventDefault(); // 이벤트 전파 방지
			});
		});
	}

	function hideCertificationArea(ticketTypeId) {
		const certificationArea = document.getElementById(`certify${ticketTypeId}`);
		if (certificationArea) certificationArea.closest('tr').remove();
	}


	// 취소 수수료 상세보기
	const cancelCommisonNoticeBtn = document.getElementById('cancelCommisonNoticeBtn');
	const cancelCommisonNotice = document.getElementById('cancelCommisonNotice');
	const closeBtn = cancelCommisonNotice.querySelector('.close');

	// 상세보기 버튼 클릭 시 레이어 표시
	cancelCommisonNoticeBtn.addEventListener('click', function(e) {
		e.preventDefault(); // 기본 동작 방지
		cancelCommisonNotice.style.display = 'block';
	});

	// 닫기 버튼 클릭 시 레이어 숨김
	closeBtn.addEventListener('click', function(e) {
		e.preventDefault(); // 기본 동작 방지
		cancelCommisonNotice.style.display = 'none';
	});

	// 레이어 외부 클릭 시 레이어 숨김 (선택적)
	document.addEventListener('click', function(e) {
		if (!cancelCommisonNotice.contains(e.target) && e.target !== cancelCommisonNoticeBtn) {
			cancelCommisonNotice.style.display = 'none';
		}
	});


	// 이전 단계 버튼 처리
	const prevStepBtn = document.querySelector('.reserve_btn .btn_blank');
	prevStepBtn.addEventListener('click', function(e) {
		e.preventDefault();

		if (confirm('이전 단계로 돌아가면 현재의 예매 정보를 잃게 됩니다. 계속하시겠습니까?')) {
			// 세션 스토리지에 캡챠 인증 완료 상태 저장
			sessionStorage.setItem('captchaVerified', 'true');

			// depth1으로 이동
			window.location.href = `${ctp}/reserve/seat?gameId=${gameId}`;
		}
	});

	// 다음 단계 버튼 처리
	const nextStepBtn = document.querySelector('.reserve_btn .btn_full');
	nextStepBtn.addEventListener('click', function(e) {
		e.preventDefault();

		const selectedTickets = [];
		let totalSelectedQuantity = 0;

		document.querySelectorAll('.select._price_cnt').forEach(function(select) {
			const quantity = parseInt(select.textContent);
			//console.log('Selected quantity:', quantity); // 디버깅용

			if (quantity > 0) {
				const selectList = select.nextElementSibling;
				const selectedOption = selectList.querySelector(`li[data-value="${quantity}"]`);

				if (selectedOption) {
					selectedTickets.push({
						type: selectedOption.getAttribute('data-certification-code'),
						quantity: quantity,
						price: parseInt(selectedOption.getAttribute('data-price')),
						ticketTypeId: parseInt(selectedOption.getAttribute('data-ticketType-id'))
					});
					totalSelectedQuantity += quantity;
				}
			}
		});

		//console.log('Total selected tickets:', selectedTickets.length); // 디버깅용
		//console.log('Total selected quantity:', totalSelectedQuantity); // 디버깅용

		if (selectedTickets.length === 0) {
			alert('티켓종류 및 매수를 선택해주세요.');
			return;
		}

		if (totalSelectedQuantity !== initialticketAmount) {
			alert('선택하신 좌석수와 예매하실 티켓매수가 일치하지 않습니다.');
			return;
		}

		const selectedAdvanceTickets = [];
		document.querySelectorAll('input[name="ticket_checkbox"]:checked').forEach(function(checkbox) {
			const id = checkbox.getAttribute('data-ticket-id');
			const number = checkbox.getAttribute('data-ticket-number');
			if (id && number) {  // id와 number가 모두 존재할 때만 추가
				selectedAdvanceTickets.push({
					id: id,
					number: number
				});
			}
		});

		const totalAdvanceTicketQuantity = selectedTickets.reduce((total, ticket) => {
			return ticket.type === 'ADVANCE_TICKET' ? total + ticket.quantity : total;
		}, 0);

		if (selectedAdvanceTickets.length !== totalAdvanceTicketQuantity) {
			alert('스포츠 예매권 등록 및 선택 후 예매가 가능합니다.');
			return;
		}

		const ticketSelectionData = {
			tickets: selectedTickets,
			selectedAdvanceTickets: selectedAdvanceTickets
		};

		//console.log('Ticket selection data:', ticketSelectionData); // 디버깅용

		fetch(`${ctp}/reserve/saveTicketSelection`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(ticketSelectionData)
		})
			.then(response => {
				console.log('Response status:', response.status);
				console.log('Response headers:', response.headers);
				return response.json();
			})
			.then(data => {
				console.log('Parsed data:', data);
				if (data.sessionExpired) {
					window.location.href = `${ctp}/error/reserve`;
					return;
				}
				if (data.success) {
					window.location.href = `${ctp}/reserve/confirm`;
				} else {
					alert(data.error || '티켓 선택 저장에 실패했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('서버 통신 중 오류가 발생했습니다.');
			});
	});

	function checkSessionExpiration() {
		fetch(`${ctp}/reserve/checkSession`)
			.then(response => response.json())
			.then(data => {
				if (data.sessionExpired) {
					window.location.href = `${ctp}/error/reserve`;
				}
			})
			.catch(error => console.error('Session check error:', error));
	}

	// 페이지 로드 시 세션 체크
	checkSessionExpiration();
	initializeSelectBoxes();
	initializeCertifyButtons();
	updateBookingInfo();
});