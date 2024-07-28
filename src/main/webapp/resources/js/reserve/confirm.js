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
				event.preventDefault(); // Prevent default label behavior
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
	const paymentButton = document.querySelector('.btn.btn_full_point');
	paymentButton.addEventListener('click', function(e) {
		e.preventDefault();

		// 체크박스 유효성 검사
		const checkboxIds = ['agree1', 'agree2', 'agree3', 'agree4', 'agree5'];
		const checkboxMessages = {
			'agree1': '주문자 확인 및 휴대폰번호 수집을 확인하셔야 결제가 가능합니다.',
			'agree2': '제 3자 정보 제공에 동의하셔야만 결제가 가능합니다.',
			'agree3': 'KBO리그 SAFE 캠페인에 동의하셔야만 결제가 가능합니다.',
			'agree4': '프로스포츠 암표 근절 및 암표 매매에 따른 제재사항 안내에 동의하셔야만 결제가 가능합니다.',
			'agree5': '취소수수료 및 취소기한 내용에 동의하셔야만 결제가 가능합니다.'
		};

		for (let id of checkboxIds) {
			const checkbox = document.getElementById(id);
			if (!checkbox.checked) {
				alert(checkboxMessages[id]);
				return;
			}
		}

		// 결제 정보 가져오기
		const homeTeam = document.getElementById('homeTeam').value;
		const awayTeam = document.getElementById('awayTeam').value;
		const totalAmount = parseInt(document.getElementById('totalAmount').value);
		const buyerEmail = document.getElementById('buyerEmail').value;
		const buyerName = document.getElementById('buyerName').value;
		const buyerTel = document.getElementById('buyerTel').value;

		// 결제 API 호출
		const IMP = window.IMP;
		IMP.init("imp81328707");

		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",
			pay_method: "card",
			merchant_uid: "javaclassS8_" + new Date().getTime(),
			name: `${homeTeam} vs ${awayTeam}`,
			amount: totalAmount,
			buyer_email: buyerEmail,
			buyer_name: buyerName,
			buyer_tel: buyerTel,
		}, function(rsp) {
			if (rsp.success) {
				// 결제 성공 시 서버에 결제 정보 전송
				fetch(`${ctp}/reserve/complete`, {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify({
						imp_uid: rsp.imp_uid,
						merchant_uid: rsp.merchant_uid,
						member_id: memberId,
						game_id: gameId,
						total_amount: totalAmount,
						ticket_amount: ticketAmount,
						booking_fee: bookingFee,
						seats: selectedSeats.map(seat => ({
							seat_id: seat.id,
							ticket_type_id: seat.ticketTypeId,
							price: seat.price
						}))
					}),
				})
					.then(response => response.json())
					.then(data => {
						if (data.success) {
							window.location.href = `${ctp}/reserve/completed`;
						} else {
							alert('결제는 성공했으나 서버 처리 중 오류가 발생했습니다.');
						}
					})
					.catch(error => {
						console.error('Error:', error);
						alert('결제는 성공했으나 서버 처리 중 오류가 발생했습니다.');
					});
			} else {
				alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
			}
		});
	});
});