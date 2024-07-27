/**
 * js/sports/reserve/price.js
 */
document.addEventListener('DOMContentLoaded', function() {
	// 매수 선택 셀렉트 박스 토글 처리
	document.querySelectorAll('.select._price_cnt').forEach(function(selectElement) {
		selectElement.addEventListener('click', function(e) {
			e.preventDefault();
			const selectBox = selectElement.closest('.selectbox');
			selectBox.classList.toggle('is-active');
		});
	});

	// 각 권종에서 선택한 매수를 누적하기
	function calculateTotalSelected() {
		let totalSelected = 0;
		document.querySelectorAll('.select._price_cnt').forEach(function(selectElement) {
			totalSelected += parseInt(selectElement.textContent, 10);
		});
		console.log("Total selected quantity: " + totalSelected);
		return totalSelected;
	}


	// 예매 정보 업데이트 함수
	function updateBookingInfo() {
		let totalTicketPrice = 0;
		let totalQuantity = 0;
		let advanceTicketQuantity = 0;

		// 선택된 일반 티켓 계산
		document.querySelectorAll('.select_list li._selected').forEach(function(selectedLi) {
			const price = parseInt(selectedLi.getAttribute('data-price'), 10);
			const quantity = parseInt(selectedLi.getAttribute('data-value'), 10);
			const certificationCode = selectedLi.getAttribute('data-certification-code');

			if (certificationCode !== 'ADVANCE_TICKET') {
				totalTicketPrice += price * quantity;
				totalQuantity += quantity;
			}
		});

		// 체크된 스포츠 예매권 계산
		document.querySelectorAll('input[name="ticket_checkbox"]:checked').forEach(function(checkbox) {
			advanceTicketQuantity++;
		});

		// 예매 수수료 계산
		const bookingFeePerTicket = parseFloat(document.getElementById('bookingFeePerTicket').getAttribute('data-booking-fee'));
		const totalBookingFee = bookingFeePerTicket * (totalQuantity - advanceTicketQuantity);

		// 총 결제 금액 계산
		const totalAmount = totalTicketPrice + totalBookingFee;

		// 화면 업데이트
		document.getElementById('_price_ticket').textContent = totalTicketPrice.toLocaleString() + '원';
		document.getElementById('_price_fee').textContent = totalBookingFee.toLocaleString() + '원';
		document.getElementById('_price_amount').textContent = totalAmount.toLocaleString() + '원';
	}

	// 스포츠 예매권 체크박스 이벤트 리스너
	function addCheckboxEventListener(checkbox) {
		checkbox.addEventListener('change', function() {
			const span = this.closest('.checkbox');
			span.classList.toggle('checked', this.checked);
			updateBookingInfo();
		});
	}

	// 기존의 체크박스에 이벤트 리스너 추가
	document.querySelectorAll('input[name="ticket_checkbox"]').forEach(addCheckboxEventListener);

	// 매수 선택
	document.querySelectorAll('.select_list li').forEach(function(liElement) {
		// 선택한 매수를 .select _price_cnt에 value로 세팅, 매수 선택 시 _selected 클래스 추가
		liElement.addEventListener('click', function(e) {
			e.preventDefault();
			const selectedValue = parseInt(liElement.querySelector('a').textContent, 10);
			const selectBox = liElement.closest('.selectbox');
			const priceCnt = selectBox.querySelector('.select._price_cnt');
			const previousValue = parseInt(priceCnt.textContent, 10);

			const selectList = selectBox.querySelector('.select_list');
			const quantityAttr = selectList ? selectList.getAttribute('data-limit-count') : null;
			const quantity = parseInt(quantityAttr, 10);

			const totalSelected = calculateTotalSelected() - previousValue + selectedValue;
			console.log("New total after selection: " + totalSelected); // Debugging: Log new total

			// 각 권종의 매수 누적합이 depth1에서 선택한 매수보다 초과하였을 때
			if (totalSelected > quantity) {
				alert('좌석 매수를 초과하여 권종을 선택할 수 없습니다.');
				return;
			}

			priceCnt.textContent = selectedValue;
			selectBox.classList.remove('is-active');

			const listItems = selectBox.querySelectorAll('.select_list li');
			listItems.forEach(function(item) {
				item.classList.remove('_selected');
			});

			// 매수 선택 시 Add _selected class to the clicked li element
			liElement.classList.add('_selected');

			// 예매 정보 업데이트
			updateBookingInfo();
		});
	});

	// 초기 예매 정보 설정
	updateBookingInfo();

	// 스포츠 예매권 버튼 토글 기능
	const certifyButtons = document.querySelectorAll('.btn_ly._certifyDivButton');

	certifyButtons.forEach(button => {
		button.addEventListener('click', function() {
			const ticketTypeId = this.getAttribute('data-ticketType-id');
			const selectElement = this.closest('tr').querySelector('.select._price_cnt');

			if (!selectElement) {
				console.error('Select element not found');
				return;
			}

			const selectedQuantity = parseInt(selectElement.textContent, 10);

			if (selectedQuantity === 0) {
				alert('권종 매수를 선택해주세요.');
				return;
			}

			// 클래스 토글
			this.classList.toggle('close');
			this.classList.toggle('open');

			// 버튼 내부 텍스트 변경
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
                        <caption>
                            <span>권종인증 리스트</span>
                        </caption>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 45%">
                            <col style="width: 20%">
                            <col style="width: 20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">예매권번호</th>
                                <th scope="col">사용가능매수</th>
                                <th scope="col">유효기간</th>
                            </tr>
                        </thead>
                        <tbody id="coupon${ticketTypeId}">
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    `;

		const parentRow = button.closest('tr');
		parentRow.insertAdjacentHTML('afterend', certificationHTML);

		// 예매권 목록 렌더링
		renderAdvanceTickets(ticketTypeId);

		const ticketNumberInput = document.getElementById('ticket_num');
		const ticketNumberLabel = document.querySelector('label[for="ticket_num"]');

		// focus 이벤트: 입력 필드를 클릭하면 라벨 텍스트를 숨깁니다.
		ticketNumberInput.addEventListener('focus', function() {
			ticketNumberLabel.style.display = 'none';
		});

		// blur 이벤트: 입력 필드에서 포커스가 벗어나면 입력값이 없을 때만 라벨 텍스트를 다시 표시합니다.
		ticketNumberInput.addEventListener('blur', function() {
			if (this.value === '') {
				ticketNumberLabel.style.display = '';
			}
		});

		// 예매권 등록 버튼에 이벤트 리스너 추가
		const registerButton = document.querySelector(`#certify${ticketTypeId} .btn.btn_blank`);

		if (registerButton) {
			registerButton.addEventListener('click', function() {
				let advanceTicketNumber = ticketNumberInput.value.replace(/-/g, '');

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
				fetch(`${ctp}/sports/reserve/validateAdvanceTicket`, {
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
							registerAdvanceTicket(advanceTicketNumber, ticketTypeId);
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
		}
	}

	function registerAdvanceTicket(advanceTicketNumber, ticketTypeId) {
		fetch(`${ctp}/sports/reserve/registerAdvanceTicket`, {
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
					// 새로운 티켓을 기존 리스트에 추가
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

		// 첫 번째 자식 요소로 새 행을 추가
		couponBody.insertBefore(newRow, couponBody.firstChild);

		// 입력 필드 초기화
		document.getElementById('ticket_num').value = '';

		// "예매권을 등록해주세요" 메시지가 있다면 제거
		const noDataRow = couponBody.querySelector('._noData');
		if (noDataRow) {
			noDataRow.remove();
		}

		// 체크박스 이벤트 리스너 추가
		const checkbox = newRow.querySelector('input[type="checkbox"]');
		checkbox.addEventListener('change', function() {
			const span = this.closest('.checkbox');
			span.classList.toggle('checked', this.checked);
		});
	}

	function renderAdvanceTickets(ticketTypeId) {
		const couponBody = document.getElementById(`coupon${ticketTypeId}`);
		const advanceTickets = window.advanceTicketsData || [];

		if (advanceTickets.length === 0) {
			couponBody.innerHTML = `
            <tr class="_noData">
                <td colspan="4">예매권을 등록해주세요.</td>
            </tr>
        `;
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

		// 이벤트 리스너를 부모 요소에 추가 (이벤트 위임 사용)
		couponBody.addEventListener('click', function(event) {
			const span = event.target.closest('.checkbox');
			if (span) {
				const checkbox = span.querySelector('input[type="checkbox"]');
				if (checkbox) {
					checkbox.checked = !checkbox.checked;
					span.classList.toggle('checked', checkbox.checked);
				}
			}
		});
	}

	function hideCertificationArea(ticketTypeId) {
		const certificationArea = document.getElementById(`certify${ticketTypeId}`);
		if (certificationArea) {
			certificationArea.closest('tr').remove();
		}
	}

});

