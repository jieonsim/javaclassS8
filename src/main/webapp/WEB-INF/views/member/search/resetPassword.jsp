<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 재설정-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/search/common_search.css">
<link rel="stylesheet" href="${ctp}/css/member/search/search.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/member/search/header.jsp" />
	<table>
		<tbody>
			<tr>
				<td align="left">
					<p></p>
				</td>
			</tr>
			<tr>
				<td align="left">
					<form name="restPasswordForm" method="post" id="restPasswordForm">
						<div class="searchContainer">
							<div class="infoSearchWrap">
								<div class="infoSearchHeader">
									<div class="backButton">
										<button type="button" onclick="location.href='${ctp}/login'">뒤로가기</button>
									</div>
									<h2>계정 찾기</h2>
								</div>
								<div class="infoSearchBody">
									<div class="searhTabWrap">
										<div class="tabWrap">
											<div class="tab">
												<a href="${ctp}/search/matchEmail">아이디 찾기</a>
											</div>
											<div class="tab current">
												<a href="${ctp}/search/matchPassword">비밀번호 찾기</a>
											</div>
										</div>
									</div>
									<div class="resetWrapper">
										<h3>
											인증이 완료되었어요<br>비밀번호를 재설정 해주세요
										</h3>
										<div class="inputStyle disable">
											<input type="text" name="email" id="inputEmail" value="${email}" disabled>
										</div>
										<div class="inputStyle">
											<input type="password" name="password" class="pwdInput" id="inputNewPassword" placeholder="새 비밀번호" autofocus>
											<button type="button" class="inputBtn btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
										<div class="inputStyle">
											<input type="password" name="passwordConfirm" class="pwdInput" id="inputNewPasswordConfirm" placeholder="새 비밀번호 확인">
											<button type="button" class="inputBtn btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
										<div class="errorMessage">
											<div class="message"></div>
										</div>
										<div class="dotMessage">
											<div class="message">영문/숫자/특수문자 중 2가지 이상을 포함하여 8~12자로 입력해주세요.</div>
										</div>
									</div>
									<div class="bottomBtnWrap">
										<button type="submit" class="redBtn">확인</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<p></p>
				</td>
			</tr>
		</tbody>
	</table>
	<script src="${ctp}/js/member/search/resetPassword.js"></script>
</body>
</html>