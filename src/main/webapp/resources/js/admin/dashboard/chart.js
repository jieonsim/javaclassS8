$(function() {
	'use strict';

	// 공통 차트 옵션
	var commonOptions = {
		responsive: true,
		maintainAspectRatio: false,
		legend: {
			display: true,
			position: 'bottom'
		},
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
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
	};

	// 예매 현황 차트 (매출액)
	function loadReservationChart() {
		$.ajax({
			url: ctp + '/admin/getReservationData',
			type: 'GET',
			dataType: 'json',
			success: function(response) {
				console.log('Reservation Data:', response);
				var maxValue = Math.max(...response.data) * 1.1; // 최대값의 110%
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
										return value.toLocaleString() + '만원';
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
			url: ctp + '/admin/getSportsPieData',
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
			url: ctp + '/admin/getBaseballTeamData',
			type: 'GET',
			dataType: 'json',
			success: function(response) {
				console.log('Baseball Team Data:', response);
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
										return value.toFixed(2) + '%';
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
			url: ctp + '/admin/getFootballTeamData',
			type: 'GET',
			dataType: 'json',
			success: function(response) {
				console.log('Football Team Data:', response);
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
										return value.toFixed(2) + '%';
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

	// 예매권 사용 현황
	function loadAdvanceTicketChart() {
		$.ajax({
			url: ctp + '/admin/getAdvanceTicketData',
			type: 'GET',
			dataType: 'json',
			success: function(response) {
				console.log('Advance Ticket Data:', response);
				var maxValue = Math.max(...response.issuedData, ...response.usedData) * 1.1;
				var ctx = document.getElementById('advanceTicketChart').getContext('2d');
				new Chart(ctx, {
					type: 'line',
					data: {
						labels: response.labels,
						datasets: [{
							label: '발행 수',
							data: response.issuedData,
							borderColor: 'rgba(255, 99, 132, 1)',
							backgroundColor: 'rgba(255, 99, 132, 0.2)',
							borderWidth: 2,
							fill: true
						},
						{
							label: '사용 수',
							data: response.usedData,
							borderColor: 'rgba(54, 162, 235, 1)',
							backgroundColor: 'rgba(54, 162, 235, 0.2)',
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
			url: ctp + '/admin/getTicketTypeData',
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
							],
							borderColor: [
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
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

	// 모든 차트 로드
	/*loadReservationChart();*/
	loadSportsPieChart();
	/*loadBaseballTeamChart();
	loadFootballTeamChart();
	loadAdvanceTicketChart();*/
	loadTicketTypeChart();
});