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
            matchBtn.innerHTML = '<a href="#" class="btn btn_reserve">예매하기</a>';
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
});