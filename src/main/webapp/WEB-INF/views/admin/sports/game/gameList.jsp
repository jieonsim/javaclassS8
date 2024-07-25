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
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경기 (Game) 리스트</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 15%" />
												<col style="width: 15%" />
												<col style="width: 20%" />
												<col style="width: 10%" />
												<col style="width: 5%" />
												<col style="width: 5%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>종목</th>
													<th>날짜</th>
													<th>시간</th>
													<th>홈</th>
													<th>어웨이</th>
													<th>경기장</th>
													<th>상태</th>
													<th colspan="2">비고</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach var="game" items="${games}">
													<tr data-id="${game.id}">
														<td>${game.sportName}</td>
														<td class="game-gameDate">${game.gameDate}</td>
														<td class="game-input" style="display: none;">
															<input type="date" class="form-control text-center" name="gameDate" value="${game.gameDate}">
														</td>
														<td class="game-gameTime">${game.gameTime}</td>
														<td class="game-input" style="display: none;">
															<input type="time" class="form-control text-center" name="gameTime" value="${game.gameTime}">
														</td>
														<td>${game.homeTeamName}</td>
														<td>${game.awayTeamName}</td>
														<td>${game.venueName}</td>
														<td class="game-status">${game.status}</td>
														<td class="game-input" style="display: none;">
															<select class="form-control bg-white text-dark" name="status">
																<c:forEach items="${statuses}" var="status">
																	<option value="${status}" ${game.status eq status ? 'selected' : ''}>${status}</option>
																</c:forEach>
															</select>
														</td>
														<td>
															<button class="badge badge-warning bg-white game-update-btn">수정</button>
														</td>
														<td>
															<button class="badge badge-danger bg-white game-delete-btn">삭제</button>
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
	<script src="${ctp}/js/admin/sports/game/gameList.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>