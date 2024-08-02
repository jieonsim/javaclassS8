/*js/member/search/showFoundEmail.js*/
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
