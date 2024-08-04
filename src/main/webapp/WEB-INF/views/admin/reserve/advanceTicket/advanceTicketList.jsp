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
									<h4 class="card-title">예매권 발행 리스트</h4>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 20%" />
												<col style="width: 20%" />
												<col style="width: 20%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 15%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>No.</th>
													<th>예매권번호</th>
													<th>발행일시</th>
													<th>만료일시</th>
													<th>예매권 등록 여부</th>
													<th>예매권 사용 여부</th>
													<th>상세보기</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach var="ticket" items="${advanceTickets}" varStatus="status">
													<tr>
														<td>${status.count}</td>
														<td>${ticket.advanceTicketNumber}</td>
														<td>
															<fmt:formatDate value="${ticket.issuedAt}" pattern="yyyy-MM-dd HH:mm:ss" />
														</td>
														<td>
															<fmt:formatDate value="${ticket.expiresAt}" pattern="yyyy-MM-dd HH:mm:ss" />
														</td>
														<td>
															<c:choose>
																<c:when test="${ticket.isRegistered eq 'Y'}">
																	<label class="badge badge-danger">Y</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-success">N</label>
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${ticket.usageStatus eq 'NONE'}">
																	<label class="badge badge-success">NONE</label>
																</c:when>
																<c:when test="${ticket.usageStatus eq 'CANCELLED'}">
																	<label class="badge badge-warning">CANCELLED</label>
																</c:when>
																<c:when test="${ticket.usageStatus eq 'USED'}">
																	<label class="badge badge-danger">USED</label>
																</c:when>
															</c:choose>
														</td>
														<td>
															<button type="button" style="border: 0px; background-color: transparent;" data-toggle="modal" data-target="#advanceTicketDetail${ticket.id}">
																<i class="mdi mdi-alert-circle" style="font-size: 18px;"></i>
															</button>
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
	<c:forEach var="ticket" items="${advanceTickets}">
		<div class="modal fade" id="advanceTicketDetail${ticket.id}">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<h4 class="card-title">예매권 상세 리스트</h4>
						<div class="table-responsive pt-3">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>예매권 등록 일시</td>
										<td>
											<c:choose>
												<c:when test="${not empty ticket.registeredAt}">
													<fmt:formatDate value="${ticket.registeredAt}" pattern="yyyy-MM-dd HH:mm:ss" />
												</c:when>
												<c:otherwise>예매권 등록 기록 없음</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>예매권 등록한 회원 아이디</td>
										<td>${not empty ticket.registerEmail ? ticket.registerEmail : '예매권 등록 기록 없음'}</td>
									</tr>
									<tr>
										<td>예매권 사용 일시</td>
										<td>
											<c:choose>
												<c:when test="${not empty ticket.usedAt}">
													<fmt:formatDate value="${ticket.usedAt}" pattern="yyyy-MM-dd HH:mm:ss" />
												</c:when>
												<c:otherwise>예매권 사용 기록 없음</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>예매권 사용한 회원 아이디</td>
										<td>${not empty ticket.userEmail ? ticket.userEmail : '예매권 사용 기록 없음'}</td>
									</tr>
									<tr>
										<td>해당 예매권이 사용된 예매번호</td>
										<td>${not empty ticket.reservationNumber ? ticket.reservationNumber : '예매권 사용 기록 없음'}</td>
									</tr>
									<tr>
										<td>예매권 발행한 관리자 아이디</td>
										<td>${ticket.adminEmail}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>