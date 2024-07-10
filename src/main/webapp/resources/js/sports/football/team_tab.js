/**
 * 야구 각 구단별 team_tab 메뉴 클릭 시 인크루드된 내용 동적 로드 및 class 'on' 추가 처리
 */

document.addEventListener('DOMContentLoaded', function() {
	var tabContent = document.querySelector('.tab_content');
	var currentTeam = tabContent.getAttribute('data-team');
	var reservationContent = document.getElementById('reservationContent');

	loadTabContent('reservation');

	document.querySelectorAll('.team_tab li a').forEach(function(link) {
		link.addEventListener('click', function(e) {
			e.preventDefault();
			var tabName = this.parentElement.getAttribute('tabname');
			loadTabContent(tabName);
		});
	});

	function loadTabContent(tabName) {
		if (tabName == 'reservation') {
			tabContent.innerHTML = '';
			reservationContent.style.display = 'block';
		} else {
			fetch(ctp + '/sports/football/' + currentTeam + '/' + tabName)
				.then(response => response.text())
				.then(html => {
					tabContent.innerHTML = html;
					reservationContent.style.display = 'none';
				})
				.catch(error => console.error('Error:', error));
		}
		document.querySelectorAll('.team_tab li').forEach(li => li.classList.remove('on'));
		document.querySelector('.team_tab li[tabname="' + tabName + '"]').classList.add('on');
	}
});