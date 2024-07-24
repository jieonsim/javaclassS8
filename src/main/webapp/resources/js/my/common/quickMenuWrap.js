/**
 * js/my/common/quickMenuWrap.js
 */
 
// 나의 이벤트 카운트
$(document).ready(function() {
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