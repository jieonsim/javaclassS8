/**
- 아이디찾기 depth1 이름 + 휴대폰번호 조합으로 찾기
- 사용되는 페이지 : member/search/matchId.jsp 
 */

'use strict';

document.addEventListener('DOMContentLoaded', function() {
	// 폼과 인풋 아이디
	const form = document.getElementById('matchEmailForm');
	const nameInput = document.getElementById('inputName');
	const phoneInput = document.getElementById('inputPhone');

	// 정규식 표현
	const nameRegex = /^[a-zA-Z가-힣]{2,10}$/;
	const phoneRegex = /^01[016789]\d{7,8}$/;

	// 에러 메시지 표시 함수
	function showError(message) {
		const errorDiv = document.querySelector('.errorMessage .message');
		errorDiv.textContent = message;
		errorDiv.style.display = 'block';
	}

	// 에러 메시지 숨기기 함수
	function hideError() {
		const errorDiv = document.querySelector('.errorMessage .message');
		errorDiv.style.display = 'none';
	}

	// 정규식 확인
	function validateInput(input, regex, errorMessage) {
		if (!regex.test(input.value.trim())) {
			showError(errorMessage);
			return false;
		}
		hideError();
		return true;
	}

	// 삭제 버튼 기능 추가
	const nameDelBtn = document.querySelector('#inputName + .btnDel');
	const phoneDelBtn = document.querySelector('#inputPhone + .btnDel');

	nameDelBtn.addEventListener('click', function() {
		nameInput.value = '';
		nameInput.focus();
	});

	phoneDelBtn.addEventListener('click', function() {
		phoneInput.value = '';
		phoneInput.focus();
	});

	form.addEventListener('submit', function(e) {
		e.preventDefault();

		const name = nameInput.value.trim();
		const phone = phoneInput.value.trim();

		// 이름 공백 체크
		if (!name) {
			showError('이름을 입력해주세요.');
			return;
		}

		// 이름 정규식 검사
		if (!validateInput(nameInput, nameRegex, '이름은 한글과 영문 대,소문자를 사용해주세요.')) {
			return;
		}

		// 휴대폰번호 공백 체크
		if (!phone) {
			showError('휴대폰 번호를 입력해주세요. (-없이 입력)');
			return;
		}

		// 휴대폰번호 정규식 검사
		if (!validateInput(phoneInput, phoneRegex, '잘못된 휴대폰 번호 형식입니다. (-없이 입력)')) {
			return;
		}

		$.ajax({
			url: ctp + '/search/matchEmail',
			type: 'POST',
			data: {
				name: name,
				phone: phone
			},
			success: function(response) {
				if (response.exists) {
					window.location.href = ctp + '/search/showFoundEmail';
				} else {
					showError('입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요.')
				}
			}
		});
	})
});