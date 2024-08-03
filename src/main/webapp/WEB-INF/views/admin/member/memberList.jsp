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
									<div class="row">
										<div class="col-sm-6">
											<h4 class="card-title">전체 회원리스트</h4>
										</div>
										<div class="col-sm-6">
											<form id="searchForm" action="${ctp}/admin/member/search" method="GET">
												<div class="input-group">
													<select name="status" class="form-control bg-white text-dark">
														<option value="">모든 상태</option>
														<option value="1">활동 중</option>
														<option value="2">활동 정지</option>
														<option value="3">탈퇴</option>
													</select>
													<select name="role" class="form-control bg-white text-dark">
														<option value="">모든 등급</option>
														<option value="USER">유저</option>
														<option value="ADMIN">관리자</option>
													</select>
													<label for="inputSearch"></label>
													<input type="search" id="inputSearch" name="keyword" class="form-control" placeholder="Search Here" title="Search here">
													<div class="input-group-prepend">
														<button type="submit" class="input-group-text">
															<i class="icon-search"></i>
														</button>
													</div>
													<button type="button" class="btn btn-sm btn-secondary mx-2" id="resetBtn">전체조회</button>
												</div>
											</form>
										</div>
									</div>
									<form id="memberUpdateForm">
										<div class="d-flex justify-content-end">
											<div class="p-2">
												<select class="form-control bg-white text-dark" id="inputStatus" name="status">
													<option>활동 상태 변경</option>
													<option value="1">활동 중</option>
													<option value="2">활동 정지</option>
													<option value="3">탈퇴</option>
												</select>
											</div>
											<div class="p-2">
												<select class="form-control bg-white text-dark" id="inputRole" name="role">
													<option>등급 변경</option>
													<option value="USER">유저</option>
													<option value="ADMIN">관리자</option>
												</select>
											</div>
											<div class="p-2">
												<button type="button" class="btn btn-sm btn-primary" id="updateBtn">변경 적용</button>
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
																	<input type="checkbox" class="form-check-input" id="inputAllCheck" name="allCheck">
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
													<c:forEach items="${members}" var="member">
														<tr>
															<td>
																<div class="form-check m-0">
																	<label class="form-check-label m-0">
																		<input type="checkbox" class="form-check-input" data-member-id="${member.id}" id="inputMemberId_${member.id}" name="memberId">
																		<i class="input-helper"></i>
																	</label>
																</div>
															</td>
															<td>${member.email}</td>
															<td>${member.name}</td>
															<td>${member.phone}</td>
															<td>
																<fmt:formatDate value="${member.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" />
															</td>
															<td>
																<c:choose>
																	<c:when test="${member.status == 1}">
																		<label class="badge badge-success">활동 중</label>
																	</c:when>
																	<c:when test="${member.status == 2}">
																		<label class="badge badge-warning">활동 정지</label>
																	</c:when>
																	<c:when test="${member.status == 3}">
																		<label class="badge badge-danger">탈퇴</label>
																	</c:when>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${empty member.lastLoginAt}">로그인 기록 없음</c:when>
																	<c:otherwise>
																		<fmt:formatDate value="${member.lastLoginAt}" pattern="yyyy-MM-dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${empty member.statusChangedAt}">활동상태 변경 기록 없음</c:when>
																	<c:otherwise>
																		<fmt:formatDate value="${member.statusChangedAt}" pattern="yyyy-MM-dd HH:mm:ss" />
																	</c:otherwise>
																</c:choose>
															</td>
															<td class="${member.role == 'ADMIN' ? 'text-danger' : ''}">${member.role == 'ADMIN' ? '관리자' : '유저'}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
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
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
	<script src="${ctp}/js/admin/member/memberList.js"></script>
</body>
</html>