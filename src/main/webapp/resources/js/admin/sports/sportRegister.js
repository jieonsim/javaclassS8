/**
 * js/admin/sports/register.js
 */
'use strict';

document.addEventListener('DOMContentLoaded', function() {
	const sportForm = document.getElementById('sportForm');
	const teamForm = document.getElementById('teamForm');
	const venueForm = document.getElementById('venueForm');

	const sportNameInput = document.getElementById('inputSportName');
	const teamNameInput = document.getElementById('inputTeamName');
	const shortNameInput = document.getElementById('inputShortName');
	const venueNameInput = document.getElementById('inputVenueName');
	const addressInput = document.getElementById('inputAddress');
	const capacityInput = document.getElementById('inputCapacity');

	const sportNameSelectTeam = document.getElementById('inputSportNameSelect');
	const sportNameSelectVenue = document.getElementById('inputSportNameSelectVenue');
	const teamNameSelectVenue = document.getElementById('inputTeamNameSelectVenue');

	function sendRequest(url, data, successMessage) {
		return fetch(url, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(data),
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert(successMessage);
					location.reload();
				} else {
					alert('등록에 실패했습니다. ' + data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('등록 중 오류가 발생했습니다.');
			});
	}

	// 스포츠 선택에 따라 팀 옵션을 변경하는 함수
	function updateTeamOpitons() {
		const selectedSport = sportNameSelectVenue.value;

		// 모든 팀 옵션을 숨김
		Array.from(teamNameSelectVenue.options).forEach(option => {
			option.style.display = 'none';
		});

		// 선택된 스포츠에 해당하는 팀만 표시
		Array.from(teamNameSelectVenue.options).forEach(option => {
			if (option.dataset.sport == selectedSport || option.value === "") {
				option.style.display = 'block';
			}
		});

		// 팀 선택 초기화
		teamNameSelectVenue.value = "";
	}
	
	// 스포츠 선택이 변경될 때마다 팀 옵션 업데이트
	sportNameSelectVenue.addEventListener('change', updateTeamOpitons);
	
	// 페이지 로드 시 초기 팀 옵션 설정
	updateTeamOpitons();
	
	// 스포츠 종목 등록
	sportForm.addEventListener('submit', function(e) {
		e.preventDefault();
		const sportName = sportNameInput.value.trim();
		if (!sportName) {
			alert('스포츠 종목은 필수 입력 항목입니다.');
			return;
		}

		sendRequest(`${ctp}/admin/sports/sportRegister`, { sportName }, '종목 등록 완료! 팀과 경기장을 이어서 등록해주세요.');
	});

	// 팀 종목 등록
	teamForm.addEventListener('submit', function(e) {
		e.preventDefault();
		const sportName = sportNameSelectTeam.value;
		const teamName = teamNameInput.value.trim();
		const shortName = shortNameInput.value.trim();

		if (!sportName) {
			alert('스포츠 종목은 필수 선택 항목입니다.');
			return;
		}

		if (!teamName) {
			alert('팀 이름은 필수 입력 항목입니다.');
			return;
		}

		if (!shortName) {
			alert('팀 단축 이름은 필수 입력 항목입니다.');
			return;
		}
		sendRequest(`${ctp}/admin/sports/team/teamRegister`, { sportName, teamName, shortName }, '팀 등록 완료! 경기장을 이어서 등록해주세요.');
	});

	// 경기장 종목 등록
	venueForm.addEventListener('submit', function(e) {
		e.preventDefault();

		const sportName = sportNameSelectVenue.value;
		const teamName = teamNameSelectVenue.value;
		const venueName = venueNameInput.value.trim();
		const address = addressInput.value.trim();
		const capacity = capacityInput.value.trim();

		if (!sportName) {
			alert('스포츠 종목은 필수 선택 항목입니다.');
			return;
		}

		if (!teamName) {
			alert('팀 이름은 필수 입력 항목입니다.');
			return;
		}

		if (!venueName) {
			alert('경기장 이름은 필수 입력 항목입니다.');
			return;
		}

		if (!address) {
			alert('주소는 필수 입력 항목입니다.');
			return;
		}

		if (!capacity) {
			alert('수용 인원은 필수 입력 항목입니다.');
			return;
		}
		sendRequest(`${ctp}/admin/sports/venue/venueRegister`, { sportName, teamName, venueName, address, capacity }, '경기장 등록 완료!');
	});
});