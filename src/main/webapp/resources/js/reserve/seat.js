/*js/reserve/seat.js*/
document.addEventListener('DOMContentLoaded', function() {
	// 캡챠 3분 타이머 설정
	let captchaTimer = setTimeout(refreshCaptcha, 180000);

	const captcha_layer = document.getElementById('captcha_layer');
	const captcha_dimmed = document.getElementById('captcha_dimmed');
	const captchaRefreshBtn = document.getElementById('captchaRefreshBtn');
	const captcha_form = document.getElementById('captcha_form');

	// captcha_dimmed을 클릭해도 아무런 반응이 없도록 이벤트 핸들러를 추가
	captcha_dimmed.addEventListener('click', function(e) {
		e.stopPropagation();
	});

	function loadCaptcha() {
		fetch(`${ctp}/reserve/captcha`)
			.then(response => response.json())
			.then(data => {
				document.getElementById('captcha_img').src = data.captchaUrl;
				captcha_layer.style.display = 'block';
				captcha_dimmed.style.display = 'block';
				document.getElementById('ipt_captcha').value = '';
				clearTimeout(captchaTimer);
				captchaTimer = setTimeout(refreshCaptcha, 180000);
			})
			.catch(error => console.error('캡챠 로딩 에러:', error));
	}

	function hideCaptcha() {
		captcha_layer.style.display = 'none';
		captcha_dimmed.style.display = 'none';
	}

	// 서버에서 전달받은 captchaVerified 값 확인
	if (captchaVerified) {
		hideCaptcha();
	} else {
		loadCaptcha();
	}

	// 캡챠 이미지 새로고침 함수
	function refreshCaptcha() {
		fetch(`${ctp}/reserve/captcha`)
			.then(response => response.json())
			.then(data => {
				document.getElementById('captcha_img').src = data.captchaUrl;
				document.getElementById('ipt_captcha').value = '';
				clearTimeout(captchaTimer);
				captchaTimer = setTimeout(refreshCaptcha, 180000);
			})
			.catch(error => console.error('캡챠 새로고침 에러:', error));
	}

	// 캡챠 이미지 새로고침 버튼 이벤트
	captchaRefreshBtn.addEventListener('click', function() {
		refreshCaptcha();
	});

	// 캡챠 인풋 값 대문자로 전환
	document.getElementById('ipt_captcha').addEventListener('input', function() {
		this.value = this.value.toUpperCase();
	});


	// 캡챠 폼 제출
	captcha_form.addEventListener('submit', function(e) {
		e.preventDefault();
		const captcha = document.getElementById('ipt_captcha').value.toUpperCase();
		const bxInputTxt = document.getElementById('bx_input_txt');
		const captchaError = document.getElementById('captcha_error');

		fetch(`${ctp}/reserve/verifyCaptcha`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: new URLSearchParams({
				captcha: captcha,
				gameId: gameId
			})
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					hideCaptcha();
					captchaVerified = true;  // 로컬 변수 업데이트
				} else {
					bxInputTxt.classList.add('error');
					captchaError.classList.remove('ng-hide');
				}
			})
			.catch(error => console.error('캡챠 인증 에러:', error));
	});

	/////////////////////////////////////////////////////////////
	// 좌석 등급 선택 시 배경 dimmed 처리 및 매수 선택 레이어 띄우기
	//const seatGrades = Array.from(document.querySelectorAll('#select_seat_grade li:not(:first-child)'));
	const seatGrades = Array.from(document.querySelectorAll('#select_seat_grade li'));
	const selectCountAuto = document.querySelector('.select_count_auto');
	const seat_quantity_dimmed = document.getElementById('seat_quantity_dimmed');

	seatGrades.forEach(grade => {
		grade.addEventListener('click', function(e) {
			e.preventDefault();
			if (!this.classList.contains('zero')) {
				selectCountAuto.style.display = 'block';
				seat_quantity_dimmed.style.display = 'block';

				const seatName = this.querySelector('.seat_grade').textContent;
				const availableSeats = this.querySelector('.seat .ng-binding').textContent;
				const seatId = this.getAttribute('data-seat-id'); // seatId 가져오기

				document.querySelector('.select_count_auto .seat_name').textContent = seatName;
				document.querySelector('.select_count_auto .sheet').textContent = availableSeats + '석';

				// 좌석 ID input hidden 필드에 설정
				document.querySelector('input[name="seatId"]').value = seatId;
				// 브라우저 콘솔에 seatId 출력해보기
				//console.log('Selected Seat ID:', seatId);
			}
		});
	});

	document.querySelector('.select_count_auto .close').addEventListener('click', function(e) {
		e.preventDefault();
		selectCountAuto.style.display = 'none';
		seat_quantity_dimmed.style.display = 'none';
	});


	////////////////////////////////////////////////
	// 매수 선택 로직 + 선택된 매수 quantity 처리
	const selectCount = document.querySelector('.select_count_input');
	const minusBtn = selectCount.querySelector('.btn_minus');
	const plusBtn = selectCount.querySelector('.btn_plus');
	const countDisplay = selectCount.querySelector('.selt');
	const seltList = document.querySelector('.selt_lst');
	const maxTickets = parseInt(seltList.childElementCount) - 2;
	let currentCount = 0;

	const form = document.getElementById('seatAndQuantityForm');
	const quantityInput = document.getElementById('selectedQuantity');
	const quantityDisplay = document.getElementById('quantityDisplay');

	function updateQuantity(newQuantity) {
		quantityDisplay.textContent = newQuantity;
		quantityInput.value = newQuantity;
	}

	function updateCount() {
		countDisplay.textContent = currentCount;
		document.querySelector('.select_count_btn .btn').classList.add('btn_full');
		updateButtonState();
		updateQuantity(currentCount); // 숨겨진 입력 필드 값도 업데이트
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

	// 매수 마이너스
	minusBtn.addEventListener('click', function() {
		if (currentCount > 0) {
			currentCount--;
			updateCount();
		}
	});

	// 매수 플러스
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
			seat_quantity_dimmed.style.display = 'none';
			currentCount === 0;
		}
	});

	// 매수 초기 상태 설정
	updateCount();


	//////////////////////////////////////////////////////
	// depth1 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const selectedQuantity = parseInt(quantityDisplay.textContent);

		if (selectedQuantity === 0) {
			alert('매수를 선택해주세요.');
			return;
		}

		this.submit();
	});


	//////////////////////////////////////////
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

	////////////////////////////////////////
	// 새로고침 버튼 이벤트 리스너
	const seatRefreshButton = document.getElementById('seatRefreshBtn');

	seatRefreshButton.addEventListener('click', function(e) {
		e.preventDefault();
		location.reload();
	});
});