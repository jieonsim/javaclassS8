/**
 * admin/event/draw.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const downButton = document.getElementById('down');
	const upButton = document.getElementById('up');
	const numInput = document.getElementById('numOfWinners');
	const form = document.getElementById('drawForm');
	let totalParticipants = 0; // 서버에서 받아올 총 참여자 수

	// 당첨자 수 지정 버튼 업데이트
	function updateButtonStates() {
		const currentValue = parseInt(numInput.value);
		downButton.style.cursor = currentValue <= 1 ? 'not-allowed' : 'pointer';
		upButton.style.cursor = currentValue >= 10 ? 'not-allowed' : 'pointer';
	}

	// 당첨자 지정 유효성 검사
	function validateWinnerCount() {
		const winnerCount = parseInt(numInput.value);
		if (winnerCount > totalParticipants) {
			alert('참여자 수보다 당첨자 수가 많을 수 없습니다.');
			numInput.value = totalParticipants;
			updateButtonStates();
			return false;
		}
		return true;
	}

	// 당첨자 수 마이너스 버튼
	downButton.addEventListener('click', function(e) {
		e.preventDefault(); // 폼 제출 방지
		const currentValue = parseInt(numInput.value);
		if (currentValue > 1) {
			numInput.value = currentValue - 1;
			updateButtonStates();
		}
	});

	// 당첨자 수 플러스 버튼
	upButton.addEventListener('click', function(e) {
		e.preventDefault(); // 폼 제출 방지
		const currentValue = parseInt(numInput.value);
		if (currentValue < 10) {
			numInput.value = currentValue + 1;
			updateButtonStates();
		}
	});

	numInput.addEventListener('change', validateWinnerCount);

	// 당첨자 수 지정 버튼 초기 상태 설정
	updateButtonStates();

	// 폼 제출
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (!validateWinnerCount()) return;

		const eventId = document.getElementById('eventId').value;
		const numOfWinners = numInput.value;

		fetch(`${ctp}/admin/event/drawWinners`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				eventId: parseInt(eventId, 10),
				numOfWinners: parseInt(numOfWinners, 10)
			})
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('이벤트 추첨 및 당첨자 예매권 발행이 완료되었습니다.');
					window.location.href = `${ctp}/admin/event/drawList`;
				} else {
					alert('이벤트 추첨에 실패했습니다: ' + (data.message || ''));
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('이벤트 추첨 중 오류가 발생했습니다.');
			});
	});

	// 초기 상태 설정 및 총 참여자 수 가져오기
	function initializeDrawForm() {
		const eventId = document.getElementById('eventId').value;
		fetch(`${ctp}/admin/event/getParticipantCount?eventId=${eventId}`)
			.then(response => response.json())
			.then(data => {
				totalParticipants = data.participantCount;
				updateButtonStates();
			})
			.catch(error => {
				console.error('Error fetching participant count:', error);
			});
	}

	initializeDrawForm();
});