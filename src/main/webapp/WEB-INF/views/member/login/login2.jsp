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
<jsp:include page="/WEB-INF/views/common/utility.jsp">
<link rel="stylesheet" href="${ctp}/css/member/login/login2.css">
<%-- <link rel="stylesheet" href="${ctp}/css/member/login/common.css"> --%>
<link rel="icon" href="${ctp}/images/common/favicon.png">
</head>
<body>
	<div id="container" class="container login">
		<header> </header>
		<div class="loginWrap">
			<div class="loginLogo">
				<a href="https://www.interpark.com/">
					<h1 class="logo">
						<span>interpark</span>
					</h1>
				</a>
			</div>
			<form id="loginFrm" name="loginFrm" method="post"
				action="/login/submit" data-onsubmit="return false;"
				onsubmit="return false;" autocomplete="off" data-method="ajax">
				<input type="hidden" id="postProc" name="postProc"
					value="FULLSCREEN">
				<input type="hidden" id="LOGIN_TP" name="LOGIN_TP" value="1500">
				<input type="hidden" id="fromSVC" name="fromSVC" value="inpark">
				<input type="hidden" id="bizId" name="bizId" value="15">
				<div class="loginInner">
					<div class="loginForm">
						<div class="inputBox">
							<div class="inputStyle inputId">
								<label>
									<input value="" autofocus type="text" class="inputText id"
										name="userId" id="userId" placeholder="아이디">
									<span class="focusLine"></span>
									<i>
										<svg></svg>
									</i>
									<button type="button" class="inputBtn btnDel">
										<span class="blind">삭제</span>
									</button>
								</label>
							</div>
							<div class="inputStyle inputPw">
								<label>
									<input type="password" class="inputText pw" name="userPwd"
										id="userPwd" placeholder="비밀번호">
									<span class="focusLine"></span>
									<i> </i>
									<button type="button" class="inputBtn btnShowToggle">
										<span class="blind">비밀번호 노출상태 변경버튼</span>
									</button>
								</label>
							</div>
						</div>
						<div class="errorMessage">
							<div class="message">아이디 또는 비밀번호가 맞지 않아요. 다시 입력해 주세요.</div>
						</div>

					</div>
					<div class="signinStay">
						<div class="checkbox">
							<input type="checkbox" id="saveSess" name="saveSess" value="N">
							<label for="saveSess">로그인 상태 유지</label>
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
								<a id="findId" class="findId" href="#">아이디 찾기</a>
							</li>
							<li>
								<a id="findPwd" href="#">비밀번호 찾기</a>
							</li>
							<li>
								<a id="join" href="#">회원가입</a>
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
		<div class="layerContainer" id="findIdLayer">
			<div class="layer">
				<p class="layerTitle">
					<b>
						아이디 또는 비밀번호가 틀려<br>로그인 할 수 없어요.
					</b>
				</p>
				<p class="layerText">먼저 계정을 찾아주세요.</p>
				<div class="btn">
					<button type="button" class="btnClose">취소</button>
					<a href="#" class="btnFind findId">계정 찾기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>