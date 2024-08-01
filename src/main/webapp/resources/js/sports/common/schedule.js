/**
 * js/sprots/baseball/schedule.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const today = new Date();
	const tbody = document.querySelector('.sch_tbl tbody');
	const hasGames = tbody.getAttribute('data-has-games') === 'true';

	if (!hasGames) {
		showNoGamesMessage();
	} else {
		const gameList = document.querySelectorAll('._game_list');
		gameList.forEach(game => {
			const gameDate = new Date(game.getAttribute('gamedate'));
			const gameTime = game.getAttribute('gametime').split(':');
			const saleOnTime = new Date(gameDate);
			saleOnTime.setDate(saleOnTime.getDate() - parseInt(game.getAttribute('bookingopendaysbefore')));
			saleOnTime.setHours(parseInt(game.getAttribute('bookingopentime').split(':')[0]));
			saleOnTime.setMinutes(parseInt(game.getAttribute('bookingopentime').split(':')[1]));

			const saleOffTime = new Date(gameDate);
			saleOffTime.setHours(parseInt(gameTime[0]));
			saleOffTime.setMinutes(parseInt(gameTime[1]) + parseInt(game.getAttribute('bookingcloseminutesafterstart')));

			const saleTimeSpan = game.querySelector('._sale_time');

			if (today >= saleOnTime && today < saleOffTime) {
				game.classList.add('on');
			}

			if (today >= saleOffTime) {
				saleTimeSpan.textContent = '경기종료';
			} else {
				saleTimeSpan.textContent = `${saleOnTime.getFullYear()}.${String(saleOnTime.getMonth() + 1).padStart(2, '0')}.${String(saleOnTime.getDate()).padStart(2, '0')} ${String(saleOnTime.getHours()).padStart(2, '0')}:${String(saleOnTime.getMinutes()).padStart(2, '0')}오픈`;
			}
		});

		// Striped table
		const rows = tbody.querySelectorAll('tr');
		rows.forEach((row, index) => {
			if (index % 2 === 0) {
				row.classList.remove('even');
			} else {
				row.classList.add('even');
			}
		});
	}

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
	/*	// 예매하기 새 창 열기
		document.querySelectorAll('.btn_reserve').forEach(button => {
			button.addEventListener('click', function(e) {
				e.preventDefault();
				const gameId = this.getAttribute('href').split('=')[1];
				window.open(`${ctp}/reserve/seat?gameId=` + gameId, '티켓챔프', 'width=990,height=820');
			});
		});
	*/
	// 부모 창에서 메시지 수신 후 처리(예매 창 닫고 예매확인으로 이동)
	window.addEventListener('message', function(e) {
		if (e.data === 'navigateToReserveList') {
			window.location.href = `${ctp}/my/reserve/list`;
		}
	});
});