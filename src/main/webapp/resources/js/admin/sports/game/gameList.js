/*js/admin/sports/game/list.js */
document.addEventListener('DOMContentLoaded', function() {

	// 경기 수정 기능
	document.querySelectorAll('.game-update-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			const nameCells = row.querySelectorAll('.game-gameDate, .game-gameTime');
			const inputCells = row.querySelectorAll('.game-input');

			if (inputCells[0].style.display === 'none') {
				// 수정 모드로 전환
				nameCells.forEach(cell => cell.style.display = 'none');
				inputCells.forEach(cell => cell.style.display = 'table-cell');
				this.textContent = '저장';
			} else {
				// 수정 내용 저장
				const newGameDate = inputCells[0].querySelector('input').value;
				const newGameTime = inputCells[1].querySelector('input').value;
				updateGame(id, newGameDate, newGameTime, row);
			}
		});
	});

	// 경기 삭제 기능
	document.querySelectorAll('.game-delete-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			if (confirm(`정말로 이 경기를 삭제하시겠습니까?`)) {
				deleteGame(id, row);
			}
		});
	});
});


function updateGame(id, newGameDate, newGameTime, row) {
	fetch(`${ctp}/admin/sports/game/update`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ id: id, gameDate: newGameDate, gameTime: newGameTime})
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				row.querySelector('.game-gameDate').textContent = newGameDate;
				row.querySelector('.game-gameTime').textContent = newGameTime;
				row.querySelectorAll('.game-gameDate, .game-gameTime').forEach(cell => cell.style.display = 'table-cell');
				row.querySelectorAll('.game-input').forEach(cell => cell.style.display = 'none');
				row.querySelector('.game-update-btn').textContent = '수정';
				alert('경기가 성공적으로 업데이트되었습니다.');
				location.reload();
			} else {
				alert('업데이트 실패: ' + data.message);
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('업데이트 중 오류가 발생했습니다.');
		});
}

function deleteGame(id, row) {
	fetch(`${ctp}/admin/sports/game/delete`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ id: id })
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				row.remove();
				alert('경기가 성공적으로 삭제되었습니다.');
			} else {
				alert('경기 삭제에 실패했습니다.: ' + data.message);
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('경기 삭제 중 오류가 발생했습니다.');
		});
}