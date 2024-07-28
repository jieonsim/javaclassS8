document.addEventListener('DOMContentLoaded', function() {
	// 예매자 확인 및 취소수수료 동의 체크박스
	/*	document.querySelectorAll('.checkbox').forEach(span => {
			span.addEventListener('click', () => {
				const checkbox = span.querySelector('input[type="checkbox"]');
				checkbox.checked = !checkbox.checked;
				span.classList.toggle('checked', checkbox.checked);
			});
		});*/

	document.querySelectorAll('.checkbox').forEach(span => {
		const checkbox = span.querySelector('input[type="checkbox"]');

		// Toggle function
		const toggleCheckbox = () => {
			checkbox.checked = !checkbox.checked;
			span.classList.toggle('checked', checkbox.checked);
		};

		// Span click event
		span.addEventListener('click', toggleCheckbox);

		// Label click event
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
});