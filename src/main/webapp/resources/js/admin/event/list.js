/**
 * js/admin/event/list.js
 */
'use strict';

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('searchForm');
	const categorySelect = document.getElementById('inputCategory');
	const statusSelect = document.getElementById('inputStatus');
	const resetBtn = document.getElementById('resetBtn');
	const startDateInput = document.getElementById('inputStartDate');
	const endDateInput = document.getElementById('inputEndDate');
	const searchInput = document.getElementById('inputSearch');

	// 날짜 입력 필드 유효성 검사
	endDateInput.addEventListener('change', function() {
		if (this.value < startDateInput.value) {
			alert('종료일은 시작일 이후여야 합니다.');
			this.value = '';
		}
	});

	// 카테고리별 조회
	categorySelect.addEventListener('change', filterEvents);

	// 상태별 조회
	statusSelect.addEventListener('change', filterEvents);

	// 전체조회 버튼
	resetBtn.addEventListener('click', function() {
		form.reset();
		filterEvents();
	});

	// 검색 폼 제출
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		filterEvents();
	});

	function filterEvents() {
		const formData = new FormData(form);

		fetch(`${ctp}/admin/event/filter`, {
			method: 'POST',
			body: formData
		})
			.then(response => response.json())
			.then(data => {
				updateEventList(data);
			})
			.catch(error => console.error('Error:', error));
	}

	function updateEventList(events) {
		const tableBody = document.querySelector('table tbody');
		tableBody.innerHTML = '';
		events.forEach((event, index) => {
			const row = `
                <tr>
                    <td class="text-center">${index + 1}</td>
                    <td class="text-center">${event.eventCategory}</td>
                    <td>
                        <a href="${ctp}/admin/event/contentDetail?eventId=${event.id}" style="text-decoration: none; color: #212529;">${event.title}</a>
                    </td>
                    <td class="text-center">${event.startDate}</td>
                    <td class="text-center">${event.endDate}</td>
                    <td class="text-center">
                      <label class="badge badge-${getStatusBadgeClass(event.status)}">${statusMap[event.status] || event.status}</label>
                    </td>
                </tr>
            `;
			tableBody.innerHTML += row;
		});
	}

	function getStatusBadgeClass(status) {
		switch (status) {
			case 'ONGOING': return 'danger';
			case 'ENDED': return 'success';
			case 'UPCOMING': return 'warning';
			default: return 'info';
		}
	}
});