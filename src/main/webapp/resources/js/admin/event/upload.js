/**
 * js/admin/event/upload.js
 */
'use strict';

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
	CKEDITOR.replace('content', {
		height: 750,
		filebrowserUploadUrl: `${ctp}/admin/event/imageUpload`,
		uploadUrl: `${ctp}/admin/event/imageUpload`
	});

	// 썸네일 업로드 버튼 클릭 이벤트
	thumbnailUploadBtn.addEventListener('click', function() {
		thumbnailInput.click();
	});

	// 썸네일 파일 선택 시 이벤트
	thumbnailInput.addEventListener('change', function() {
		if (this.files && this.files[0]) {
			const fileName = this.files[0].name;
			thumbnailInfoInput.value = fileName;
		}
	});

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (validateForm()) {
			this.submit();
		}
	});

	// 폼 유효성 검사 함수
	function validateForm() {
		let isValid = true;
		const requiredFields = [titleInput, categorySelect, startDateInput, endDateInput, thumbnailInput];

		requiredFields.forEach(field => {
			if (!field.value) {
				isValid = false;
				field.classList.add('is-invalid');
			} else {
				field.classList.remove('is-invalid');
			}
		});

		const content = CKEDITOR.instances.content.getData().trim();
		if (!content) {
			isValid = false;
			document.querySelector('#cke_content').classList.add('is-invalid');
		} else {
			document.querySelector('#cke_content').classList.remove('is-invalid');
		}

		if (!isValid) {
			alert('모든 필드를 입력해주세요.');
		}

		return isValid;
	}

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
});