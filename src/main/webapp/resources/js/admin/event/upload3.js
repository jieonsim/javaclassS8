document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('eventUploadForm');
	const titleInput = document.getElementById('inputEventTitle');
	const categorySelect = document.getElementById('inputCategory');
	const startDateInput = document.getElementById('inputStartDate');
	const endDateInput = document.getElementById('inputEndDate');
	const thumbnailInput = document.getElementById('inputThumbnail');
	const thumbnailInfoInput = document.querySelector('.file-upload-info');
	const thumbnailUploadBtn = document.getElementById('thumbnailUploadBtn');

	// CKEditor 초기화
	CKEDITOR.replace('CKEDITOR', {
		filebrowserUploadUrl: `${ctp}/admin/event/uploadImage`,
		filebrowserUploadMethod: 'form',
		extraAllowedContent: 'img[width,height,align]'
	});

	// 썸네일 업로드 버튼 이벤트
	thumbnailUploadBtn.addEventListener('click', function() {
		thumbnailInput.click();
	});

	// 썸네일 파일 선택 시 이벤트
	thumbnailInput.addEventListener('change', function() {
		const file = this.files[0];
		if (file) {
			if (isValidImageFile(file)) {
				thumbnailInfoInput.value = file.name;
			} else {
				alert('유효한 이미지 파일(jpg, png, gif, jfif)만 업로드 가능합니다.');
				this.value = '';
				thumbnailInfoInput.value = '';
			}
		}
	});

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (validateForm()) {
			const eventData = {
				title: titleInput.value,
				category: categorySelect.value,
				startDate: startDateInput.value,
				endDate: endDateInput.value,
				content: CKEDITOR.instances.CKEDITOR.getData()
			};

			const formData = new FormData();
			formData.append('eventData', JSON.stringify(eventData));
			formData.append('thumbnail', thumbnailInput.files[0]);

			fetch(`${ctp}/admin/event/upload`, {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						alert(data.message);
						resetForm();
					} else {
						throw new Error(data.error || '이벤트 업로드에 실패했습니다.');
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('이벤트 업로드 중 오류가 발생했습니다: ' + error.message);
				});
		}
	});

	// 폼 유효성 검사
	function validateForm() {
		if (!titleInput.value.trim()) {
			alert('이벤트 제목을 입력해주세요.');
			return false;
		}
		if (!categorySelect.value) {
			alert('카테고리를 선택해주세요.');
			return false;
		}
		if (!startDateInput.value) {
			alert('시작일을 선택해주세요.');
			return false;
		}
		if (!endDateInput.value) {
			alert('종료일을 선택해주세요.');
			return false;
		}
		if (!thumbnailInput.files[0]) {
			alert('썸네일 이미지를 업로드해주세요.');
			return false;
		}
		if (CKEDITOR.instances.CKEDITOR.getData().trim() === '') {
			alert('이벤트 내용을 입력해주세요.');
			return false;
		}
		return true;
	}

	// 이미지 파일 유효성 검사
	function isValidImageFile(file) {
		const validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'jfif'];
		const extension = file.name.split('.').pop().toLowerCase();
		return validExtensions.includes(extension);
	}

	// 폼 리셋 함수
	function resetForm() {
		form.reset();
		CKEDITOR.instances.CKEDITOR.setData('');
		thumbnailInfoInput.value = '';
		// 필요하다면 다른 커스텀 필드들도 여기서 초기화
	}
});