<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="stylesheet" href="${ctp}/vendors/select2/select2.min.css">
<link rel="stylesheet" href="${ctp}/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
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
									<h4 class="card-title">예매권 발행하기</h4>
									<p class="card-description">발행할 예매권의 매수를 선택해주세요.</p>
									<form class="forms-sample">
										<div class="form-group">
											<label for="quantitySelect">예매권 매수</label>
											<select class="form-control" id="quantitySelect" name="quantity">
												<c:forEach var="i" begin="1" end="10">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="emailSelect">이메일을 선택하세요.</label>
											<select class="js-example-basic-multiple w-100" id="emailSelect" name="email" multiple="multiple">
												<option value=""></option>
											</select>
										</div>
										<div class="form-check">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input">
												이메일 직접 입력
											</label>
										</div>
										<div class="form-group" id="customEmailGroup" style="display: none;">
											<label for="customEmail">이메일 직접 입력</label>
											<input type="email" class="form-control" id="customEmail" name="customEmail">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail3">이메일을 입력해주세요.</label>
											<input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
										</div>
										<button type="submit" class="btn btn-primary me-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
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
	<script src="${ctp}/js/member/login/autoLogin.js"></script>
	<script src="${ctp}/vendors/select2/select2.min.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
	<script src="${ctp}/js/admin/common/select2.js"></script>
</body>
</html>