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

	// 로딩 컨테이너 funfacts
	const funFacts = ["축구 경기에서 선수들은 평균 10km 이상을 뛰어다닙니다!",
		"NBA 농구공의 무게는 약 620g입니다.",
		"테니스 라켓의 줄은 약 16-18kg의 장력으로 당겨져 있습니다.",
		"야구 투수가 던진 공의 최고 속도는 시속 169km를 넘습니다!",
		"수영선수 마이클 펠프스의 하루 칼로리 섭취량은 약 12,000kcal였습니다."];

	// 로딩 컨테이너 프로그레스 및 funfacts 변수
	let progress = 0;
	const progressBar = document.getElementById('progressBar');
	const funFactElement = document.getElementById('funFact');

	// 로딩 컨테이너 보여주기
	function showLoading() {
		loadingContainer.style.display = 'block';
		contentContainer.style.display = 'none';
	}

	// 로딩 컨테이너 숨기기
	function hideLoading() {
		loadingContainer.style.display = 'none';
		contentContainer.style.display = 'block';
	}

	// 스포츠 주요기사 가져오기
	function fetchNewsData() {
		return fetch(`${ctp}/api/news`)
			.then(response => response.json())
			.then(newsItems => {
				displayNewsItems(newsItems);
			})
			.catch(error => console.error('Error fetching news:', error));
	}

	// 스포츠 주요기사 보여주기
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

	// 스포츠 주요경기 일정 가져오기
	function fetchScheduleData() {
		return fetch(`${ctp}/api/schedule`)
			.then(response => response.json())
			.then(scheduleData => {
				displayScheduleData(scheduleData);
			})
			.catch(error => console.error('Error fetching schedule:', error));
	}

	// 스포츠 주요경기 일정 보여오기
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
					if (match.singleEvent === "true") {
						// 단일 이벤트 (left/right 팀이 없는 경우)
						tr.innerHTML = `
                        <td colspan="5" class="text-center">
                            <div>${match.status}</div>
                            ${match.time ? `<div><b>${match.time}</b></div>` : ''}
                            <div><strong>${match.eventName}</strong></div>
                            <div>${match.league}</div>
                        </td>
                    `;
					} else {
						// 두 팀 간의 경기
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
					}
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
	
	// kbo team ranking 가져오기
	function fetchKBORankingData() {
		return fetch(`${ctp}/api/kboRanking`)
			.then(response => response.json())
			.then(rankingData => {
				displayKBORanking(rankingData);
			})
			.catch(error => console.error('Error fetching KBO ranking:', error));
	}

	// kbo team ranking 보여주기
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

	// 로딩 컨테이너의 프로그레스 업데이트
	function updateProgress() {
		if (progress < 100) {
			progress += Math.random() * 10;
			progressBar.style.width = Math.min(progress, 100) + '%';
			setTimeout(updateProgress, 500);
		}
	}
	
	// 로딩 컨테이너의 funfact 체인지
	function changeFunFact() {
		const randomFact = funFacts[Math.floor(Math.random()
			* funFacts.length)];
		funFactElement.textContent = randomFact;
	}
	
	// 로딩컨테이너 처리
	updateProgress();
	changeFunFact();
	setInterval(changeFunFact, 5000);

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