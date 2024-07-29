/*js/reserve/confirm.js */
document.addEventListener('DOMContentLoaded', function() {
	// 예매자 확인 및 취소수수료 동의 체크박스
	document.querySelectorAll('.checkbox').forEach(span => {
		const checkbox = span.querySelector('input[type="checkbox"]');

		const toggleCheckbox = () => {
			checkbox.checked = !checkbox.checked;
			span.classList.toggle('checked', checkbox.checked);
		};

		span.addEventListener('click', toggleCheckbox);

		const label = document.querySelector(`label[for="${checkbox.id}"]`);
		if (label) {
			label.addEventListener('click', (event) => {
				event.preventDefault();
				toggleCheckbox();
			});
		}
	});

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

	// 레이어 외부 클릭 시 레이어 숨김
	document.addEventListener('click', function(e) {
		if (!cancelCommisonNotice.contains(e.target) && e.target !== cancelCommisonNoticeBtn) {
			cancelCommisonNotice.style.display = 'none';
		}
	});

	// 결제하기 버튼 클릭 이벤트
	const paymentButton = document.getElementById('paymentButton');

	paymentButton.addEventListener('click', function(e) {
		e.preventDefault();

		// 체크박스 유효성 검사
		const checkboxIds = ['reserve_agree1', 'reserve_agree2', 'reserve_agree3', 'reserve_agree4', 'reserve_agree5'];
		for (let id of checkboxIds) {
			const checkboxSpan = document.querySelector(`#${id}`).closest('.checkbox');
			if (checkboxSpan && !checkboxSpan.classList.contains('checked')) {
				alert(checkboxMessages[id]);
				return;
			}
		}

		// 티켓 타입 데이터 수집
		let ticketTypes = [];
		document.querySelectorAll('input[name="ticketType"]').forEach((input, index) => {
			ticketTypes.push({
				ticketTypeId: parseInt(document.querySelectorAll('input[name="ticketTypeId"]')[index].value),
				ticketQuantity: parseInt(document.querySelectorAll('input[name="ticketQuantity"]')[index].value)
			});
		});

		// 예매권 번호 수집
		let advanceTicketNumbers = Array.from(document.querySelectorAll('input[name="advanceTicketNumber"]')).map(input => input.value);

		// 요청 데이터 객체 생성
		const requestData = {
			memberId: parseInt(document.querySelector('input[name="memberId"]').value),
			gameId: parseInt(document.querySelector('input[name="gameId"]').value),
			seatId: parseInt(document.querySelector('input[name="seatId"]').value),
			totalAmount: parseInt(document.querySelector('input[name="totalAmount"]').value),
			ticketAmount: parseInt(document.querySelector('input[name="ticketAmount"]').value),
			bookingFee: parseInt(document.querySelector('input[name="bookingFee"]').value),
			ticketTypes: Array.from(document.querySelectorAll('input[name="ticketType"]')).map((input, index) => ({
				ticketTypeId: parseInt(document.querySelectorAll('input[name="ticketTypeId"]')[index].value),
				ticketQuantity: parseInt(document.querySelectorAll('input[name="ticketQuantity"]')[index].value)
			})),
			advanceTicketNumbers: Array.from(document.querySelectorAll('input[name="advanceTicketNumber"]')).map(input => input.value),
			advanceTicketIds: Array.from(document.querySelectorAll('input[name="advanceTicketId"]')).map(input => parseInt(input.value))
		};

		if (requestData.totalAmount === 0) {
			// 결제 금액이 0원일 경우 결제없이 바로 예매 처리
			processReservation(requestData);
		} else {
			// 결제 API 호출
			const IMP = window.IMP;
			IMP.init("imp81328707");

			IMP.request_pay({
				pg: "html5_inicis.INIpayTest",
				pay_method: "card",
				merchant_uid: "javaclassS8_" + new Date().getTime(),
				name: `${homeTeam} vs ${awayTeam}`,
				amount: requestData.totalAmount,
				buyer_email: buyerEmail,
				buyer_name: buyerName,
				buyer_tel: buyerTel,
			}, function(rsp) {
				if (rsp.success) {
					// 결제 성공 시 서버에 데이터 전송
					processReservation(requestData);
				} else {
					alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
				}
			});
		}
	});

	// 예매 처리 함수
	function processReservation(requestData) {
		fetch(`${ctp}/reserve/paymentAndReserve`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(requestData)
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					window.location.href = `${ctp}/reserve/completed?reservationNumber=${data.reservationNumber}`;
				} else {
					alert('예약 처리 중 오류가 발생했습니다: ' + data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('서버 통신 중 오류가 발생했습니다.');
			});
	}

	// 이전 단계 버튼 처리
	const prevStepBtn = document.querySelector('.reserve_btn .btn_blank');
	prevStepBtn.addEventListener('click', function(e) {
		e.preventDefault();

		if (confirm('이전 단계로 돌아가면 현재의 예매 정보를 잃게 됩니다. 계속하시겠습니까?')) {
			window.location.href = `${ctp}/reserve/price`;
		}
	});
});