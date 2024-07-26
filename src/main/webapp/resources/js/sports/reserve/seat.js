/**
 * js/sports/common/reserve.js
 */
// 매수 선택 로직
document.addEventListener('DOMContentLoaded', function() {
	const seatGrades = document.querySelectorAll('#select_seat_grade li:not(:first-child)');
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

	// 매수 선택 로직
	const selectCount = document.querySelector('.select_count_input');
	const minusBtn = selectCount.querySelector('.btn_minus');
	const plusBtn = selectCount.querySelector('.btn_plus');
	const countDisplay = selectCount.querySelector('.selt');
	const maxTickets = parseInt(document.querySelector('.selt_lst').childElementCount) - 2; // -2 for the first and last elements
	let currentCount = 0;

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

	function updateCount() {
		countDisplay.textContent = currentCount;
		document.querySelector('.select_count_btn .btn').classList.toggle('btn_full', currentCount > 0);
		minusBtn.disabled = (currentCount === 0);
		plusBtn.disabled = (currentCount === maxTickets);
	}

	// 드롭다운 목록에서 매수 선택
	const seltList = document.querySelector('.selt_lst');
	seltList.addEventListener('click', function(e) {
		if (e.target.tagName === 'A') {
			e.preventDefault();
			currentCount = parseInt(e.target.textContent);
			updateCount();
			seltList.style.display = 'none';
		}
	});

	// 드롭다운 표시/숨김
	countDisplay.addEventListener('click', function(e) {
		e.preventDefault();
		seltList.style.display = seltList.style.display === 'none' ? 'block' : 'none';
	});
});