/*
js/hotIssue/main.js
스포츠 핫이슈 페이지에 스포츠 기사, 주요 경기 일정, kbo 팀 랭킹 크롤링하여 보여주기 
*/

document.addEventListener('DOMContentLoaded', function() {
	const newsTable = document.querySelector('.news-table tbody');
	const scheduleTable = document.querySelector('.majorGameSchedule table');
	const loadingContainer = document.getElementById('loding_container');
	const contentContainer = document.getElementById('content_container');

	// 모든 데이터 로딩을 추적하기 위한 Promise 배열
	const loadingPromises = [];

	function showLoading() {
		loadingContainer.style.display = 'block';
		contentContainer.style.display = 'none';
	}

	function hideLoading() {
		loadingContainer.style.display = 'none';
		contentContainer.style.display = 'block';
	}
	
	function fetchNewsData() {
		return fetch(`${ctp}/api/news`)
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
                    <a href="${item.link}" target="_blank">
                        <img src="${item.imgSrc}" alt="News Image">
                    </a>
                </td>
                <td class="news-content">
                    <div class="news-title">
                        <a href="${item.link}" target="_blank">${item.title}</a>
                    </div>
                    <div class="news-desc">
                        <a href="${item.link}" target="_blank">${item.desc}</a>
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
		return fetch(`${ctp}/api/schedule`)
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
		return fetch(`${ctp}/api/kboRanking`)
			.then(response => response.json())
			.then(rankingData => {
				displayKBORanking(rankingData);
				console.log("받은 랭킹 데이터:", rankingData);
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
	
	// 데이터 로딩 시작
	showLoading();
	
	// 각 데이터 로딩 Promise를 배열에 추가
	loadingPromises.push(fetchNewsData());
	loadingPromises.push(fetchScheduleData());
	loadingPromises.push(fetchKBORankingData());
	
	// 모든 Promise가 완료될 때까지 기다림
	
	Promise.all(loadingPromises)
	.then(() => {
		// 모든 데이터가 로드되면 로딩을 숨기고 컨첸츠를 표시
		hideLoading();
	})
	.catch(error => {
		console.error('Error loading data:', error);
		// 에러 발생 시에도 로딩을 숨기기
		hideLoading();
	})
});