document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('insertPriceForm');
	const sportSelect = document.getElementById('inputSportName');
	const teamSelect = document.getElementById('inputTeamName');
	const venueSelect = document.getElementById('inputVenueName');
	const seatSelect = document.getElementById('inputSeatName');
	const ticketCategorySelect = document.getElementById('inputTicketTypeCategory');
	const ticketTypeSelect = document.getElementById('inputTicketTypeName');

	function updateTeamOptions(teams) {
		teamSelect.innerHTML = '<option value="">팀 선택</option>';
		teams.forEach(team => {
			const option = document.createElement('option');
			option.value = team.teamName;
			option.textContent = team.teamName;
			teamSelect.appendChild(option);
		});
	}

	function updateVenueOptions(venues) {
		venueSelect.innerHTML = '<option value="">경기장 선택</option>';
		venues.forEach(venue => {
			const option = document.createElement('option');
			option.value = venue.venueName;
			option.textContent = venue.venueName;
			venueSelect.appendChild(option);
		});
	}

	function updateSeatOptions(seats) {
		seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
		seats.forEach(seat => {
			const option = document.createElement('option');
			option.value = seat.seatName;
			option.textContent = seat.seatName;
			seatSelect.appendChild(option);
		});
	}

	function updateTicketTypeOptions(ticketTypes) {
		ticketTypeSelect.innerHTML = '<option value="">권종명 선택</option>';
		ticketTypes.forEach(ticketType => {
			const option = document.createElement('option');
			option.value = ticketType.name;
			option.textContent = ticketType.name;
			ticketTypeSelect.appendChild(option);
		});
	}

	sportSelect.addEventListener('change', function() {
		const selectedSport = this.value;
		fetch(`${ctp}/admin/sports/teams?sportName=${selectedSport}`)
			.then(response => response.json())
			.then(teams => {
				updateTeamOptions(teams);
				venueSelect.innerHTML = '<option value="">경기장 선택</option>';
				seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
			});
	});

	teamSelect.addEventListener('change', function() {
		const selectedTeam = this.value;
		fetch(`${ctp}/admin/sports/venues?teamName=${selectedTeam}`)
			.then(response => response.json())
			.then(venues => {
				updateVenueOptions(venues);
				seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
			});
	});

	venueSelect.addEventListener('change', function() {
		const selectedVenue = this.value;
		fetch(`${ctp}/admin/sports/seats?venueName=${selectedVenue}`)
			.then(response => response.json())
			.then(seats => {
				updateSeatOptions(seats);
			});
	});

	ticketCategorySelect.addEventListener('change', function() {
		const selectedCategory = this.value;
		fetch(`${ctp}/admin/sports/ticketTypes?category=${selectedCategory}`)
			.then(response => response.json())
			.then(ticketTypes => {
				updateTicketTypeOptions(ticketTypes);
			});
	});

	// 초기 로드 시 첫 번째 스포츠에 대한 팀 목록 가져오기
	if (sportSelect.options.length > 0) {
		sportSelect.dispatchEvent(new Event('change'));
	}

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		// 모든 필드 입력 확인
		const allFields = [sportSelect, teamSelect, venueSelect, seatSelect, ticketCategorySelect, ticketTypeSelect, document.getElementById('inputPrice')];

		if (allFields.some(field => !field.value)) {
			alert('모든 필드를 입력해주세요.');
			return;
		}

		// 폼 데이터 생성
		const formData = new FormData(form);

		// 서버에 데이터 전송
		fetch(`${ctp}/admin/sports/price/priceRegister`, {
			method: 'POST',
			body: formData
		})
			.then(response => {
				if (!response.ok && response.status !== 200) {
					throw new Error('서버 오류');
				}
				return response.json();
			})
			.then(data => {
				if (data.success) {
					alert('요금이 성공적으로 등록되었습니다.');
					console.log('Registered Price:', data.price);
					updatePriceList([data.price]); // 등록된 요금 리스트 업데이트
					form.reset();
				} else {
					alert(data.message || '요금 등록에 실패했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('요금 등록 중 오류가 발생했습니다.');
			});
	});

	function updatePriceList(newPrices) {
		const priceList = document.getElementById('priceList');
		if (!priceList) {
			console.error('요금 리스트 요소를 찾을 수 없습니다.');
			return;
		}

		newPrices.forEach(price => {
			const li = document.createElement('li');
			li.textContent = `팀: ${price.teamName} | 경기장: ${price.venueName} | 좌석: ${price.seatName} | 권종: ${price.ticketTypeName} | 가격: ${price.price}원`;
			li.classList.add('list-group-item', 'new-price');
			priceList.appendChild(li);
		});
	}
});