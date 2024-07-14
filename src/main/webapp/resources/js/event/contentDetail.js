/**
 * js/event/contentDetail.js
 */
document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('eventCommentForm');
	const commentInput = document.getElementById('inputEventComment');
	const commentValidation = document.getElementById('comment_validation');
	const insertEventCommentBtn = document.getElementById('insertEventCommentBtn');
	const eventId = document.getElementById('eventId').value;
	//console.log("Event ID:", eventId);

	let hasParticipated = false;

	function checkParticipation() {
		// 이벤트 참여 여부 확인
		fetch(`${ctp}/event/checkParticipation?eventId=${eventId}`)
			.then(response => response.json())
			.then(data => {
				hasParticipated = data.hasParticipated;
				if (hasParticipated) {
					commentValidation.textContent = '이미 응모하신 이벤트입니다. 이벤트는 한 번만 참여할 수 있습니다.';
					commentInput.disabled = true;
					insertEventCommentBtn.style.display = 'none';
				}
			})
			.catch(error => console.error('Error:', error));
	}

	function validateForm() {
		if (!commentInput.value.trim()) {
			alert('댓글을 입력해주세요.');
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
});