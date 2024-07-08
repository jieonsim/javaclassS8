<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${ctp}/images/common/favicon.ico"
	type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/signup/common.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/signup.css">
</head>
<body>
	<div class="memberContainer">
		<div class="header">
			<div class="headerInner">
				<a class="header_title_link" href="${ctp}/home">
					<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
					<span class="logo-text">ticket</span>
					<span class="logo-text champ">champ</span>
				</a>
				<div class="headerTitle">정보입력</div>
			</div>
		</div>
		<div class="contents">
			<form id="signupForm" method="post">
				<div class="contentWrapper registContent">
					<div class="uBlock">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputEmail">이메일</label>
									<div class="inputBox">
										<input type="text" id="inputEmail" name="email" class="inputText"
											placeholder="정확한 이메일 주소를 작성해주세요." tabindex="1" autofocus>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="ubtnArea">
									<button type="button" id="getCertifyNumBtn"
										class="uBtn borderType">인증번호받기</button>
								</div>
							</div>
						</div>
						<div class="uErrorText"></div>
						<div class="accountValiBlock" style="display: none;">
							<div class="accountGuide">
								<div>
									<span class="account"></span>
									<span class="date"></span>
									은 이미 가입된 이메일입니다.
								</div>
							</div>
							<p class="blockText">해당 계정으로 로그인 하시겠습니까?</p>
							<a href="${ctp}/login" class="btn btnArrow">로그인하기</a>
						</div>
					</div>
					<div class="uBlock" style="display: none;">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputCertifyNum">인증번호</label>
									<div class="inputBox">
										<input type="text" id="inputCertifyNum" class="inputText"
											tabindex="2"
											oninput="this.value = this.value.replace(/[^0-9]/g, '');">
									</div>
								</div>
							</div>
							<div class="col">
								<div class="ubtnArea">
									<button type="button" class="uBtn borderType">재발송</button>
									<button type="button" class="uBtn borderType">확인</button>
								</div>
							</div>
						</div>
						<div class="certifyTime">
							인증유효시간
							<span class="time">00:00</span>
						</div>
					</div>
					<div class="uBlock">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputPassword">비밀번호</label>
									<div class="inputBox">
										<input type="password" id="inputPassword" name="password" class="inputText"
											placeholder="8~12자 영문, 숫자, 특수문자" tabindex="3">
									</div>
								</div>
							</div>
							<div class="col">
								<div class="ubtnArea">
									<button type="button" class="uBtn togglePassword">보기</button>
								</div>
							</div>
						</div>
						<div class="uErrorText"></div>
					</div>
					<div class="uBlock">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputPasswordConfirm">비밀번호 확인</label>
									<div class="inputBox">
										<input type="password" id="inputPasswordConfirm"
											class="inputText" placeholder="8~12자 영문, 숫자, 특수문자"
											tabindex="4">
									</div>
								</div>
							</div>
							<div class="col">
								<div class="ubtnArea">
									<button type="button" class="uBtn togglePasswordConfirm">보기</button>
								</div>
							</div>
						</div>
						<div class="uErrorText"></div>
					</div>
					<div class="uBlock">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputName">이름</label>
									<div class="inputBox">
										<input type="text" id="inputName" name="name" class="inputText"
											tabindex="5">
									</div>
								</div>
							</div>
						</div>
						<div class="uErrorText"></div>
					</div>
					<div class="uBlock">
						<div class="uInputArea">
							<div class="col">
								<div class="uInput">
									<label for="inputCellphone">휴대폰</label>
									<div class="inputBox">
										<input type="text" id="inputCellphone" name="phone" class="inputText"
											placeholder="010 1234 5678" tabindex="6"
											oninput="this.value = this.value.replace(/[^0-9]/g, '');">
									</div>
								</div>
							</div>
						</div>
						<div class="uErrorText"></div>
					</div>
					<div class="ubtnArea">
						<div class="col">
							<button type="submit" class="uBtn point" disabled>가입완료</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="footer">
			<div class="copyright">Copyright © TicketChamp Corp. All rights
				reserved.</div>
		</div>
	</div>
	<!-- <script>
		var ctp = '${ctp}';
	</script> -->
	<script src="${ctp}/js/member/signup/form.js"></script>
</body>
</html>