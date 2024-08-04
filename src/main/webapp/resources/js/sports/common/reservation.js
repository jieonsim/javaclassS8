/**
 * js/sports/common/reservation.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const today = new Date();
	const gameList = document.querySelectorAll('._game_list');

	gameList.forEach(game => {
		const gameDate = new Date(game.getAttribute('gamedate'));
		const gameTime = game.getAttribute('gametime').split(':');
		const saleOnTime = new Date(gameDate);
		saleOnTime.setDate(saleOnTime.getDate() - parseInt(game.getAttribute('bookingopendaysbefore')));
		saleOnTime.setHours(parseInt(game.getAttribute('bookingopentime').split(':')[0]));
		saleOnTime.setMinutes(parseInt(game.getAttribute('bookingopentime').split(':')[1]));

		const gameDateTime = new Date(gameDate);
		gameDateTime.setHours(parseInt(gameTime[0]), parseInt(gameTime[1]));

		const bookingCloseTime = new Date(gameDateTime);
		bookingCloseTime.setMinutes(bookingCloseTime.getMinutes() - parseInt(game.getAttribute('bookingcloseminutesafterstart')));

		const saleOnMidnight = new Date(saleOnTime);
		saleOnMidnight.setHours(23, 59, 59, 999);

		const matchBtn = game.querySelector('.match_btn');
		const gameId = game.getAttribute('data-game-id');

		// 예매 마감 시간이 지났으면 해당 경기 항목을 숨김
		if (today >= bookingCloseTime) {
			game.style.display = 'none';
			return;
		}

		// today_frame 클래스 적용 (예매 오픈 시간부터 당일 자정까지만)
		if (today >= saleOnTime && today <= saleOnMidnight) {
			game.classList.add('today_frame');
		} else {
			game.classList.remove('today_frame');
		}

		if (today >= saleOnTime && today < bookingCloseTime) {
			matchBtn.innerHTML = `<a href="${ctp}/reserve/seat?gameId=${gameId}" class="btn btn_reserve">예매하기</a>`;
		} else if (today < saleOnTime) {
			matchBtn.innerHTML = `
                <a href="#" class="btn btn_reserve_scdl">
                    판매예정<br>
                    <span>${String(saleOnTime.getMonth() + 1).padStart(2, '0')}.${String(saleOnTime.getDate()).padStart(2, '0')} ${String(saleOnTime.getHours()).padStart(2, '0')}:${String(saleOnTime.getMinutes()).padStart(2, '0')}</span>
                    오픈
                </a>
            `;
		}
	});

	// 예매하기 새 창 열기
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
});