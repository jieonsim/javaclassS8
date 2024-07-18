/*js/admin/event/winnerDetail.js*/

document.addEventListener('DOMContentLoaded', function() {
	const announcementBtn = document.getElementById('announcementBtn');
	const winnerAnnouncementBox = document.getElementById('winnerAnnouncementBox');
	const winnerAnnouncementForm = document.getElementById('winnerAnnouncementForm');
	const sendMailBtn = document.getElementById('sendMailBtn');
	
	let editor;

	// 당첨자 발표 업로드 버튼 클릭 시 폼 표시
	if (announcementBtn) {
		announcementBtn.addEventListener('click', function() {
			winnerAnnouncementBox.style.display = 'block';
		});
	}

	// 이메일 마스킹 함수
	function maskEmail(email) {
		let parts = email.split('@');
		let name = parts[0];
		let domain = parts[1];
		let maskedName = name.substring(0, Math.max(name.length - 4, 4)) + '*'.repeat(Math.min(name.length - 4, 4));
		return maskedName + '@' + domain;
	}

	// CKEDITOR 설정
	CKEDITOR.replace('CKEDITOR', {
		height: 400,
		removePlugins: 'image,uploadimage',
		on: {
			instanceReady: function(evt) {
				editor = evt.editor;
				let content = editor.getData();
				let maskedContent = content.replace(/(\S+@\S+\.\S+)/g, function(match) {
					return maskEmail(match);
				});
				editor.setData(maskedContent);
			}
		}
	});

	// 당첨자 발표 폼 제출 및 유효성 검사
	winnerAnnouncementForm.addEventListener('submit', function(e) {
		e.preventDefault();

		if (!editor) {
			alert('에디터가 준비되지 않았습니다. 잠시 후 다시 시도해주세요.');
			return;
		}

		let editorContent = editor.getData();
		if (editorContent.trim() === '') {
			alert('본문 내용을 입력해주세요.');
			return;
		}

		fetch(`${ctp}/admin/event/uploadWinnerAnnouoncement`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				eventId: document.getElementById('eventId').value,
				title: document.getElementById('inputTitle').value,
				content: editorContent,
			})
		})
			.then(response => response.json())
			.then(data => {
				alert(data.message);
				if (data.success) {
					winnerAnnouncementBox.style.display = 'none';
					announcementBtn.style.display = 'none';
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('당첨자 발표 중 오류가 발생했습니다.');
			});
	});

	if (sendMailBtn) {
        sendMailBtn.addEventListener('click', function() {
            this.textContent = '메일 발송 중';
            this.disabled = true;

            fetch(`${ctp}/admin/event/sendWinnerEmails`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    eventId: document.getElementById('eventId').value
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('메일 발송이 완료되었습니다.');
                    this.textContent = '당첨 안내 및 예매권 메일 발송';
                    this.disabled = false;
                } else {
                    alert('메일 발송 중 오류가 발생했습니다: ' + data.message);
                    this.textContent = '당첨 안내 및 예매권 메일 발송';
                    this.disabled = false;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('메일 발송 중 오류가 발생했습니다.');
                this.textContent = '당첨 안내 및 예매권 메일 발송';
                this.disabled = false;
            });
        });
    }
});