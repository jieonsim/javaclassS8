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
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">요금 등록</h4>
									<p class="card-description">
										스포츠 > 팀 > 경기장 > 좌석 선택 후 등록해주세요.
									</p>
									<form class="forms-sample" id="insertPriceForm">
										<div class="form-group">
											<label for="inputSportName">스포츠 종목</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputSportName" name="sportName">
												<c:forEach items="${sports}" var="sport">
													<option value="${sport}">${sport}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputTeamName">팀</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputTeamName" name="teamName">
												<c:forEach items="${teams}" var="team">
													<option value="${team}">${team}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputSeatName">경기장</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputVenueName" name="venueName">
												<option value="">경기장 선택</option>
												<c:forEach items="${venues}" var="venue">
													<option value="${venue.venueName}">${venue.venueName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputSeatName">좌석 등급</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputSeatName" name="seatName">
												<option value="">좌석 등급 선택</option>
												<c:forEach items="${seats}" var="seat">
													<option value="${seat.seatName}">${seat.seatName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputTicketTypeCategory">권종 카테고리</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputTicketTypeCategory" name="ticketTypeCategory">
												<option value="">권종 카테고리 선택</option>
												<c:forEach items="${ticketCategories}" var="category">
													<option value="${category}">${category}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputTicketTypeName">권종명</label>
											<select class="form-control form-control-lg bg-white text-dark" id="inputTicketTypeName" name="ticketTypeName">
												<option value="">권종명 선택</option>
											</select>
										</div>
										<div class="form-group">
											<label for="inputPrice">요금</label>
											<input type="number" class="form-control form-control-lg" id="inputPrice" name="price" placeholder="권종별 요금을 입력하세요.">
										</div>
										<button type="submit" class="btn btn-primary me-2">Submit</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">신규 등록된 요금 목록</h4>
									<ul id="priceList" class="list-group p-3">
										<!-- 여기에 동적으로 경기 목록이 추가됨 -->
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/admin/sports/price/priceRegister.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>