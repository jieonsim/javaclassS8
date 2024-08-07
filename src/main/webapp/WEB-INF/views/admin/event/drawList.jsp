<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="${ctp}/css/admin/event/event.css">
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
									<h4 class="card-title">이벤트 추첨 리스트</h4>
									<p class="card-description mb-0">
										이벤트명 클릭 시 당첨자 리스트를 확인할 수 있습니다.
										<br>
										상세 페이지로 이동하여 당첨자 발표 포스팅 및 메일 발송이 가능합니다.
									</p>
									<div class="table-responsive">
										<table class="table">
											<thead class="text-center">
												<tr>
													<th>No.</th>
													<th>카테고리</th>
													<th>이벤트명</th>
													<th>이벤트 기간</th>
													<th>당첨자 발표</th>
													<th>예매권 메일 발송</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${drawSummaries}" var="drawSummary" varStatus="status">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-center">${drawSummary.eventCategory.displayName}</td>
														<td>
															<a href="${ctp}/admin/event/winnerDetail?eventId=${drawSummary.eventId}&drawAt=${fn:replace(drawSummary.drawAt, ' ', 'T')}" style="text-decoration: none; color: #212529;">${drawSummary.title}</a>
														</td>
														<td class="text-center">${drawSummary.startDate}&nbsp;~&nbsp;${drawSummary.endDate}</td>
														<td class="text-center">
															<c:choose>
																<c:when test="${drawSummary.announced}">
																	<label class="badge badge-success">Y</label>
																</c:when>
																<c:otherwise>
																	<label class="badge badge-danger">N</label>
																</c:otherwise>
															</c:choose>
														</td>
														<td class="text-center">
															<c:choose>
																<c:when test="${drawSummary.ticketSentStatus == 'PENDING'}">
																	<label class="badge badge-warning">${drawSummary.ticketSentStatus.displayName}</label>
																</c:when>
																<c:when test="${drawSummary.ticketSentStatus == 'SENT'}">
																	<label class="badge badge-success">${drawSummary.ticketSentStatus.displayName}</label>
																</c:when>
																<c:when test="${drawSummary.ticketSentStatus == 'FAILED'}">
																	<label class="badge badge-danger">${drawSummary.ticketSentStatus.displayName}</label>
																</c:when>
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
						<ul class="pagination justify-content-center">
							<c:if test="${paginationInfo.hasPreviousPage}">
								<li class="page-item">
									<a class="page-link" href="?page=${paginationInfo.currentPage - 1}">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${paginationInfo.startPage}" end="${paginationInfo.endPage}" var="pageNum">
								<li class="page-item ${pageNum == paginationInfo.currentPage ? 'active' : ''}">
									<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
								</li>
							</c:forEach>
							<c:if test="${paginationInfo.hasNextPage}">
								<li class="page-item">
									<a class="page-link" href="?page=${paginationInfo.currentPage + 1}">Next</a>
								</li>
							</c:if>
						</ul>
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