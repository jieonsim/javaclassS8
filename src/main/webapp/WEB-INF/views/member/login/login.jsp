<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<a class="header_title_link" href="${ctp}/">
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
									<input type="text" class="inputText id" name="email" id="userId" placeholder="이메일" autofocus value="${selectedEmail}">
									<span class="focusLine"></span>
									<i>
										<img alt="유저아이콘" src="${ctp}/images/icon/user.svg">
									</i>
									<button type="button" class="inputBtn btnDel">
										<span class="blind">삭제</span>
									</button>
								</label>
							</div>
							<div class="inputStyle inputPw">
								<label>
									<input type="password" class="inputText pw" name="password" id="userPwd" placeholder="비밀번호" autoComplete="off">
									<span class="focusLine"></span>
									<i>
										<img alt="자물쇠아이콘" src="${ctp}/images/icon/lock.svg">
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
							<input type="checkbox" id="saveSession" name="saveSession">
							<label for="saveSession">로그인 상태 유지</label>
						</div>
					</div>
					<div class="loginButtonBox">
						<button type="submit" class="loginBtn" id="btn_login">
							<span>로그인</span>
						</button>
					</div>
					<div class="findList">
						<ul>
							<li>
								<a id="findId" class="findId" href="${ctp}/search/matchEmail">아이디 찾기</a>
							</li>
							<li>
								<a id="findPwd" href="${ctp}/search/matchPassword">비밀번호 찾기</a>
							</li>
							<li>
								<a id="join" href="${ctp}/signup/agreement">회원가입</a>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctp}/js/member/login/login.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// login.js에서 로그인 성공 후 호출할 함수
			window.updateMenuAfterLogin = function(user) {
				// autoLogin.js의 updateMenu 함수 호출
				if (typeof updateMenu === 'function') {
					updateMenu(user);
				}
			};
		});
	</script>
</body>
</html>