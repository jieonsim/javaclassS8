<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/login/common.css">
<link rel="stylesheet" href="${ctp}/css/member/login/login.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<div id="container" class="loginContainer login">
		<header> </header>
		<div class="loginWrap">
			<div class="loginLogo">
				<a class="header_title_link" href="${ctp}/home">
					<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
					<span class="logo-text">ticket</span>
					<span class="logo-text champ">champ</span>
				</a>
			</div>
			<form id="loginForm">
				<div class="loginInner">
					<div class="loginForm" id="loginForm">
						<div class="inputBox">
							<div class="inputStyle inputId">
								<label>
									<input type="text" class="inputText id" name="email"
										id="userId" placeholder="이메일" autofocus>
									<span class="focusLine"></span>
									<i> <img alt="유저아이콘" src="${ctp}/images/icon/user.svg">
									</i>
									<button type="button" class="inputBtn btnDel">
										<span class="blind">삭제</span>
									</button>
								</label>
							</div>
							<div class="inputStyle inputPw">
								<label>
									<input type="password" class="inputText pw" name="password"
										id="userPwd" placeholder="비밀번호">
									<span class="focusLine"></span>
									<i> <img alt="자물쇠아이콘" src="${ctp}/images/icon/lock.svg">
									</i>
									<button type="button" class="inputBtn btnShowToggle">
										<span class="blind">비밀번호 노출상태 변경버튼</span>
									</button>
								</label>
							</div>
						</div>
						<div class="errorMessage">
							<div class="message"></div>
						</div>
					</div>
					<div class="signinStay">
						<div class="checkbox">
							<input type="checkbox" id="autoLogin" name="autoLogin">
							<label for="autoLogin">로그인 상태 유지</label>
						</div>
					</div>
					<div class="loginButtonBox">
						<button type="button" class="loginBtn" id="btn_login">
							<span>로그인</span>
						</button>
					</div>
					<div class="findList">
						<ul>
							<li>
								<a id="findId" class="findId" href="${ctp}/search/matchId">아이디
									찾기</a>
							</li>
							<li>
								<a id="findPwd" href="${ctp}/search/checkId">비밀번호 찾기</a>
							</li>
							<li>
								<a id="join" href="${ctp}/signup/agreement">회원가입</a>
							</li>
						</ul>
					</div>
					<div class="snsLogin">
						<ul>
							<li id="kakao_li">
								<a href="#" class="kakao" id="openid_kakao">
									<span>카카오톡</span>
								</a>
							</li>
							<li id="naver_li">
								<a href="#" class="naver" id="openid_naver">
									<span>네이버</span>
								</a>
							</li>
							<li id="apple_li">
								<a href="#" class="apple" id="openid_apple">
									<span>애플</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- <script>
		var ctp = '${ctp}';
	</script> -->
	<script src="${ctp}/js/member/login/login.js"></script>
</body>
</html>