// 최근 6개월 간 매출액 현황
function loadReservationChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getReservationData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			//var maxValue = Math.max(...response.data) * 1.1; // 최대값의 110%
			var maxValue = Math.ceil(Math.max(...response.data) * 1.1 / 10000) * 10000;
			var ctx = document.getElementById('reservationChart').getContext('2d');
			new Chart(ctx, {
				type: 'line',
				data: {
					labels: response.labels,
					datasets: [{
						label: '매출액 (만원)',
						data: response.data,
						backgroundColor: 'rgba(255, 99, 132, 0.2)',
						borderColor: 'rgba(255, 99, 132, 1)',
						borderWidth: 1,
						fill: false
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: true,
						position: 'bottom'
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: maxValue,
								callback: function(value) {
									return (value / 10000).toLocaleString() + '만원';
								}
							},
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}],
						xAxes: [{
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}]
					}
				}
			});
		}
	});
}

// 스포츠 종목별 예매 비율
function loadSportsPieChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getSportsPieData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var ctx = document.getElementById('sportsPieChart').getContext('2d');
			new Chart(ctx, {
				type: 'pie',
				data: {
					labels: response.labels,
					datasets: [{
						data: response.data,
						backgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)'
						],
						borderColor: [
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)'
						]
					}]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					}
				}
			});
		}
	});
}

// 야구 팀별 홈경기 예매율
function loadBaseballTeamChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getBaseballTeamData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var maxValue = Math.max(...response.data) * 1.1; // 최대값의 110%
			var ctx = document.getElementById('baseballTeamChart').getContext('2d');
			new Chart(ctx, {
				type: 'bar',
				data: {
					labels: response.labels,
					datasets: [{
						label: '예매율 (%)',
						data: response.data,
						backgroundColor: 'rgba(255, 99, 132, 0.2)',
						borderColor: 'rgba(255, 99, 132, 1)',
						borderWidth: 1
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: true,
						position: 'bottom'
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: maxValue,
								callback: function(value) {
									return value.toFixed(0) + '%'; // 소수점 없이 퍼센트 표시
								}
							},
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}],
						xAxes: [{
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}]
					}
				}
			});
		}
	});
}

// 축구 팀별 홈경기 예매율
function loadFootballTeamChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getFootballTeamData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var maxValue = Math.max(...response.data) * 1.1; // 최대값의 110%
			var ctx = document.getElementById('footballTeamChart').getContext('2d');
			new Chart(ctx, {
				type: 'bar',
				data: {
					labels: response.labels,
					datasets: [{
						label: '예매율 (%)',
						data: response.data,
						backgroundColor: 'rgba(54, 162, 235, 0.2)',
						borderColor: 'rgba(54, 162, 235, 1)',
						borderWidth: 1
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: true,
						position: 'bottom'
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: maxValue,
								callback: function(value) {
									return value.toFixed(0) + '%'; // 소수점 없이 퍼센트 표시
								}
							},
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}],
						xAxes: [{
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}]
					}
				}
			});
		}
	});
}

// 예매권 발행 수 대비 사용 현황
function loadAdvanceTicketChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getAdvanceTicketData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var maxValue = Math.max(...response.issuedData, ...response.usedData) * 1.1;
			var ctx = document.getElementById('advanceTicketChart').getContext('2d');
			new Chart(ctx, {
				type: 'line',
				data: {
					labels: response.labels,
					datasets: [{
						label: '발행 수',
						data: response.issuedData,
						borderColor: 'rgba(255, 206, 86, 1)',
						backgroundColor: 'rgba(255, 206, 86, 0.2)',
						borderWidth: 2,
						fill: true
					},
					{
						label: '사용 수',
						data: response.usedData,
						borderColor: 'rgba(75, 192, 192, 1)',
						backgroundColor: 'rgba(75, 192, 192, 0.2)',
						borderWidth: 2,
						fill: true
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: true,
						position: 'bottom'
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								max: maxValue,
								callback: function(value) {
									return value.toLocaleString();
								}
							},
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}],
						xAxes: [{
							gridLines: {
								color: "rgba(204, 204, 204,0.1)"
							}
						}]
					}
				}
			});
		}
	});
}

// 권종별 판매 현황
function loadTicketTypeChart() {
	$.ajax({
		url: ctp + '/admin/dashboard/getTicketTypeData',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			var ctx = document.getElementById('ticketTypeChart').getContext('2d');
			new Chart(ctx, {
				type: 'doughnut',
				data: {
					labels: response.labels,
					datasets: [{
						data: response.data,
						backgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)',
							'rgba(75, 192, 192, 0.5)',
							'rgba(153, 102, 255, 0.5)',
							'rgba(255, 159, 64, 0.5)',
							'rgba(255, 99, 71, 0.5)',
							'rgba(144, 238, 144, 0.5)'
						],
						borderColor: [
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 71, 1)',
							'rgba(144, 238, 144, 1)'
						]
					}]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					}
				}
			});
		}
	});
}
$(document).ready(function() {
	loadReservationChart();
	loadSportsPieChart();
	loadBaseballTeamChart();
	loadFootballTeamChart();
	loadAdvanceTicketChart();
	loadTicketTypeChart();
});