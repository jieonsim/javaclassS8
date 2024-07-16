document.addEventListener('DOMContentLoaded', function() {
	const newsTable = document.querySelector('.news-table tbody');
	const scheduleTable = document.querySelector('.majorGameSchedule table');

	function fetchNewsData() {
		fetch(`${ctp}/api/news`)
			.then(response => response.json())
			.then(newsItems => {
				displayNewsItems(newsItems);
			})
			.catch(error => console.error('Error fetching news:', error));
	}

	function displayNewsItems(newsItems) {
		newsItems.forEach((item, index) => {
			const tr = document.createElement('tr');
			tr.innerHTML = `
                <td>
                    <a href="${item.link}">
                        <img src="${item.imgSrc}" alt="News Image">
                    </a>
                </td>
                <td class="news-content">
                    <div class="news-title">
                        <a href="${item.link}">${item.title}</a>
                    </div>
                    <div class="news-desc">
                        <a href="${item.link}">${item.desc}</a>
                    </div>
                    <div class="news-info">
                        <span>${item.time}</span>
                        |
                        <span>${item.source}</span>
                    </div>
                </td>
            `;
			newsTable.appendChild(tr);
		});
	}

	function fetchScheduleData() {
		fetch(`${ctp}/api/schedule`)
			.then(response => response.json())
			.then(scheduleData => {
				displayScheduleData(scheduleData);
			})
			.catch(error => console.error('Error fetching schedule:', error));
	}

	function displayScheduleData(scheduleData) {
		const thead = scheduleTable.querySelector('thead');
		const tbody = scheduleTable.querySelector('tbody');

		if (scheduleData && scheduleData.date) {
			// 날짜 표시
			thead.innerHTML = `
            <tr>
                <th colspan="5" class="text-center">
                    <div class="date-select">
                        <strong>${scheduleData.date}</strong>
                    </div>
                </th>
            </tr>
        `;

			// 경기 정보 표시
			tbody.innerHTML = '';
			if (scheduleData.matches && scheduleData.matches.length > 0) {
				scheduleData.matches.forEach(match => {
					const tr = document.createElement('tr');
					tr.innerHTML = `
                    <td class="text-left">
                        <img src="${match.teamLeftLogo}" class="team-logo" alt="팀 로고">
                        <span class="team-name ml-2">${match.teamLeft}</span>
                    </td>
                    <td class="text-center">
                        <span class="score">${match.scoreLeft || ''}</span>
                    </td>
                    <td class="text-center league-info">
                        <div>${match.status}</div>
                        ${match.time ? `<div><b>${match.time}</b></div>` : ''}
                        <div>${match.league}</div>
                    </td>
                    <td class="text-center">
                        <span class="score">${match.scoreRight || ''}</span>
                    </td>
                    <td class="text-right">
                        <span class="team-name mr-2">${match.teamRight}</span>
                        <img src="${match.teamRightLogo}" class="team-logo" alt="팀 로고">
                    </td>
                `;
					tbody.appendChild(tr);
				});
			} else {
				tbody.innerHTML = '<tr><td colspan="5" class="text-center">경기 일정이 없습니다.</td></tr>';
			}
		} else {
			thead.innerHTML = '<tr><th colspan="5" class="text-center">일정 데이터를 불러올 수 없습니다.</th></tr>';
			tbody.innerHTML = '';
		}
	}

	function fetchKBORankingData() {
		fetch(`${ctp}/api/kboRanking`)
			.then(response => response.json())
			.then(rankingData => {
				console.log("받은 랭킹 데이터", rankingData)
				displayKBORanking(rankingData);
			})
			.catch(error => console.error('Error fetching KBO ranking:', error));
	}


	function displayKBORanking(rankingData) {
		const rankingTable = document.querySelector('.kboTeamRanking table');
		const tbody = rankingTable.querySelector('tbody');
		const dateElement = document.querySelector('.kboTeamRanking .hotIssue-title');

		dateElement.textContent = rankingData.date;
		tbody.innerHTML = '';

		rankingData.teams.forEach(team => {
			const tr = document.createElement('tr');
			tr.innerHTML = `
            <td>${team.rank}</td>
            <td>${team.name}</td>
            <td>${team.games}</td>
            <td>${team.wins}</td>
            <td>${team.losses}</td>
            <td>${team.draws}</td>
            <td>${team.winRate}</td>
            <td>${team.gameBehind}</td>
            <td>${team.streak}</td>
        `;
			tbody.appendChild(tr);
		});
	}

	fetchNewsData();
	fetchScheduleData();
	fetchKBORankingData();
});