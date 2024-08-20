<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
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
									<div class="d-flex justify-content-between">
										<h4 class="card-title">
											<span class="text-danger">${eventTitle}&nbsp;</span>
											당첨자 리스트
										</h4>
										<div class="d-flex justify-content-end mb-2">
												<%-- <c:if test="${!isAnnounced}"> --%>
													<div class="mx-2">
														<button type="button" class="btn btn-sm btn-secondary" id="announcementBtn">당첨자 발표 업로드</button>
													</div>
												<%-- </c:if> --%>
											<div class="mx-2">
												<button type="button" class="btn btn-sm btn-secondary" id="sendMailBtn">당첨 안내 및 예매권 메일 발송</button>
											</div>
										</div>
									</div>
									<p class="card-description">
										우측 상단 버튼을 통해 당첨자 발표 포스팅 및 예매권 메일 발송이 가능합니다.
									</p>
									<div class="table-responsive">
										<table class="table">
											<thead class="text-center">
												<tr>
													<th>No.</th>
													<th>이름</th>
													<th>이메일</th>
													<th>예매권 번호</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${winnerDetails}" var="winner" varStatus="status">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-center">${winner.name}</td>
														<td class="text-center">${winner.email}</td>
														<td class="text-center">${winner.advanceTicketNumber}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="winnerAnnouncementBox" style="display: none;">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<form class="forms-sample" id="winnerAnnouncementForm" method="post">
										<input type="hidden" name="eventId" value="${eventId}" id="eventId" />
										<input type="hidden" name="drawAt" value="${drawAt}" id="drawAt" />
										<input type="hidden" name="title" value="${eventTitle}" id="inputTitle" />
										<h4 class="card-title">당첨자 발표 업로드</h4>
										<p class="card-description mb-0 ">
											당첨자 발표 등록 시
											<mark class="bg-warning text-white">즉시 업로드</mark>
											됩니다.
										</p>
										<div class="form-group">
											<label for="CKEDITOR"></label>
											<textarea class="form-control" rows="5" name="content" id="CKEDITOR">
											<p>
												<b>${eventTitle}</b>
												<br>당첨자 발표
											</p>
											<p></p>
											<p>
											<c:forEach items="${winnerDetails}" var="winner">
											${winner.email}<br>
											</c:forEach>
											</p>
											<p></p>
											<p>당첨자께는 개별 안내 예정입니다.<br>감사합니다.</p>
										</textarea>
										</div>
										<button type="submit" class="btn btn-primary me-2" id="submitBtn">Submit</button>
										<button type="reset" class="btn btn-light" id="resetBtn">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/admin/event/winnerDetail.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>