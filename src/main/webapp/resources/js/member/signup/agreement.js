/**
 *	- 회원가입 약관동의
 	- 사용되는 페이지 : member/signup/agreement.jsp
 */
'use strict';

function allAgree(checkbox) {
	const allCheckboxes = document.querySelectorAll('.singleSelector');
	allCheckboxes.forEach(box => {
		box.checked = checkbox.checked;
	});
	updateNextButton();
}

function updateNextButton() {
	const allAgreeCheckbox = document.querySelector('.allAgree input[type="checkbox"]');
	const requiredCheckboxes = document.querySelectorAll('.requireSelector');
	const nextButton = document.querySelector('.uBtn.active');

	const allChecked = Array.from(requiredCheckboxes).every(checkbox => checkbox.checked);

	if (allAgreeCheckbox.checked || allChecked) {
		nextButton.disabled = false;
	} else {
		nextButton.disabled = true;
	}
}

document.querySelectorAll('.singleSelector').forEach(checkbox => {
	checkbox.addEventListener('change', function() {
		const allAgreeCheckbox = document.querySelector('.allAgree input[type="checkbox"]');
		const allCheckboxes = document.querySelectorAll('.singleSelector');

		if (Array.from(allCheckboxes).every(box => box.checked)) {
			allAgreeCheckbox.checked = true;
		} else {
			allAgreeCheckbox.checked = false;
		}

		updateNextButton();
	});
});

document.querySelector('.allAgree input[type="checkbox"]').addEventListener('change', function() {
	allAgree(this);
});

// 초기 상태 설정
updateNextButton();
