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
	CKEDITOR.replace('CKEDITOR', {
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

		// CKEditor 인스턴스 존재 여부 확인
		if (CKEDITOR.instances.CKEDITOR) {
			const content = CKEDITOR.instances.CKEDITOR.getData().trim();
			if (!content) {
				isValid = false;
				CKEDITOR.instances.CKEDITOR.container.addClass('is-invalid');
			} else {
				CKEDITOR.instances.CKEDITOR.container.removeClass('is-invalid');
			}
		} else {
			console.error('CKEditor instance "CKEDITOR" not found');
			isValid = false;
		}

		if (!isValid) {
			alert('모든 필드를 입력해주세요.');
		}

		return isValid;
	}

	// 이벤트 업로드 함수
	function uploadEvent() {
		const formData = new FormData(form);

		fetch(`${ctp}/admin/event/upload`, {
			method: 'POST',
			body: formData
		})
			.then(response => {
				if (!response.ok) {
					throw new Error(`HTTP error! status: ${response.status}`);
				}
				return response.json();
			})
			.then(data => {
				if (data.status === 'success') {
					alert(data.message);
					resetForm();
				} else {
					alert('업로드 실패: ' + data.message);
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('업로드 중 오류가 발생했습니다. 서버 응답을 확인할 수 없습니다.');
			});
	}

	// 폼 초기화 함수
	function resetForm() {
		form.reset();
		CKEDITOR.instances.CKEDITOR.setData('');
		thumbnailInfoInput.value = '';
	}

	// 폼 제출 이벤트
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (validateForm()) {
			uploadEvent();
		}
	});
});