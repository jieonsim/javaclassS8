/*navbar에 오늘 날짜와 현재 시각 뿌리기. js/amdin/common/navbar.js*/
function updateDateTime() {
	const now = new Date();
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate()).padStart(2, '0');
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');

	const formattedDateTime = `${year}-${month}-${day} ${hours}:${minutes}`;

	document.getElementById('current-datetime').textContent = formattedDateTime;
}

// 페이지 로드 시 날짜와 시간 업데이트
updateDateTime();
// 페이지 접속 후 1분마다 날짜와 시간 업데이트
setInterval(updateDateTime, 60000);