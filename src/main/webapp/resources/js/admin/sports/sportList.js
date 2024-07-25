/*js/admin/sports/list.js */
document.addEventListener('DOMContentLoaded', function() {

	// 스포츠 종목 수정 기능
	document.querySelectorAll('.sport-update-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			const nameCell = row.querySelector('.sport-name');
			const inputCell = row.querySelector('.sport-input');

			if (inputCell.style.display === 'none') {
				// 수정 모드로 전환
				nameCell.style.display = 'none';
				inputCell.style.display = 'block';
				this.textContent = '저장';
			} else {
				// 수정 내용 저장
				const newName = inputCell.querySelector('input').value;
				updateSport(id, newName, row);
			}
		});
	});

	// 팀 수정 기능
	document.querySelectorAll('.team-update-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			const nameCells = row.querySelectorAll('.team-name, .team-short-name');
			const inputCells = row.querySelectorAll('.team-input');

			if (inputCells[0].style.display === 'none') {
				// 수정 모드로 전환
				nameCells.forEach(cell => cell.style.display = 'none');
				inputCells.forEach(cell => cell.style.display = 'table-cell');
				this.textContent = '저장';
			} else {
				// 수정 내용 저장
				const newName = inputCells[0].querySelector('input').value;
				const newShortName = inputCells[1].querySelector('input').value;
				updateTeam(id, newName, newShortName, row);
			}
		});
	});

	// 경기장 수정 기능
	document.querySelectorAll('.venue-update-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			const nameCells = row.querySelectorAll('.venue-name, .venue-address, .venue-capacity');
			const inputCells = row.querySelectorAll('.venue-input');

			if (inputCells[0].style.display === 'none') {
				// 수정 모드로 전환
				nameCells.forEach(cell => cell.style.display = 'none');
				inputCells.forEach(cell => cell.style.display = 'table-cell');
				this.textContent = '저장';
			} else {
				// 수정 내용 저장
				const newName = inputCells[0].querySelector('input').value;
				const newAddress = inputCells[1].querySelector('input').value;
				const newCapacity = inputCells[2].querySelector('input').value;
				updateVenue(id, newName, newAddress, newCapacity, row);
			}
		});
	});

	// 삭제 기능
	document.querySelectorAll('.sport-delete-btn, .team-delete-btn, .venue-delete-btn').forEach(button => {
		button.addEventListener('click', function() {
			const row = this.closest('tr');
			const id = row.dataset.id;
			const type = this.classList.contains('sport-delete-btn') ? 'sport'
				: this.classList.contains('team-delete-btn') ? 'team'
					: 'venue';
			if (confirm(`정말로 이 ${type}을(를) 삭제하시겠습니까?`)) {
				deleteItem(type, id, row);
			}
		});
	});
});


function updateSport(id, newName, row) {
	fetch(`${ctp}/admin/sports/update`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ id: id, sportName: newName })
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				row.querySelector('.sport-name').textContent = newName;
				row.querySelector('.sport-name').style.display = 'block';
				row.querySelector('.sport-input').style.display = 'none';
				row.querySelector('.sport-update-btn').textContent = '수정';
				alert('스포츠가 성공적으로 업데이트되었습니다.');
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

function updateTeam(id, newName, newShortName, row) {
	fetch(`${ctp}/admin/sports/team/update`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ id: id, teamName: newName, shortName: newShortName })
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				row.querySelector('.team-name').textContent = newName;
				row.querySelector('.team-short-name').textContent = newShortName;
				row.querySelectorAll('.team-name, .team-short-name').forEach(cell => cell.style.display = 'table-cell');
				row.querySelectorAll('.team-input').forEach(cell => cell.style.display = 'none');
				row.querySelector('.team-update-btn').textContent = '수정';
				alert('팀이 성공적으로 업데이트되었습니다.');
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


function updateVenue(id, newName, newAddress, newCapacity, row) {
    fetch(`${ctp}/admin/sports/venue/update`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: id, venueName: newName, address: newAddress, capacity: newCapacity })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            row.querySelector('.venue-name').textContent = newName;
            row.querySelector('.venue-address').textContent = newAddress;
            row.querySelector('.venue-capacity').textContent = newCapacity;
            row.querySelectorAll('.venue-name, .venue-address, .venue-capacity').forEach(cell => cell.style.display = 'table-cell');
            row.querySelectorAll('.venue-input').forEach(cell => cell.style.display = 'none');
            row.querySelector('.venue-update-btn').textContent = '수정';
            alert('경기장이 성공적으로 업데이트되었습니다.');
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

function deleteItem(type, id, row) {
	fetch(`${ctp}/admin/sports/${type}/delete`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ id: id })
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				row.remove();
				alert(`${type}이(가) 성공적으로 삭제되었습니다.`);
			} else {
				if (data.errorCode === 'DEPENDENT_ITEMS_EXIST') {
					if (type === 'sport') {
						alert('이 스포츠 종목에 등록된 팀이나 경기장이 있어 삭제할 수 없습니다.');
					} else if (type === 'team') {
						alert('이 팀에 등록된 경기장이 있어 삭제할 수 없습니다.');
					} else {
						alert('삭제할 수 없습니다: ' + data.message);
					}
				} else {
					alert('삭제 실패: ' + data.message);
				}
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('삭제 중 오류가 발생했습니다.');
		});
}