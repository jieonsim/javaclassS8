<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${ctp}/images/common/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/signup/common.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/signup.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/complete.css">
</head>
<body>
	<div class="memberContainer">
		<div class="header">
			<div class="headerInner">
				<a class="header_title_link" href="${ctp}/">
					<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
					<span class="logo-text">ticket</span>
					<span class="logo-text champ">champ</span>
				</a>
			</div>
		</div>
		<div class="contents">
			<div class="contentWrapper registContent">
				<div class="text-center">
					<div class="celebration-icon">
						<img alt="에러메시지아이콘" src="${ctp}/images/icon/error.png">
					</div>
					<div class="complete-text">
						<p id="completeText1">Method Not Allowed</p>
						<p id="completeText2" class="mt-3">
							요청하신 메서드는 허용되지 않습니다.
							<br>
							올바른 요청 메서드를 사용하시거나, 관리자에게 문의해 주세요.
						</p>
					</div>
				</div>
				<div>
					<div class="ubtnArea">
						<div class="col">
							<button type="button" class="uBtn point" onclick="location.href='${ctp}/'">티켓챔프 홈으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">Copyright © TicketChamp Corp. All rights reserved.</div>
		</div>
	</div>
</body>
</html>