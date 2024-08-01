/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
	const tabContent = document.querySelector('.tab_content');
	if (!tabContent) return;

	const table = document.querySelector('.sch_tbl_v2 table tbody');
	const dateSpan = document.querySelector('._date');
	const prevButton = document.querySelector('.prev');
	const nextButton = document.querySelector('.next');

	let currentDate = new Date();
	currentDate.setDate(1); // 현재 월의 1일로 설정

	function createCalendar(year, month) {
		const table = document.createElement('table');
		table.className = 'sch_tbl sch_tbl_v2';

		tabContent.innerHTML = ''; // 기존 내용을 지웁니다.
		tabContent.appendChild(table);
		
		const firstDay = new Date(year, month, 1);
		const lastDay = new Date(year, month + 1, 0);

		let date = 1;
		let dayOfWeek = (firstDay.getDay() + 6) % 7; // 월요일을 0으로 조정

		for (let i = 0; i < 6; i++) {
			const row = document.createElement('tr');
			for (let j = 0; j < 7; j++) {
				const cell = document.createElement('td');
				const frame = document.createElement('div');
				frame.className = 'frame';

				if ((i === 0 && j < dayOfWeek) || date > lastDay.getDate()) {
					// 이전 달의 날짜나 다음 달의 날짜
					cell.appendChild(frame);
				} else {
					const dateDiv = document.createElement('div');
					dateDiv.className = 'date';
					dateDiv.textContent = date;
					frame.appendChild(dateDiv);
					date++;
				}

				cell.appendChild(frame);
				row.appendChild(cell);
			}
			table.appendChild(row);
			if (date > lastDay.getDate()) break;
		}

		// 년월 표시 업데이트
		dateSpan.textContent = `${year}.${String(month + 1).padStart(2, '0')}`;
	}

	function updateCalendar() {
		createCalendar(currentDate.getFullYear(), currentDate.getMonth());
	}

	// 이전 달 버튼 클릭 이벤트
	prevButton.addEventListener('click', function(e) {
		e.preventDefault();
		currentDate.setMonth(currentDate.getMonth() - 1);
		updateCalendar();
	});

	// 다음 달 버튼 클릭 이벤트
	nextButton.addEventListener('click', function(e) {
		e.preventDefault();
		currentDate.setMonth(currentDate.getMonth() + 1);
		updateCalendar();
	});

	// 초기 달력 생성
	updateCalendar();
});