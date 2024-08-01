<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<jsp:include page="/WEB-INF/views/admin/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="icon" href="${ctp}/images/admin/favicon.ico">
</head>
<body>
	<div class="container-controller">
		<jsp:include page="/WEB-INF/views/admin/layout/navbar.jsp" />

		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/WEB-INF/views/admin/layout/settings-panel.jsp" />
			<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-12">
							<div class="home-tab">
								<div class="tab-content tab-content-basic" style="padding: 0">
									<div class="tab-pane fade active show" id="overview" role="tabpanel" aria-labelledby="overview">
										<div class="row">
											<div class="col-sm-12">
												<div class="statistics-details d-flex align-items-center justify-content-between">
													<div>
														<p class="statistics-title">현재까지 총 예매건 수</p>
														<h3 class="rate-percentage">32.53%</h3>
														<p class="text-danger d-flex">
															<i class="mdi mdi-menu-down"></i>
															<span>-0.5%</span>
														</p>
													</div>
													<div>
														<p class="statistics-title">현재 진행 중인 이벤트 건 수</p>
														<h3 class="rate-percentage">7,682</h3>
														<p class="text-success d-flex">
															<i class="mdi mdi-menu-up"></i>
															<span>+0.1%</span>
														</p>
													</div>
													<div>
														<p class="statistics-title">총 회원 수</p>
														<h3 class="rate-percentage">68.8</h3>
														<p class="text-danger d-flex">
															<i class="mdi mdi-menu-down"></i>
															<span>68.8</span>
														</p>
													</div>
													<div class="d-none d-md-block">
														<p class="statistics-title">현재 예매 오픈된 경기 수</p>
														<h3 class="rate-percentage">2m:35s</h3>
														<p class="text-success d-flex">
															<i class="mdi mdi-menu-down"></i>
															<span>+0.8%</span>
														</p>
													</div>
													<div class="d-none d-md-block">
														<p class="statistics-title">등록된 경기 중 오픈 예정인 경기 수</p>
														<h3 class="rate-percentage">68.8</h3>
														<p class="text-danger d-flex">
															<i class="mdi mdi-menu-down"></i>
															<span>68.8</span>
														</p>
													</div>
													<div class="d-none d-md-block">
														<p class="statistics-title">오늘자 매출액</p>
														<h3 class="rate-percentage">2m:35s</h3>
														<p class="text-success d-flex">
															<i class="mdi mdi-menu-down"></i>
															<span>+0.8%</span>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">예매 현황 차트</h4>
									<canvas id="areaChart"></canvas>
								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">스포츠 종목별 예매 비율</h4>
									<canvas id="pieChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">야구 팀별 홈경기 예매율</h4>
									<canvas id="doughnutChart"></canvas>
								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">축구 팀별 홈경기 예매율</h4>
									<canvas id="doughnutChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">예매권 사용 현황</h4>
									<canvas id="lineChart"></canvas>
								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">권종별 판매 현황</h4>
									<canvas id="barChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/member/login/autoLogin.js"></script>
	<script src="${ctp}/vendors/chart.js/Chart.min.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
	<script src="${ctp}/js/admin/common/chart.js"></script>
</body>
</html>