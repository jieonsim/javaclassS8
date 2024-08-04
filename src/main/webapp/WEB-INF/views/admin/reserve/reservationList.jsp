<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
									<h4 class="card-title">예매 리스트</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 15%" />
												<col style="width: 15%" />
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 15%" />
												<col style="width: 15%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>No.</th>
													<th>예매번호</th>
													<th>티켓명</th>
													<th>경기일시</th>
													<th>티켓매수</th>
													<th>결제금액</th>
													<th>예매상태</th>
													<th>예매일시</th>
													<th>취소일시</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach items="${reservations}" var="reservation" varStatus="status">
													<tr>
														<td>${status.count}</td>
														<td>${reservation.reservationNumber}</td>
														<td>${reservation.homeTeamName}&nbsp;vs&nbsp;${reservation.awayTeamName}</td>
														<td>${reservation.gameDate}&nbsp;${reservation.gameTime}</td>
														<td>${reservation.ticketAmount}매</td>
														<td>
															<fmt:formatNumber value="${reservation.totalAmount}" type="number" />
															원
														</td>
														<td>
															<c:choose>
																<c:when test="${reservation.status eq '예매완료'}">
																	<label class="badge badge-success">${reservation.status}</label>
																</c:when>
																<c:when test="${reservation.status eq '취소완료'}">
																	<label class="badge badge-danger">${reservation.status}</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-secondary">${reservation.status}</label>
																</c:otherwise>
															</c:choose>
														</td>
														<td>${reservation.createdAt}</td>
														<td>
															<c:choose>
																<c:when test="${empty reservation.canceledAt}">취소 이력 없음</c:when>
																<c:otherwise>
																	<fmt:formatDate value="${reservation.canceledAt}" pattern="yyyy-MM-dd HH:mm:ss" />
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
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>