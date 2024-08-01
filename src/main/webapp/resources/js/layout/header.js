/*js/layout/header.js*/
function convertSportNameToEnglish(koreanSportName) {
    const sportMap = {
        '야구': 'baseball',
        '축구': 'football',
        '농구': 'basketball',
        '배구': 'volleyball'
    };
    return sportMap[koreanSportName] || koreanSportName;
}

function convertTeamNameToUrlFriendly(teamName) {
    const teamMap = {
        'lg': 'lg',
        '삼성': 'samsung',
        '한화': 'hanhwa',
        'kia': 'kia',
        'ssg': 'ssg',
        'kt': 'kt',
        '케이티': 'kt',
        '울산': 'uhfc',
        '포항': 'steelers',
        '광주': 'gwangjufc',
        '전북현대': 'hyundaimotorsfc',
        '인천': 'incheonutd',
        '대구': 'daegufc',
        'fc서울': 'fcseoul',
        '김천': 'gimcheonfc'
    };
    return teamMap[teamName.toLowerCase()] || teamName.toLowerCase();
}

function handleSearch(event) {
	event.preventDefault();
	const searchTerm = document.getElementById('searchInput').value.trim().toLowerCase();

	if (searchTerm === '') {
		alert('검색어를 입력해 주세요.');
		return false;
	}

	const sportMappings = {
		'야구': '/sports/baseball/main',
		'baseball': '/sports/baseball/main',
		'베이스볼': '/sports/baseball/main',
		'축구': '/sports/football/main',
		'football': '/sports/football/main',
		'풋볼': '/sports/football/main',
		'농구': '/sports/basketball/off-season',
		'basketball': '/sports/basketball/off-season',
		'베스킷볼': '/sports/basketball/off-season',
		'배구': '/sports/volleyball/off-season',
		'volleyball': '/sports/volleyball/off-season',
		'발리볼': '/sports/volleyball/off-season',
		'이벤트': '/event/main',
		'핫이슈': '/hotIssue',
		'엘지': '/sports/baseball/lg/reservation',
		'기아': '/sports/baseball/kia/reservation',
		'기아타이거즈': '/sports/baseball/kia/reservation'
	};

	if (sportMappings[searchTerm]) {
		window.location.href = `${ctp}` + sportMappings[searchTerm];
		return false;
	}

	// 팀 이름, 경기장 이름 검색을 위한 AJAX 요청
	fetch(`${ctp}/search?keyword=${encodeURIComponent(searchTerm)}`)
		.then(response => response.json())
		.then(data => {
			if (data.result) {
				window.location.href = `${ctp}` + data.url;
			} else {
				alert('검색 결과가 없습니다.');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('검색 중 오류가 발생했습니다.');
		});

	return false;
}
