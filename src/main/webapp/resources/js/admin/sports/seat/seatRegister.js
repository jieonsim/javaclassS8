/*js/admin/sports/game/register.js*/
document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('insertSeatForm');
	const sportSelect = document.getElementById('inputSportName');
	const teamSelect = document.getElementById('inputTeamName');
	const venueSelect = document.getElementById('inputVenueName');
	const capacityInput = document.getElementById('inputCapacity');

	let venues = []; // 모든 경기장 정보를 저장할 배열
	let currentVenueCapacity = 0; // 현재 선택된 경기장의 전체 수용인원
	let usedCapacity = 0; // 현재 경기장에 이미 등록된 좌석 수의 합

	function updateTeamOptions(teamSelect, teams) {
		teamSelect.innerHTML = '';
		teams.forEach(team => {
			const option = document.createElement('option');
			option.value = team.teamName;
			option.textContent = team.teamName;
			teamSelect.appendChild(option);
		});
	}

	function updateVenueOptions(newVenues) {
		venues = newVenues; // 전체 경기장 정보 저장
		venueSelect.innerHTML = '';
		venues.forEach(venue => {
			const option = document.createElement('option');
			option.value = venue.id; // venueId를 value로 사용
			option.textContent = venue.venueName;
			option.dataset.capacity = venue.capacity; // 경기장 수용인원 데이터 추가
			venueSelect.appendChild(option);
		});
		if (venues.length > 0) {
			updateCurrentVenueCapacity(); // 첫번째 경기장 선택 시 수용인원 업데이트
		}
	}

	function updateCurrentVenueCapacity() {
		const selectedVenueId = venueSelect.value;
		const selectedVenue = venues.find(v => v.id == selectedVenueId);
		if (selectedVenue) {
			currentVenueCapacity = selectedVenue.capacity;
			fetchUsedCapacity(selectedVenueId);
		}
	}

	function fetchUsedCapacity(venueId) {
		fetch(`${ctp}/admin/sports/seat/usedCapacity?venueId=${venueId}`)
			.then(response => response.json())
			.then(data => {
				usedCapacity = data.usedCapacity;
				updateCapacityValidation();
			});
	}

	function updateCapacityValidation() {
		const remainingCapacity = currentVenueCapacity - usedCapacity;
		capacityInput.max = remainingCapacity;
		capacityInput.title = `남은 수용인원: ${remainingCapacity}`;
	}

	venueSelect.addEventListener('change', updateCurrentVenueCapacity);

	sportSelect.addEventListener('change', function() {
		const selectedSport = this.value;
		fetch(`${ctp}/admin/sports/teams?sportName=${selectedSport}`)
			.then(response => response.json())
			.then(teams => {
				updateTeamOptions(teamSelect, teams);
				if (teams.length > 0) {
					teamSelect.dispatchEvent(new Event('change'));
				}
			});
	});

	teamSelect.addEventListener('change', function() {
		const selectedTeam = this.value;
		fetch(`${ctp}/admin/sports/venues?teamName=${selectedTeam}`)
			.then(response => response.json())
			.then(venues => {
				updateVenueOptions(venues);
			});
	});

	// 초기 로드 시 첫 번째 스포츠에 대한 팀 목록 가져오기
	if (sportSelect.options.length > 0) {
		sportSelect.dispatchEvent(new Event('change'));
	}

	form.addEventListener('submit', function(e) {
		e.preventDefault();

        // 모든 필드 입력 확인
        const allFields = [sportSelect, teamSelect, venueSelect,
            document.getElementById('inputSeatName'),
            capacityInput];

        if (allFields.some(field => !field.value)) {
            alert('모든 필드를 입력해주세요.');
            return;
        }

		// 수용 인원 초과 체크
		const newCapacity = parseInt(capacityInput.value);
		if (newCapacity > (currentVenueCapacity - usedCapacity)) {
			alert(`입력한 좌석 수가 경기장의 남은 수용인원(${currentVenueCapacity - usedCapacity})울 초과합니다.`);
			return;
		}

		// 폼 데이터 생성
		const formData = new FormData(form);
		formData.append('venueId', venueSelect.value); // venueId 추가

		// 서버에 데이터 전송
		fetch(`${ctp}/admin/sports/seat/seatRegister`, {
			method: 'POST',
			body: formData
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('좌석 등급이 성공적으로 등록되었습니다.');
					updateSeatList(data.seats);
					form.reset();
					usedCapacity += newCapacity; // 사용된 좌석 수 업데이트
					updateCapacityValidation(); // 남은 수용인원 재계산
				} else {
					alert('좌석 등록에 실패했습니다: ' + data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('좌석 등록 중 오류가 발생했습니다.');
			});
	});

	function updateSeatList(newSeats) {
		const seatList = document.getElementById('seatList');
		if (!seatList) {
			console.error('좌석 등급 리스트 요소를 찾을 수 없습니다.');
			return;
		}

		newSeats.forEach(seat => {
			const li = document.createElement('li');
			li.textContent = `${seat.teamName} | ${seat.categoryName}`;
			li.classList.add('list-group-item', 'new-seat');
			seatList.appendChild(li);
		});
	}
});