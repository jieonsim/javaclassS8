/**
-이메일 아이디 찾기 성공 화면 
-사용된 곳 : views/member/search/showFoundEmail.jsp
 */
'use strict'

function saveSelectedEmail() {
	let selectedEmail = $('input[name="idlist"]:checked').val();
	if (selectedEmail) {
		$.ajax({
			url: ctp + '/search/saveSelectedEmail',
			type: 'POST',
			data: {
				selectedEmail: selectedEmail
			},
			success: function() {
				location.href = ctp + '/login';
			}
		});
	}
}
