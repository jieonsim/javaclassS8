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
									<h4 class="card-title">전체 회원리스트</h4>
									<div class="d-flex justify-content-end">
										<div class="mx-2">
											<select class="form-control bg-white text-dark" id="inputCategory" name="eventCategory">
												<option selected disabled>회원 상태 변경</option>
												<option value="활동 중">활동 중</option>
												<option value="활동 정지">활동 정지</option>
											</select>
										</div>
										<div class="mx-2">
											<label for="inputSearch"></label>
											<div class="input-group">
												<div class="input-group-prepend">
													<button type="submit" class="input-group-text">
														<i class="icon-search"></i>
													</button>
												</div>
												<input type="search" id="inputSearch" name="keyword" class="form-control" placeholder="Search Here" title="Search here">
											</div>
										</div>
										<div class="mx-2">
											<button type="button" class="btn btn-sm btn-secondary" id="resetBtn">전체조회</button>
										</div>
									</div>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 5%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
												<col style="width: 10%" />
											</colgroup>
											<thead class="text-center">
												<tr>
													<th>
														<div class="form-check m-0">
															<label class="form-check-label m-0">
																<input type="checkbox" class="form-check-input">
																<i class="input-helper"></i>
															</label>
														</div>
													</th>
													<th>이메일 아이디</th>
													<th>이름</th>
													<th>휴대폰번호</th>
													<th>가입일시</th>
													<th>활동상태</th>
													<th>마지막 로그인 일시</th>
													<th>활동상태 변경일시</th>
													<th>등급</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<tr>
													<td>
														<div class="form-check m-0">
															<label class="form-check-label m-0">
																<input type="checkbox" class="form-check-input">
																<i class="input-helper"></i>
															</label>
														</div>
													</td>
													<td>zieonsim@gmail.com</td>
													<td>심지언</td>
													<td>01012345678</td>
													<td>2024-07-07 23:24:34</td>
													<td>활동 중</td>
													<td>2024-08-02 17:14:15</td>
													<td>2024-08-02 15:53:19</td>
													<td class="text-danger">관리자</td>
												</tr>
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