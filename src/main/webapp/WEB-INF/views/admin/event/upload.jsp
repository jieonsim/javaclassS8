<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="stylesheet" href="${ctp}/css/admin/event/upload.css">
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
									<h4 class="card-title">이벤트 업로드</h4>
									<p class="card-description">이벤트 상태를 <mark class="bg-warning text-white">진행 중으로 선택 시 이벤트 메인에 즉시 업로드</mark>됩니다.</p>
									<form class="forms-sample" id="eventUploadForm" name="eventUploadForm" method="post" enctype="multipart/form-data">
										<div class="form-group" id="eventTitle">
											<label for="inputEventTitle"></label>
											<input type="text" class="form-control" id="inputEventTitle" name="title" placeholder="이벤트명을 입력하세요.">
										</div>
										<div class="row">
											<div class="col-md-3">
												<label class="col-sm-5 col-form-label" for="inputCategory">카테고리</label>
												<div class="form-group row">
													<div class="col-sm-7 ml-3">
														<select class="form-control" id="inputCategory" name="eventCategory">
															<c:forEach var="category" items="${categories}">
																<option value="${category}">${category.displayName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-sm-5 col-form-label" for="inputStatus">상태</label>
												<div class="form-group row">
													<div class="col-sm-7 ml-3">
														<select class="form-control" id="inputStatus" name="status">
															<c:forEach var="status" items="${status}">
																<option value="${status}">${status.displayName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-sm-4 col-form-label" for="inputStartDate">시작일</label>
												<div class="form-group row">
													<div class="col-sm-8 ml-3">
														<input type="date" class="form-control" id="inputStartDate" name="startDate">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-sm-4 col-form-label" for="inputEndDate">종료일</label>
												<div class="form-group row">
													<div class="col-sm-8 ml-3">
														<input type="date" class="form-control" id="inputEndDate" name="endDate">
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="inputThumbnail"></label>
											<input type="file" name="thumbnailFile" id="inputThumbnail" class="file-upload-default">
											<div class="input-group col-xs-12 px-3">
												<input type="text" class="form-control file-upload-info" disabled placeholder="썸네일 이미지를 업로드하세요.">
												<span class="input-group-append">
													<button class="file-upload-browse btn btn-primary" type="button" id="thumbnailUploadBtn">Upload</button>
												</span>
											</div>
										</div>
										<div class="form-group px-3">
											<label for="CKEDITOR"></label>
											<textarea class="form-control" rows="6" name="content" id="CKEDITOR"></textarea>
										</div>
										<div class="form-group px-3">
											<button type="submit" class="btn btn-primary me-2" id="submitBtn">Submit</button>
											<button class="btn btn-light">Cancel</button>
										</div>
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
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
	<script src="${ctp}/js/admin/event/upload.js"></script>
</body>
</html>