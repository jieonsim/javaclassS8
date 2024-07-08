<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="icon" href="${ctp}/images/common/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${ctp}/css/member/signup/common.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/choice.css">
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
			</div>
		</div>
		<div class="contents">
			<div class="contentWrapper joinContent">
				<div class="joinBlock singleBlock">
					<h2 class="title">티켓챔프 회원가입</h2>
					<p class="text">
						지금 회원가입 하신 후 티켓챔프에서
						<br>
						다양한 서비스를 경험해보세요
					</p>
					<button type="button" class="sBtn point btnJoin" onclick="location.href='${ctp}/signup/agreement'">일반 회원가입</button>
					<div class="snsJoinArea">
						<ul class="listSns">
							<li class="snsNaver">
								<a href="#" class="btnSns snsNaverBtn">
									<span>네이버로 가입</span>
								</a>
							</li>
							<li class="snsKakao">
								<a href="#" class="btnSns snsKakaoBtn">
									<span>카카오로 가입</span>
								</a>
							</li>
						</ul>
						<p class="guideText">SNS계정 회원가입(만 14세 이상 가능)</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">Copyright © TicketChamp Corp. All rights
				reserved.</div>
		</div>
	</div>
</body>
</html>