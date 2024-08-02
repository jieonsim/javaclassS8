/*js/admin/dashboard/multipleCount.js*/

// 현재까지 총 예매완료 건 수
function loadTotalReservations() {
	$.ajax({
		url: `${ctp}/admin/dashboard/totalReservations`,
		type: 'GET',
		success: function(data) {
			$('#totalReservations').text(data + '건');
		},
		error: function(error) {
			console.log("Error fetching total reservations:", error);
		}
	});
}
// 현재 진행 중인 이벤트 건 수
function loadOngoingEvents() {
	$.ajax({
		url: `${ctp}/admin/dashboard/ongoingEvents`,
		type: 'GET',
		success: function(data) {
			$('#ongoingEvents').text(data + '건');
		},
		error: function(error) {
			console.log("Error fetching ongoing events:", error);
		}
	});
}
// 활동 중인 회원 수
function loadActiveMembers() {
	$.ajax({
		url: `${ctp}/admin/dashboard/activeMembers`,
		type: 'GET',
		success: function(data) {
			$('#activeMembers').text(data + '명');
		},
		error: function(error) {
			console.log("Error fetching active members:", error);
		}
	});
}
// 현재 예매 오픈된 경기 수
function loadOpenGames() {
	$.ajax({
		url: `${ctp}/admin/dashboard/openGames`,
		type: 'GET',
		success: function(data) {
			$('#openGames').text(data + '건');
		},
		error: function(error) {
			console.log("Error fetching open games:", error);
		}
	});
}
// 예매 대비 취소율
function loadCancellationRate() {
	$.ajax({
		url: `${ctp}/admin/dashboard/cancellationRate`,
		type: 'GET',
		success: function(data) {
			$('#cancellationRate').text(data + '%');
		},
		error: function(error) {
			console.log("Error fetching cancellation rate:", error);
		}
	});
}
// 총 예매수수료 수익
function loadTotalBookingFeeRevenue() {
	$.ajax({
		url: `${ctp}/admin/dashboard/totalBookingFeeRevenue`,
		type: 'GET',
		success: function(data) {
			$('#totalBookingFeeRevenue').text(formatNumberWithCommas(data) + '원');
		},
		error: function(error) {
			console.log("Error fetching total booking Fee revenue:", error);
		}
	});
}
// 원화 처리 함수
function formatNumberWithCommas(number) {
	return number.toLocaleString('ko-KR'); // 'ko-KR'은 한국 원화를 의미
}
$(document).ready(function() {
	loadTotalReservations();
	loadOngoingEvents();
	loadActiveMembers();
	loadOpenGames();
	loadCancellationRate();
	loadTotalBookingFeeRevenue();
});