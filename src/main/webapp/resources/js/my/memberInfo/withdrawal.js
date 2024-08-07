/*js/my/memberInfo/withdrawal.js*/
document.addEventListener('DOMContentLoaded', function() {
	const agreeWithdrawal = document.getElementById('agree_Withdrawal');
	const checkbox = document.getElementById('agree');
	const form = document.getElementById('widthdrawalForm');
	const canWithdraw = document.getElementById('canWithdraw').value === 'true'

	agreeWithdrawal.addEventListener('click', function() {
		// 토글 checked 클래스
		if (agreeWithdrawal.classList.contains('checked')) {
			agreeWithdrawal.classList.remove('checked');
			checkbox.checked = false;
		} else {
			agreeWithdrawal.classList.add('checked');
			checkbox.checked = true;
		}
	});

	// 회원 탈퇴 폼 sumbit
	form.addEventListener('submit', function(e) {
		e.preventDefault();
		if (!checkbox.checked) {
			alert("'위 내용을 모두 확인하였으며 동의합니다.' 버튼을 체크해 주시기 바랍니다.");
			return;
		}

		if (!canWithdraw) {
			alert('관람일이 경과되지 않은 예매내역이 있으므로 탈퇴할 수 없습니다. 예매 취소 후 탈퇴하거나 예매하신 티켓의 관람일이 지난 후 탈퇴해 주시기 바랍니다.');
			return;
		}

		if (confirm('정말 탈퇴하시겠습니까? 이 작업은 취소할 수 없습니다.')) {
			fetch(`${ctp}/my/memberInfo/withdraw`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				credentials: 'same-origin' // 세션 쿠키를 포함하기 위해
			})
				.then(response => {
					if (!response.ok) {
						throw new Error('서버 응답이 올바르지 않습니다.');
					}
					return response.json();
				})
				.then(data => {
					if (data.success) {
						window.location.href = `${ctp}/withdrawalCompleted`;
					} else {
						alert(data.message || '회원 탈퇴 처리 중 오류가 발생했습니다.');
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('회원 탈퇴 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.');
				});
		}

	});
});