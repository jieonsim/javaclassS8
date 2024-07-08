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
					<form name="restPasswordForm" method="post">
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
											<input type="text" name="email" value="" disabled>
										</div>
										<div class="inputStyle">
											<input name="password" class="pwdInput" type="password" placeholder="새 비밀번호" autofocus>
											<button type="button" class="inputBtn btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
										<div class="inputStyle">
											<input name="passwordConfirm" class="pwdInput" type="password" placeholder="새 비밀번호 확인">
											<button type="button" class="inputBtn btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
										<div class="errorMessage">
											<div class="message"></div>
											<!-- (공백일 때)영문, 숫자, 특수문자 8~12자로 입력해주세요. -->
											<!-- (정규식 불일치 시) 비밀번호 설정 규칙에 맞지 않습니다. -->
											<!-- (비밀번호 확인 인풋 발류가 위 비밀번호랑 다를 때) 비밀번호가 일치하지 않습니다. -->
											<!-- 현재의 비밀번호와 새로운 비밀번호를 다르게 설정해 주세요. (!!알럿!!) -->
											<!-- 회원님께서 요청하신 새로운 비밀번호로 변경하였습니다. (!!알럿!!) -->
										</div>
										<div class="dotMessage">
											<div class="message">영문/숫자/특수문자 중 2가지 이상을 포함하여 8~12자로 입력해주세요.</div>
										</div>
										<div class="signinStay">
											<div class="checkbox">
												<input type="checkbox" id="saveSess" name="saveSess" checked>
											</div>
										</div>
									</div>
									<div class="bottomBtnWrap">
										<button type="button" class="redBtn" onclick="location.href='${ctp}/login'">확인</button>
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
</body>
</html>