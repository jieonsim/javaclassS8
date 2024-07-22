/**
 * js/sprots/baseball/schedule.js
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
	const tbody = document.querySelector('.sch_tbl tbody');
	const rows = tbody.querySelectorAll('tr');
	rows.forEach((row, index) => {
		if (index % 2 === 0) {
			row.classList.remove('even');
		} else {
			row.classList.add('even');
		}
	});
});