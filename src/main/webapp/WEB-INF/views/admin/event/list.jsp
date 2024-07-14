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
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">이벤트 리스트</h4>
									<p class="card-description">등록된 이벤트의 전체 리스트를 확인할 수 있습니다.</p>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>
														<div class="form-check form-check-flat my-0">
															<label class="form-check-label m-0">
																<input type="checkbox" class="form-check-input" aria-checked="false">
																<i class="input-helper"></i>
															</label>
														</div>
													</th>
													<th>No.</th>
													<th>카테고리</th>
													<th>이벤트명</th>
													<th>시작일</th>
													<th>종료일</th>
													<th>진행상황</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${events}" var="event" varStatus="loop">
													<tr>
														<td>
															<div class="form-check form-check-flat my-0">
																<label class="form-check-label">
																	<input type="checkbox" class="form-check-input" aria-checked="false">
																	<i class="input-helper"></i>
																</label>
															</div>
														</td>
														<td>${loop.index + 1}</td>
														<td>${event.eventCategory.displayName}</td>
														<td>${event.title}</td>
														<td>${event.startDate}</td>
														<td>${event.endDate}</td>
														<td>
															<c:choose>
																<c:when test="${event.status == 'ONGOING'}">
																	<label class="badge badge-danger">${event.status.displayName}</label>
																</c:when>
																<c:when test="${event.status == 'ENDED'}">
																	<label class="badge badge-info">${event.status.displayName}</label>
																</c:when>
																<c:when test="${event.status == 'UPCOMING'}">
																	<label class="badge badge-warning">${event.status.displayName}</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-success">${event.status.displayName}</label>
																</c:otherwise>
															</c:choose>
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
	<script src="${ctp}/js/member/login/autoLogin.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>