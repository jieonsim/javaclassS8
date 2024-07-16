/*js/admin/event/update.js*/

document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('eventUpdateForm');
	const titleInput = document.getElementById('inputEventTitle');
	const categorySelect = document.getElementById('inputCategory');
	const startDateInput = document.getElementById('inputStartDate');
	const endDateInput = document.getElementById('inputEndDate');
	const statusInput = document.getElementById('inputStatus');
	const thumbnailInput = document.getElementById('inputThumbnail');
	const thumbnailInfoInput = document.querySelector('.file-upload-info');
	const thumbnailUploadBtn = document.getElementById('thumbnailUploadBtn');
	const resetBtn = document.getElementById('resetBtn');

	CKEDITOR.replace('CKEDITOR', {
		height: 700,
		filebrowserUploadUrl: `${ctp}/admin/event/imageUpload`,
		uploadUrl: `${ctp}/admin/event/imageUpload`,
		imageUploadAllowedTypes: /^image\/(gif|jpe?g|png|jfif)$/i
	});

	// 썸네일 업로드 버튼 클릭 이벤트
	thumbnailUploadBtn.addEventListener('click', function() {
		thumbnailInput.click();
	});

	// 썸네일 파일 선택 시 기존 이미지 처리 이벤트
	thumbnailInput.addEventListener('change', function() {
		if (this.files && this.files[0]) {
			const fileName = this.files[0].name;
			thumbnailInfoInput.value = fileName;
			// 썸네일 이미지를 변경하지 않았을 경우 기존 이미지 정보를 서버에 전송
		} else if (thumbnailInfoInput.getAttribute('data-original')) {
			thumbnailInfoInput.value = thumbnailInfoInput.getAttribute('data-original');
		}
	});

	// 날짜 입력 필드 초기화 및 유효성 검사
	const today = new Date().toISOString().split('T')[0];
	startDateInput.min = today;
	endDateInput.min = today;

	startDateInput.addEventListener('change', function() {
		endDateInput.min = this.value;
	});

	endDateInput.addEventListener('change', function() {
		if (this.value < startDateInput.value) {
			alert('종료일은 시작일 이후여야 합니다.');
			this.value = '';
		}
	});

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (validateForm()) {
			// CKEditor 내용을 업데이트합니다.
			for (instance in CKEDITOR.instances) {
				CKEDITOR.instances[instance].updateElement();
			}
			
			const formData = new FormData(form);
			
			// 썸네일 처리
			if (!thumbnailInput.files[0] && thumbnailInfoInput.getAttribute(`data-original`)) {
				formData.append('thumbnail', thumbnailInput.getAttribute(`data-original`));
			}

			fetch(`${ctp}/admin/event/update`, {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					if (data.message) {
						alert(data.message);
						window.location.href = ctp + '/admin/event/list';
					} else if (data.error) {
						alert(data.error);
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('이벤트 업로드 중 오류가 발생했습니다.');
				});
		}
	});

	function validateForm() {
		if (!titleInput.value.trim()) {
			alert('이벤트 제목을 입력해주세요.');
			return false;
		}
		if (!categorySelect.value) {
			alert('카테고리를 선택해주세요.');
			return false;
		}
		if (!statusInput.value) {
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
		if (!thumbnailInfoInput.value && !thumbnailInfoInput.getAttribute(`data-original`)) {
			alert('썸네일 이미지를 업로드하세요.');
			return false;
		}
		if (CKEDITOR.instances.CKEDITOR.getData().trim() === '') {
			alert('이벤트 내용을 입력해주세요.');
			return false;
		}
		return true;
	}

	// 취소 버튼 이벤트 추가
	resetBtn.addEventListener('click', function() {
		if (confirm('변경 사항을 취소하시겠습니까?')) {
			window.location.href = `${ctp}/admin/event/list`;
		}
	})
});