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
						<div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">스포츠 팀별 정책 등록</h4>
									<p class="card-description">팀을 선택해주세요.</p>
									<form class="forms-sample" id="sportForm">
										<div class="form-group">
											<label for="inputSportName"></label>
											<input type="text" class="form-control" id="inputSportName" name="sportName" placeholder="스포츠 종목">
										</div>
										<button type="submit" class="btn btn-primary me-2" id="sportSubmitBtn">종목 등록</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">팀</h4>
									<p class="card-description">스포츠 종목을 선택 후 팀 이름을 입력해주세요.</p>
									<form class="forms-sample" id="teamForm">
										<div class="form-group">
											<label for="inputSportNameSelect">스포츠 종목</label>
											<select class="form-control bg-light text-dark" id="inputSportNameSelect" name="sportName">
												<option value="" selected disabled>종목을 선택해주세요.</option>
												<c:forEach items="${sports}" var="sport">
													<option value="${sport}" ${sport eq selectedSport ? 'selected' : ''}>${sport}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputTeamName">팀 이름</label>
											<input type="text" class="form-control" id="inputTeamName" name="teamName" placeholder="팀 이름">
										</div>
										<div class="form-group">
											<label for="inputShortName">팀 단축 이름</label>
											<input type="text" class="form-control" id="inputShortName" name="shortName" placeholder="팀 단축 이름">
										</div>
										<button type="submit" class="btn btn-primary me-2" id="teamSubmitBtn">팀 등록</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경기장</h4>
									<p class="card-description">스포츠 종목과 팀을 선택 후 경기장 정보를 입력해주세요.</p>
									<form class="forms-sample" id="venueForm">
										<div class="form-group">
											<label for="inputSportNameSelectVenue">스포츠 종목</label>
											<select class="form-control bg-light text-dark" id="inputSportNameSelectVenue" name="sportName">
												<option value="" selected disabled>종목을 선택해주세요.</option>
												<c:forEach items="${sports}" var="sport">
													<option value="${sport}" ${sport eq selectedSport ? 'selected' : ''}>${sport}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputTeamNameSelectVenue">팀</label>
											<select class="form-control bg-light text-dark" id="inputTeamNameSelectVenue" name="teamName">
												<option value="" selected disabled>종목 선택 후 홈팀을 선택해주세요.</option>
												<c:forEach items="${teams}" var="team">
													<option value="${team.teamName}" data-sport="${team.sportName}" ${team.teamName eq selectedTeam ? 'selected' : ''}>${team.teamName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="inputVenueName">경기장 이름</label>
											<input type="text" class="form-control" id="inputVenueName" name="venueName" placeholder="경기장 이름">
										</div>
										<div class="form-group">
											<label for="inputAddress">경기장 주소</label>
											<input type="text" class="form-control" id="inputAddress" name="address" placeholder="경기장 주소">
										</div>
										<div class="form-group">
											<label for="inputCapacity">경기장 수용 인원</label>
											<input type="number" class="form-control" id="inputCapacity" name="capacity" placeholder="경기장 수용 인원">
										</div>
										<button type="submit" class="btn btn-primary me-2" id="venueSubmitBtn">경기장 등록</button>
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
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>