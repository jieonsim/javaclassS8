/* js/admin/event/contentDetail.js*/
document.addEventListener('DOMContentLoaded', function() {
	const commentDeleteBtns = document.querySelectorAll('.commentDeleteBtn');


	commentDeleteBtns.forEach(btn => {
		btn.addEventListener('click', function() {
			const commentId = this.getAttribute('data-comment-id');
			if (confirm('정말로 삭제하시겠습니까?\n댓글 삭제 시 이벤트 응모가 철회되며 참여자에겐 별도 안내가 이루어지지 않습니다.')) {
				deleteComment(commentId);
			}
		});
	});

	function deleteComment(commentId) {
		fetch(`${ctp}/event/deleteEventComment`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ commentId: commentId })
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('댓글 삭제 및 이벤트 응모 철회가 완료되었습니다.');
					location.reload();
				} else {
					alert('댓글 삭제 중 오류가 발생했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('서버 오류가 발생했습니다.');
			})
	}
});