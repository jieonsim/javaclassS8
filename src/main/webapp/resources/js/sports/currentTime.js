/**
 * 
 */
function updateCurrentTime() {
	const now = new Date();
	let hours = now.getHours();
	let minutes = now.getMinutes();

	// 시간과 분이 한 자리 수일 경우 앞에 0을 추가
	hours = hours < 10 ? '0' + hours : hours;
	minutes = minutes < 10 ? '0' + minutes : minutes;

	const currentTimeString = `${hours}:${minutes}`;

	// span 요소를 찾아 시간을 업데이트
	document.querySelector('.current_time span').textContent = currentTimeString;
}

// 페이지 로드 시 즉시 시간을 업데이트하고, 이후 1분마다 업데이트
updateCurrentTime();
setInterval(updateCurrentTime, 60000); // 60000 밀리초 = 1분