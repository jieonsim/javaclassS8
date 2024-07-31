/*js/home/home.js*/
document.addEventListener('DOMContentLoaded', function() {
	/*	const mySwiper = new Swiper('.swiper-container', {
			direction: 'horizontal',
			slidesPerView: 3,
			spaceBetween: 30,
			slidesPerGroup: 3,  // 한 번에 3개씩 슬라이드
			loop: false,
			loopFillGroupWithBlank: true,
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			}
		});*/

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

	const tabButtons = document.querySelectorAll('.common_tab_btn');
	tabButtons.forEach(button => {
		button.addEventListener('click', function() {
			const sport = this.getAttribute('data-sport');
			tabButtons.forEach(btn => {
				btn.classList.remove('active');
				btn.setAttribute('aria-selected', 'false');
			});
			this.classList.add('active');
			this.setAttribute('aria-selected', 'true');

			fetch(`${ctp}/getGames?sport=${sport}`)
				.then(response => response.json())
				.then(games => {
					const gameList = document.getElementById('gameList');
					gameList.innerHTML = '';
					games.forEach(game => {
						const li = createGameElement(game);
						gameList.appendChild(li);
					});
					mySwiper.update();
				});
		});
	});

	function createGameElement(game) {
		const li = document.createElement('li');
		li.className = 'swiper-slide';
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
                        ${game.isOpenForBooking ?
				`<a href="${ctp}/reserve/seat?gameId=${game.id}" class="common_btn btn_primary btn_large">예매하기</a>` :
				`<a class="common_btn btn_primary btn_large plan_sale" aria-disabled="true" tabindex="-1">${game.openDate} ${game.openTime} 오픈예정</a>`
			}
                    </div>
                </div>
            </div>
        `;
		return li;
	}

	// 예매하기 새 창 열기
	document.querySelectorAll('.btn_reserve').forEach(button => {
		button.addEventListener('click', function(e) {
			e.preventDefault();
			const gameId = this.getAttribute('href').split('gameId=')[1];
			window.open(`${ctp}/reserve/seat?gameId=${gameId}`, '티켓챔프', 'width=990,height=820');
		});
	});

	// 부모 창에서 메시지 수신 후 처리(예매 창 닫고 예매확인으로 이동)
	window.addEventListener('message', function(e) {
		if (e.data === 'navigateToReserveList') {
			window.location.href = `${ctp}/my/reserve/list`;
		}
	});
});