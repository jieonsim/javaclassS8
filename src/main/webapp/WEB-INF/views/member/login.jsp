<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<jsp:include page="/WEB-INF/views/include/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/login.css">
<link rel="icon" href="${ctp}/images/common/favicon.png">
</head>
<body>
	<div class="container" id="login_container">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<header></header>
				<div class="loginWrap">
					<div class="loginLogo text-center mb-4">
						<i class="ph ph-person-simple-throw" id="header_title_logo"></i>
						<a class="header_title_link" href="${ctp}/">
							<span class="logo-text">ticket</span>
							<span class="logo-text champ">champ</span>
						</a>
					</div>
					<div class="loginInner">
						<form id="loginForm" name="loginForm" method="post">
							<!-- <div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="ph ph-user"></i>
										</span>
									</div>
									<input type="email" class="form-control custom-input"
										name="email" id="email" placeholder="이메일 아이디">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="ph ph-lock"></i>
										</span>
									</div>
									<input type="password" class="form-control custom-input"
										name="password" id="password" placeholder="비밀번호">
								</div>
							</div> -->
							<div class="form-group">
								<div class="input-group custom-input-group">
									<span class="input-group-prepend">
										<i class="ph ph-user"></i>
									</span>
									<input type="email" class="form-control custom-input"
										name="email" id="email" placeholder="이메일 아이디">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group custom-input-group">
									<span class="input-group-prepend">
										<i class="ph ph-lock"></i>
									</span>
									<input type="password" class="form-control custom-input"
										name="password" id="password" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="saveSession" name="saveSession" value="N">
									<label class="custom-control-label" for="saveSession">로그인
										상태 유지</label>
								</div>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-block loginBtn"
									id="loginBtn">
									<span>로그인</span>
								</button>
							</div>
						</form>
						<div class="findList mt-3">
							<ul class="nav justify-content-center">
								<li class="nav-item">
									<a class="nav-link px-2" id="findId" href="#">아이디 찾기</a>
								</li>
								<li class="nav-item">
									<a class="nav-link px-2" id="findPwd" href="#">비밀번호 찾기</a>
								</li>
								<li class="nav-item">
									<a class="nav-link px-2" id="signup" href="#">회원가입</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>