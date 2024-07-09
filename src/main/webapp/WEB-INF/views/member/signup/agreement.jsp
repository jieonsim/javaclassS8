<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${ctp}/images/common/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<jsp:include page="/WEB-INF/views/member/signup/이용약관.jsp" />
<jsp:include page="/WEB-INF/views/member/signup/전자금융거래이용약관.jsp" />
<jsp:include page="/WEB-INF/views/member/signup/개인정보수집동의서_필수.jsp" />
<jsp:include page="/WEB-INF/views/member/signup/개인정보수집동의서_선택.jsp" />
<jsp:include page="/WEB-INF/views/member/signup/위치기반서비스이용약관.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/signup/common.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/signup.css">
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
				<div class="headerTitle">약관동의</div>
			</div>
		</div>
		<div class="contents">
			<div class="contentWrapper termsContent">
				<div class="uCheckbox allAgree">
					<label>
						<input type="checkbox">
						<span class="text">약관 전체 동의</span>
					</label>
				</div>
				<div class="termsBlock">
					<div class="label">필수 동의 항목</div>
					<div class="termsItem">
						<div class="uCheckbox sType">
							<label>
								<span class="inputWrap">
									<input type="checkbox" class="singleSelector requireSelector">
									<span class="text"></span>
								</span>
							</label>
							<div class="checkboxCont">
								<a href="#" class="btn btnLink" data-toggle="modal" data-target="#이용약관">[필수] 이용약관</a>
							</div>
						</div>
						<div class="uCheckbox sType">
							<label>
								<span class="inputWrap">
									<input type="checkbox" class="singleSelector requireSelector">
									<span class="text"></span>
								</span>
							</label>
							<div class="checkboxCont">
								<a href="#" class="btn btnLink" data-toggle="modal" data-target="#전자금융거래이용약관">[필수] 전자금융거래 이용약관</a>
							</div>
						</div>
						<div class="uCheckbox sType">
							<label>
								<span class="inputWrap">
									<input type="checkbox" class="singleSelector requireSelector">
									<span class="text"></span>
								</span>
							</label>
							<div class="checkboxCont">
								<a href="#" class="btn btnLink" data-toggle="modal" data-target="#개인정보수집동의서_필수">[필수] 개인정보 수집동의서</a>
							</div>
						</div>
					</div>
				</div>
				<div class="termsBlock">
					<div class="label">선택 동의 항목</div>
					<div class="termsItem">
						<div class="uCheckbox sType">
							<label>
								<span class="inputWrap">
									<input type="checkbox" class="singleSelector">
									<span class="text"></span>
								</span>
							</label>
							<div class="checkboxCont">
								<a href="#" class="btn btnLink" data-toggle="modal" data-target="#개인정보수집동의서_선택">[선택] 개인정보 수집동의서</a>
							</div>
						</div>
						<div class="uCheckbox sType">
							<label>
								<span class="inputWrap">
									<input type="checkbox" class="singleSelector">
									<span class="text"></span>
								</span>
							</label>
							<div class="checkboxCont">
								<a href="#" class="btn btnLink" data-toggle="modal" data-target="#위치기반서비스이용약관">[선택] 위치기반서비스 이용약관</a>
							</div>
						</div>
					</div>
				</div>
				<div class="ubtnArea">
					<div class="col">
						<button type="button" class="uBtn active" disabled data-id="nextStep" onclick="location.href='${ctp}/signup/form'">다음단계</button>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">Copyright © TicketChamp Corp. All rights reserved.</div>
		</div>
	</div>
	<script src="${ctp}/js/member/signup/agreement.js"></script>
</body>
</html>