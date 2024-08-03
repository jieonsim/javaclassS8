/*js/admin/member/memberList.js*/
document.addEventListener('DOMContentLoaded', function() {
	const allCheckbox = document.getElementById('inputAllCheck');
	const memberCheckboxes = document.querySelectorAll('input[name="memberId"]');

	allCheckbox.addEventListener('change', function() {
		memberCheckboxes.forEach(checkbox => {
			checkbox.checked = this.checked;
		});
	});

	// 개별 체크박스 상태에 따라 전체 선택 체크박스 상태 변경
	function updateAllCheckbox() {
		allCheckbox.checked = Array.from(memberCheckboxes).every(checkbox => checkbox.checked);
	}

	memberCheckboxes.forEach(checkbox => {
		checkbox.addEventListener('change', updateAllCheckbox);
	});
	
	const resetBtn = document.getElementById('resetBtn');
    const searchForm = document.getElementById('searchForm');

    resetBtn.addEventListener('click', function() {
        // 폼의 모든 입력 필드 초기화
        searchForm.reset();
        
        // 원래의 회원 목록 페이지로 리다이렉트
        window.location.href = `${ctp}/admin/member/memberList`;
    });
});

document.getElementById('updateBtn').addEventListener('click', function() {
	const checkedMembers = Array.from(document.querySelectorAll('input[name="memberId"]:checked')).map(checkbox => checkbox.getAttribute('data-member-id'));
	const status = document.getElementById('inputStatus').value;
	const role = document.getElementById('inputRole').value;

	if (checkedMembers.length === 0) {
		alert('변경할 회원을 선택해주세요.');
		return;
	}

	if (status === '활동 상태 변경' && role === '등급 변경') {
		alert('변경할 상태 또는 등급을 선택해주세요.');
		return;
	}

	const updateData = {
		memberIds: checkedMembers
	};

	if (status !== '활동 상태 변경') {
		updateData.status = parseInt(status);
	}

	if (role !== '등급 변경') {
		updateData.role = role;
	}
	
	fetch(`${ctp}/admin/member/update`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(updateData)
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				alert('회원 정보가 성공적으로 변경되었습니다.');
				location.reload(); // 페이지 새로고침
			} else {
				alert('회원 정보 변경에 실패했습니다.');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('회원 정보 변경 중 오류가 발생했습니다.');
		});
});