/*js/admin/sports/price/priceRegister.js*/
document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('insertPriceForm');
	const sportSelect = document.getElementById('inputSportName');
	const teamSelect = document.getElementById('inputTeamName');
	const venueSelect = document.getElementById('inputVenueName');
	const seatSelect = document.getElementById('inputSeatName');
	const categorySelect = document.getElementById('inputTicketTypeCategory');
	const nameSelect = document.getElementById('inputTicketTypeName');

	// 스포츠 선택 시 팀 목록 업데이트
	sportSelect.addEventListener('change', function() {
		updateTeams(this.value);
	});

	// 팀 선택 시 경기장 목록 업데이트
	teamSelect.addEventListener('change', function() {
		updateVenues(this.value);
	});

	// 경기장 선택 시 좌석 등급 목록 업데이트
	venueSelect.addEventListener('change', function() {
		updateSeats(teamSelect.value, this.value);
	});

	// 권종 카테고리 선택 시 권종명 목록 업데이트
	categorySelect.addEventListener('change', function() {
		updateTicketTypeNames(this.value);
	});


	function updateTeams(sportName) {
		fetch(`${ctp}/admin/sports/teams?sportName=${sportName}`)
			.then(response => response.json())
			.then(teams => {
				populateSelect(teamSelect, teams, 'teamName', '팀 선택');
				if (teams.length > 0) {
					updateVenues(teams[0].teamName);
				}
			});
	}

	function updateVenues(teamName) {
		fetch(`${ctp}/admin/sports/venues?teamName=${teamName}`)
			.then(response => response.json())
			.then(venues => {
				populateSelect(venueSelect, venues, 'venueName', '경기장 선택');
				if (venues.length > 0) {
					updateSeats(teamName, venues[0].venueName);
				}
			});
	}

	function updateSeats(teamName, venueName) {
		fetch(`${ctp}/admin/sports/seats?teamName=${teamName}&venueName=${venueName}`)
			.then(response => response.json())
			.then(seats => {
				populateSelect(seatSelect, seats, 'seatName', '좌석 등급 선택');
			});
	}

	function updateTicketTypeNames(category) {
		fetch(`${ctp}/admin/sports/ticketTypeNames?category=${category}`)
			.then(response => response.json())
			.then(names => {
				populateSelect(nameSelect, names, 'name', '권종명 선택');
			});
	}

	function populateSelect(selectElement, data, propertyName, defaultText) {
		selectElement.innerHTML = `<option value="">${defaultText}</option>`;
		data.forEach(item => {
			const option = document.createElement('option');
			option.value = item[propertyName];
			option.textContent = item[propertyName];
			selectElement.appendChild(option);
		});
	}

	function validateForm() {
		// 모든 필수 필드가 선택되었는지 확인
		const requiredFields = [sportSelect, teamSelect, venueSelect, seatSelect, categorySelect, nameSelect, document.getElementById('inputPrice')];
		for (let field of requiredFields) {
			if (!field.value) {
				alert(`${field.previousElementSibling.textContent}을(를) 선택해주세요.`);
				return false;
			}
		}
		return true;
	}

	function updatePriceList(newPrices) {
		const priceList = document.getElementById('priceList');
		newPrices.forEach(price => {
			const li = document.createElement('li');
			li.textContent = `${price.sportName} - ${price.teamName} - ${price.venueName} - ${price.seatName} - ${price.ticketTypeCategory} - ${price.ticketTypeName}: ${price.price}원`;
			li.classList.add('list-group-item', 'new-price');
			priceList.insertBefore(li, priceList.firstChild);
		});
	}

	function submitForm() {
		const formData = new FormData(form);
		fetch(`${ctp}/admin/sports/price/register`, {
			method: 'POST',
			body: formData
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('가격이 성공적으로 등록되었습니다.');
					updatePriceList(data.prices);
					form.reset();
				} else {
					alert(data.message || '가격 등록에 실패했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('가격 등록 중 오류가 발생했습니다.');
			});
	}

	// 폼 제출 이벤트 처리
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (validateForm()) {
			submitForm();
		}
	});
});