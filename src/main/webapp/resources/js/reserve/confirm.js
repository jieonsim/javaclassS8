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
	const paymentForm = document.getElementById('paymentForm');

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
				// 결제 성공 시 폼 제출
				paymentForm.submit();
			} else {
				alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
			}
		});
	});
});