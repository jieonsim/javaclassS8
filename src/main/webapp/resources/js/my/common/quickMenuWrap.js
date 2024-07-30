/**
 * js/my/common/quickMenuWrap.js
 */

// 마이페이지 quickMenuWrap의 나의 예매티켓, 나의 예매권, 나의 이벤트 갯수 가져오기
$(document).ready(function() {
	$.ajax({
		url: `${ctp}/my/reserve/reservationCount`,
		type: 'GET',
		success: function(count) {
			$('#quickMenuReserve').text(count);
		},
		error: function() {
			console.error('Failed to fetch reservation count');
		}
	});
	$.ajax({
		url: `${ctp}/my/discount/advanceTicketCount`,
		type: 'GET',
		success: function(count) {
			$('#quickMenuAdvanceTicket').text(count);
		},
		error: function() {
			console.error('Failed to fetch advance ticket count');
		}
	});
	$.ajax({
		url: `${ctp}/my/activity/eventCount`,
		type: 'GET',
		success: function(count) {
			$('#quickMenuEvent').text(count);
		},
		error: function() {
			console.error('Failed to fetch event count');
		}
	});
});