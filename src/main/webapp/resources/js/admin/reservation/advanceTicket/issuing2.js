/**
 * /admin/reservation/advanaceTicket/issuing 예매권 발행하기
 */

$(document).ready(function() {
	$('.select2').select2({
		ajax: {
			url: ctp + '/admin/reservation/advanceTicket/memberSearch',
			dataType: 'json',
			delay: 250,
			data: function(params) {
				return {
					q: params.term,
					page: params.page
				};
			},
			processResults: function(data, params) {
				return {
					results: data.items,
					pagination: {
						more: (params.page * 30) < data.total_count
					}
				};
			},
			cache: true
		},
		minimumInputLength: 1,
		templateResult: formatMember,
		templateSelection: formatMemberSelection
	});
});

function formatMember(member) {
	if (member.loading) {
		return member.text;
	}
	var $container = $(
		"<div class='select2-result-member'>" +
		"<div class='select2-result-member__name'></div>" +
		"<div class='select2-result-member__email'></div>" +
		"</div>"
	);

	$container.find(".select2-result-member__name").text(member.name);
	$container.find(".select2-result-member__email").text(member.email);

	return $container;
}

function formatMemberSelection(member) {
	return member.name || member.email || member.text;
}

function addEmailFields() {
	const quantity = $('#inputQuantity2').val();
	const container = $('#emailFieldsContainer');
	container.empty();

	for (let i = 0; i < quantity; i++) {
		container.append(`
            <div class="form-group">
                <label for="inputEmail${i + 1}">이메일 ${i + 1}</label>
                <select class="form-control form-control-lg select2" id="inputEmail${i + 1}" name="emails[]">
                    <option value="">직접 입력</option>
                </select>
            </div>
        `);
	}

	$('.select2').select2({
		// Select2 옵션 (위와 동일)
	});
}

$('#batchForm').on('submit', function(e) {
	e.preventDefault();
	// AJAX로 일괄 발행 처리
});

$('#individualForm').on('submit', function(e) {
	e.preventDefault();
	// AJAX로 개별 발행 처리
});


/*예매권 개별 발행하기에서 선택한 매수만큼 이메일 필드 추가하기*/
/*function addEmailFields() {
	const individualForm = document.getElementById('individualForm');
	const numberOfFields = individualForm.querySelector('#inputQuantity2').value;
	const additionalEmailFields = individualForm.querySelector('#additionalEmailFields');

	additionalEmailFields.innerHTML = '';

	for (let i = 3; i <= numberOfFields; i++) {
		const formGroup = document.createElement('div');
		formGroup.className = 'form-group';

		const label = document.createElement('label');
		label.htmlFor = `inputEmail${i}`;
		label.innerHTML = `이메일 ${i - 1}`;

		const input = document.createElement('input');
		input.type = 'email';
		input.className = 'form-control form-control-lg';
		input.id = `inputEmail${i}`;
		input.name = `email${i}`;

		formGroup.appendChild(label);
		formGroup.appendChild(input);

		additionalEmailFields.appendChild(formGroup);
	}
}
*/