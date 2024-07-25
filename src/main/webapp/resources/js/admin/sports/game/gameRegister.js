/*js/admin/sports/game/gameRegister.js*/
document.addEventListener('DOMContentLoaded', function() {
	const sportSelect = document.getElementById('inputSportName');
	const homeTeamSelect = document.getElementById('inputHomeTeamName');
	const awayTeamSelect = document.getElementById('inputAwayTeamName');
	const venueSelect = document.getElementById('inputVenueName');
	const form = document.getElementById('insertGameForm');

	function updateTeamOptions(teamSelect, teams) {
		teamSelect.innerHTML = '';
		teams.forEach(team => {
			const option = document.createElement('option');
			option.value = team.teamName;
			option.textContent = team.teamName;
			teamSelect.appendChild(option);
		});
	}

	function updateVenueOptions(venues) {
		venueSelect.innerHTML = '';
		venues.forEach(venue => {
			const option = document.createElement('option');
			option.value = venue.venueName;
			option.textContent = venue.venueName;
			venueSelect.appendChild(option);
		});
	}

	sportSelect.addEventListener('change', function() {
		const selectedSport = this.value;
		fetch(`${ctp}/admin/sports/teams?sportName=${selectedSport}`)
			.then(response => response.json())
			.then(teams => {
				updateTeamOptions(homeTeamSelect, teams);
				updateTeamOptions(awayTeamSelect, teams);
				if (teams.length > 0) {
					homeTeamSelect.dispatchEvent(new Event('change'));
				}
			});
	});

	homeTeamSelect.addEventListener('change', function() {
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

		// 1. 모든 필드 입력 확인
		const allFields = [sportSelect, homeTeamSelect, awayTeamSelect, venueSelect,
			document.getElementById('inputGameDate'),
			document.getElementById('inputGameTime')];

		if (allFields.some(field => !field.value)) {
			alert('모든 필드를 입력해주세요.');
			return;
		}

		// 2. 홈팀과 원정팀이 같은지 확인
		if (homeTeamSelect.value === awayTeamSelect.value) {
			alert('홈팀과 원정팀은 같을 수 없습니다.');
			return;
		}

		// 폼 데이터 생성
		const formData = new FormData(form);

		// 서버에 데이터 전송
		fetch(`${ctp}/admin/sports/game/gameRegister`, {
			method: 'POST',
			body: formData
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('경기가 성공적으로 등록되었습니다.');
					updateGameList(data.games);
					form.reset();
				} else {
					alert('경기 등록에 실패했습니다: ' + data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('경기 등록 중 오류가 발생했습니다.');
			});
	});

	function updateGameList(newGames) {
		const gameList = document.getElementById('gameList');
		if (!gameList) {
			console.error('경기 리스트 요소를 찾을 수 없습니다.');
			return;
		}

		newGames.forEach(game => {
			const li = document.createElement('li');
			const date = new Date(game.gameDate + 'T' + game.gameTime);
			const formattedDate = `${date.getMonth() + 1}.${date.getDate()}(${['일', '월', '화', '수', '목', '금', '토'][date.getDay()]}) ${date.getHours()}:${date.getMinutes().toString().padStart(2, '0')}`;
			li.textContent = `${formattedDate} ${game.homeTeamShortName} vs ${game.awayTeamShortName}`;
			li.classList.add('list-group-item', 'new-game');
			gameList.appendChild(li);
		});
	}
});