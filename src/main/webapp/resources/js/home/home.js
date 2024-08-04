/*js/home/home.js*/
document.addEventListener('DOMContentLoaded', function() {
	const mySwiper = new Swiper('.swiper-container', {
		direction: 'horizontal',
		slidesPerView: 3,
		spaceBetween: 30,
		slidesPerGroup: 3,  // 한 번에 3개씩 슬라이드
		loop: false,
		loopFillGroupWithBlank: true,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
		slideToClickedSlide: false,
		centeredSlides: false,
		watchOverflow: true,
		breakpoints: {
			// 반응형 설정
			1024: {
				slidesPerView: 3,
				slidesPerGroup: 3,
			},
			768: {
				slidesPerView: 2,
				slidesPerGroup: 2,
			},
			480: {
				slidesPerView: 1,
				slidesPerGroup: 1,
			}
		}
	});

	// 탭 버튼 클릭 이벤트 핸들러 수정
	function updateGameList(sport) {
		fetch(`${ctp}/getGames?sport=${sport}`)
			.then(response => response.json())
			.then(games => {
				const gameList = document.getElementById('gameList');
				gameList.innerHTML = '';
				if (games.length === 0) {
					// 경기가 없을 때 3개의 "nogame" 슬라이드 추가
					for (let i = 0; i < 3; i++) {
						gameList.appendChild(createGameElement());
					}
				} else {
					games.forEach(game => {
						const li = createGameElement(game);
						gameList.appendChild(li);
					});
				}
				mySwiper.update();
			});
	}

	const tabButtons = document.querySelectorAll('.common_tab_btn');
	// 탭 버튼 클릭 이벤트에 updateGameList 함수 연결
	tabButtons.forEach(button => {
		button.addEventListener('click', function() {
			const sport = this.getAttribute('data-sport');
			tabButtons.forEach(btn => {
				btn.classList.remove('active');
				btn.setAttribute('aria-selected', 'false');
			});
			this.classList.add('active');
			this.setAttribute('aria-selected', 'true');
			updateGameList(sport);
		});
	});

	function createGameElement(game) {
		if (!game) {
			// 경기가 없을 때 "nogame" 슬라이드 생성
			const li = document.createElement('li');
			li.className = 'swiper-slide';
			li.style = 'width: 354px; margin-right: 29px;';
			li.innerHTML = `
            <div class="match_card">
                <img src="${ctp}/images/icon/nogame.png" alt="No games available">
            </div>
        `;
			return li;
		}

		// 경기가 있을 때 기존 코드
		const li = document.createElement('li');
		li.className = 'swiper-slide';
		li.style = 'width: 354px; margin-right: 29px;';
		li.innerHTML = `
        <div class="match_card">
                <div class="match_card_visual">
                    <div class="match_team_group">
                        <div class="match_team_imgbox">
                            <img src="${ctp}/images/sports/emblem/${game.homeTeamShortName}.png" alt="${game.homeTeamShortName}" class="match_team_img">
                        </div>
                        <span class="common_icon icon_versus">
                            <span class="blind">vs</span>
                        </span>
                        <div class="match_team_imgbox">
                            <img src="${ctp}/images/sports/emblem/${game.awayTeamShortName}.png" alt="${game.awayTeamShortName}" class="match_team_img">
                        </div>
                    </div>
                </div>
                <div class="match_card_info">
                    <span class="match_card_date">${game.formattedGameDate} ${game.formattedGameTime}</span>
                    <span class="match_card_place">${game.venueName}</span>
                </div>
                <div class="match_card_btnarea">
                    <div class="common_btn_box">
                        ${game.openForBooking ?
				`<a href="${ctp}/reserve/seat?gameId=${game.id}" class="common_btn btn_primary btn_large btn_reserve">예매하기</a>` :
				`<a class="common_btn btn_primary btn_large plan_sale" aria-disabled="true" tabindex="-1">${game.openDate} ${game.openTime} 오픈예정</a>`
			}
                    </div>
                </div>
            </div>`;
		return li;
	}

	// 이벤트 위임을 사용하여 동적으로 생성되는 요소에도 이벤트 리스너를 등록
	document.addEventListener('click', function(e) {
		if (e.target.classList.contains('btn_reserve')) {
			e.preventDefault();
			const gameId = e.target.getAttribute('href').split('gameId=')[1];

			fetch(`${ctp}/checkLogin`, {
				method: 'GET',
				credentials: 'include'
			}).then(response => response.json()).then(data => {
				if (data.loggedIn) {
					window.open(`${ctp}/reserve/seat?gameId=${gameId}`, '티켓챔프', 'width=990,height=820');
				} else {
					window.location.href = `${ctp}/login`;
				}
			}).catch(error => {
				console.error('Error checking login status:', error);
			});
		}
	});

	window.addEventListener('message', function(e) {
		if (e.data === 'navigateToReserveList') {
			window.location.href = `${ctp}/my/reserve/list`;
		}
	});

	updateGameList('야구');

	/*	// 예매하기 새 창 열기
		document.querySelectorAll('.btn_reserve').forEach(button => {
			button.addEventListener('click', function(e) {
				e.preventDefault();
				const gameId = this.getAttribute('href').split('gameId=')[1];
	
				// AJAX 요청으로 로그인 상태 확인
				fetch(`${ctp}/checkLogin`, {
					method: 'GET',
					credentials: 'include' // 쿠키를 포함하기 위해
				}).then(response => response.json()).then(data => {
					if (data.loggedIn) {
						// 로그인 상태면 예매 창 열기
						window.open(`${ctp}/reserve/seat?gameId=${gameId}`, '티켓챔프', 'width=990,height=820');
					} else {
						// 로그인 상태가 아니면 부모 창에서 로그인 페이지로 이동
						window.location.href = `${ctp}/login`;
					}
				}).catch(error => {
					console.error('Error checking login status:', error);
				});
			});
		});
		// 부모 창에서 메시지 수신 후 처리(예매 창 닫고 예매확인으로 이동)
		window.addEventListener('message', function(e) {
			if (e.data === 'navigateToReserveList') {
				window.location.href = `${ctp}/my/reserve/list`;
			}
		});
	
		// 초기 로드 시 야구 경기 표시
		updateGameList('야구');*/
});