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
<link rel="stylesheet" href="${ctp}/vendors/feather/feather.css">
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/typicons/typicons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/css/vendor.bundle.base.css">
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
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">스포츠 종목 (Sports)</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 10%" />
												<col style="width: 60%" />
												<col style="width: 15%" />
												<col style="width: 15%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>No.</th>
													<th>종목</th>
													<th colspan="2">비고</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach var="sport" items="${sports}" varStatus="status">
													<tr data-id="${sport.id}">
														<td>${status.count}</td>
														<td class="sport-name">${sport.sportName}</td>
														<td class="sport-input" style="display: none;">
															<input type="text" class="form-control text-center" name="sportName" value="${sport.sportName}">
														</td>
														<td>
															<button class="badge badge-warning bg-white sport-update-btn">수정</button>
														</td>
														<td>
															<button class="badge badge-danger bg-white sport-delete-btn">삭제</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">팀 (Teams)</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 10%" />
												<col style="width: 40%" />
												<col style="width: 20%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>종목</th>
													<th>팀 이름</th>
													<th>팀 단축 이름</th>
													<th colspan="2">비고</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach var="team" items="${teams}">
													<tr data-id="${team.id}">
														<td>${team.sportName}</td>
														<td class="team-name">${team.teamName}</td>
														<td class="team-short-name">${team.shortName}</td>
														<td>
															<button class="badge badge-warning bg-white team-update-btn">수정</button>
														</td>
														<td>
															<button class="badge badge-danger bg-white team-delete-btn">삭제</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경기장 (Venue)</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 20%" />
												<col style="width: 30%" />
												<col style="width: 15%" />
												<col style="width: 5%" />
												<col style="width: 5%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>종목</th>
													<th>팀</th>
													<th>경기장 이름</th>
													<th>주소</th>
													<th>수용인원</th>
													<th colspan="2">비고</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach var="venue" items="${venues}">
													<tr data-id="${venue.id}">
														<td>${venue.sportName}</td>
														<td>${venue.teamName}</td>
														<td class="venue-name">${venue.venueName}</td>
														<td class="venue-input" style="display: none;">
															<input type="text" class="form-control text-center" name="venueName" value="${venue.venueName}">
														</td>
														<td class="venue-address">${venue.address}</td>
														<td class="venue-input" style="display: none;">
															<input type="text" class="form-control text-center" name="address" value="${venue.address}">
														</td>
														<td class="venue-capacity">${venue.capacity}</td>
														<td class="venue-input" style="display: none;">
															<input type="number" class="form-control text-center" name="capacity" value="${venue.capacity}">
														</td>
														<td>
															<button class="badge badge-warning bg-white venue-update-btn">수정</button>
														</td>
														<td>
															<button class="badge badge-danger bg-white venue-delete-btn">삭제</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/admin/sports/registrationList.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>