/**
 * js/event/contentDetail.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('eventCommentForm');
	const commentInput = document.getElementById('inputEventComment');
	const insertEventCommentBtn = document.getElementById('insertEventCommentBtn');
	const eventId = document.getElementById('eventId').value;
	const isLoggedIn = document.getElementById('isLoggedIn').value === 'true';
	const commentEditBtns = document.querySelectorAll('.commentEditBtn');
	const commentDeleteBtns = document.querySelectorAll('.commentDeleteBtn');

	/* 댓글 작성 및 이벤트 참여 */
	let hasParticipated = false;

	function checkParticipation() {
		// 로그인 여부 확인
		if (!isLoggedIn) {
			return false;
		}

		// 이벤트 참여 여부 확인
		fetch(`${ctp}/event/checkParticipation?eventId=${eventId}`)
			.then(response => response.json())
			.then(data => {
				hasParticipated = data.hasParticipated;
				if (hasParticipated) {
					commentInput.placeholder = '이미 응모하신 이벤트입니다. 이벤트는 한 번만 참여할 수 있습니다.';
				} else {
					commentInput.placeholder = '이메일, 전화번호 등 개인정보 노출 시, 타인이 이를 악용할 수 있으니 삼가 바랍니다.';
				}
			})
			.catch(error => console.error('Error:', error));
	}

	function validateForm() {
		// 로그인 여부 확인
		if (!isLoggedIn) {
			alert('로그인 후 응모하실 수 있습니다.');
			return false;
		}

		// 댓글 유무 확인
		if (!commentInput.value.trim()) {
			alert('댓글을 입력해주세요.');
			return false;
		}

		// 이벤트 참여 여부 확인
		if (hasParticipated) {
			alert('이미 응모하신 이벤트입니다. 이벤트는 한 번만 참여할 수 있습니다.');
			return false;
		}
		return true;
	}

	commentInput.addEventListener('focus', checkParticipation);

	insertEventCommentBtn.addEventListener('click', function(e) {
		e.preventDefault();
		if (validateForm() && !hasParticipated) {
			submitComment();
		}
	});

	function submitComment() {
		const formData = new FormData(form);
		fetch(`${ctp}/event/insertEventComment`, {
			method: 'POST',
			body: formData
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('이벤트 응모가 완료되었습니다.');
					location.reload(); // 페이지를 새로고침하여 새 댓글을 표시
				} else {
					if (data.alreadyParticipated) {
						alert('이미 응모하신 이벤트입니다. 이벤트는 한 번만 참여할 수 있습니다.');
					} else {
						alert('댓글 등록 중 오류가 발생했습니다. 다시 시도해 주세요.');
					}
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.');
			});
	}

	// 페이지 로드 시 참여 여부를 확인합니다.
	checkParticipation();

	/* 이벤트 댓글 수정 및 삭제 */
	commentEditBtns.forEach(btn => {
		btn.addEventListener('click', function() {
			const commentId = this.getAttribute('data-comment-id');
			const editBox = document.getElementById(`eventCommentEditBox_${commentId}`);
			editBox.style.display = 'block';
		});
	});

	commentDeleteBtns.forEach(btn => {
		btn.addEventListener('click', function() {
			const commentId = this.getAttribute('data-comment-id');
			if (confirm('정말로 삭제하시겠습니까? 댓글 삭제 시 이벤트 응모가 철회됩니다.')) {
				deleteComment(commentId);
			}
		});
	});

	document.querySelectorAll('[id^="updateEventCommentBtn_"]').forEach(button => {
		button.addEventListener('click', function(e) {
			e.preventDefault();
			const commentId = this.getAttribute('data-comment-id');
			const form = document.getElementById(`eventCommentEditForm_${commentId}`);
			const textarea = form.querySelector('textarea');
			if (!textarea.value.trim()) {
				alert('댓글을 입력해주세요.');
				return;
			}
			updateComment(commentId, textarea.value);
		});
	});

	function updateComment(commentId, newComment) {
		fetch(`${ctp}/event/updateEventComment`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ commentId: commentId, comment: newComment })
		})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('댓글 수정이 완료되었습니다.');
					location.reload();
				} else {
					alert('댓글 수정 중 오류가 발생했습니다.');
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('서버 오류가 발생했습니다.');
			});

	}

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
					alert('댓글이 삭제되었습니다.\n이벤트 응모가 철회되었으니 응모를 원하신다면 다시 댓글을 작성해주세요.');
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