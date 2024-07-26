/**
 * js/sports/common/reserve.js
 */
document.addEventListener('DOMContentLoaded', function() {

	// 좌석 등급 선택 시 배경 dimmed 처리 및 매수 선택 레이어 띄우기
	/*const seatGrades = document.querySelectorAll('#select_seat_grade li:not(:first-child)');*/
	const seatGrades = Array.from(document.querySelectorAll('#select_seat_grade li:not(:first-child)'));
	const selectCountAuto = document.querySelector('.select_count_auto');
	const dimmed = document.querySelector('.dimmed');

	seatGrades.forEach(grade => {
		grade.addEventListener('click', function(e) {
			e.preventDefault();
			if (!this.classList.contains('zero')) {
				selectCountAuto.style.display = 'block';
				dimmed.style.display = 'block';

				const seatName = this.querySelector('.seat_grade').textContent;
				const availableSeats = this.querySelector('.seat .ng-binding').textContent;

				document.querySelector('.select_count_auto .seat_name').textContent = seatName;
				document.querySelector('.select_count_auto .sheet').textContent = availableSeats + '석';
			}
		});
	});

	document.querySelector('.select_count_auto .close').addEventListener('click', function(e) {
		e.preventDefault();
		selectCountAuto.style.display = 'none';
		dimmed.style.display = 'none';
	});

	////////////////////////////////////////////////
	// 매수 선택 로직
	const selectCount = document.querySelector('.select_count_input');
	const minusBtn = selectCount.querySelector('.btn_minus');
	const plusBtn = selectCount.querySelector('.btn_plus');
	const countDisplay = selectCount.querySelector('.selt');
	const seltList = document.querySelector('.selt_lst');
	const maxTickets = parseInt(seltList.childElementCount) - 2; // -2 for the first and last elements
	let currentCount = 0;

	function updateCount() {
		countDisplay.textContent = currentCount;
		document.querySelector('.select_count_btn .btn').classList.add('btn_full');
		updateButtonState();
	}

	function updateButtonState() {
		minusBtn.disabled = (currentCount === 0);
		plusBtn.disabled = (currentCount === maxTickets);
		minusBtn.classList.toggle('disabledd', currentCount === 0);
		plusBtn.classList.toggle('disabledd', currentCount === maxTickets);
	}

	function toggleSeltList() {
		const isHidden = seltList.style.display === 'none' || seltList.style.display === '';
		seltList.style.display = isHidden ? 'block' : 'none';

		if (isHidden) {
			minusBtn.classList.add('disabledd');
			plusBtn.classList.add('disabledd');
			minusBtn.disabled = true;
			plusBtn.disabled = true;
		} else {
			updateButtonState();
		}
	}

	minusBtn.addEventListener('click', function() {
		if (currentCount > 0) {
			currentCount--;
			updateCount();
		}
	});

	plusBtn.addEventListener('click', function() {
		if (currentCount < maxTickets) {
			currentCount++;
			updateCount();
		}
	});

	// 드롭다운 목록에서 매수 선택
	seltList.addEventListener('click', function(e) {
		if (e.target.tagName === 'A') {
			e.preventDefault();
			currentCount = parseInt(e.target.textContent);
			updateCount();
			toggleSeltList();
		}
	});

	// 드롭다운 표시/숨김
	countDisplay.addEventListener('click', function(e) {
		e.preventDefault();
		toggleSeltList();
	});

	// 매수 선택 레이어 외부 클릭 시 레이어 닫기
	document.addEventListener('click', function(e) {
		if (!selectCountAuto.contains(e.target) && !seatGrades.some(grade => grade.contains(e.target))) {
			selectCountAuto.style.display = 'none';
			dimmed.style.display = 'none';
			currentCount === 0;
		}
	});

	// 초기 상태 설정
	updateCount();

	////////////////////////////////////////////////
	//좌석 선점 및 자동배정 안내 토글
	const reserveNoticeLink = document.querySelector('.reserve_notice_ly');
	const reserveNoticePopup = document.getElementById('reserveNoticePopup');
	const closePopupButton = reserveNoticePopup.querySelector('.close');

	function togglePopup() {
		if (reserveNoticePopup.style.display === 'none' || reserveNoticePopup.style.display === '') {
			reserveNoticePopup.style.display = 'block';
		} else {
			reserveNoticePopup.style.display = 'none';
		}
	}

	reserveNoticeLink.addEventListener('click', function(e) {
		e.preventDefault();
		togglePopup();
	});

	closePopupButton.addEventListener('click', function(e) {
		e.preventDefault();
		reserveNoticePopup.style.display = 'none';
	});

	// 팝업 외부 클릭 시 팝업 닫기
	document.addEventListener('click', function(e) {
		if (!reserveNoticePopup.contains(e.target) && e.target !== reserveNoticeLink) {
			reserveNoticePopup.style.display = 'none';
		}
	});

	// 새로고침 버튼 이벤트 리스너
	const seatRefreshButton = document.getElementById('seatRefreshBtn');

	seatRefreshButton.addEventListener('click', function(e) {
		e.preventDefault();
		location.reload();
	});


	////////////////////////////////////////////
	// 폼 제출 이벤트
	const form = document.getElementById('seatAndQuantityForm');
	const quantityInput = document.getElementById('selectedQuantity');
	const quantityDisplay = document.getElementById('quantityDisplay');
	const maxTicketsPerBooking = parseInt(document.getElementById('maxTicketsPerBooking').value);

	function updateQuantity(newQuantity) {
		quantityDisplay.textContent = newQuantity;
		quantityInput.value = newQuantity;
	}

	// +/- 버튼 이벤트 리스너
	document.querySelector('.btn_minus').addEventListener('click', function() {
		let currentQuantity = parseInt(quantityDisplay.textContent);
		if (currentQuantity > 0) {
			updateQuantity(currentQuantity - 1);
		}
	});

	document.querySelector('.btn_plus').addEventListener('click', function() {
		let currentQuantity = parseInt(quantityDisplay.textContent);
		if (currentQuantity < maxTicketsPerBooking) {
			updateQuantity(currentQuantity + 1);
		}
	});

	// 드롭다운에서 수량 선택
	document.querySelector('.selt_lst').addEventListener('click', function(e) {
		if (e.target.tagName === 'A') {
			e.preventDefault();
			updateQuantity(parseInt(e.target.textContent));
		}
	});

	// 폼 제출 전 유효성 검사
	form.addEventListener('submit', function(e) {
		e.preventDefault();

		if (parseInt(quantityDisplay.textContent) === 0) {
			alert('매수를 선택해주세요.');
			return;
		}

		// 폼 제출
		this.submit();
		alert('세션 저장 성공 next depth 이동');
	});
});