<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기-티켓챔프</title>
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
					<form name="MemberMatchPwdForm" method="post">
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
												<a href="${ctp}/search/matchId">아이디 찾기</a>
											</div>
											<div class="tab current">
												<a href="${ctp}/search/checkId">비밀번호 찾기</a>
											</div>
										</div>
									</div>
									<div class="resetWrapper">
										<h3>
											이메일 아이디 확인 후<br>비밀번호를 재설정 할 수 있어요
										</h3>
										<div class="inputStyle">
											<input id="inputMemId" type="text" placeholder="이메일 아이디">
											<button type="button" class="inputBtn btnDel">
												<span class="blind">삭제</span>
											</button>
										</div>
										<div class="errorMessage">
											<div class="message"></div>
											<!-- 이메일 아이디를 입력해주세요 -->
											<!-- 잘못된 이메일 형식입니다. -->
											<!-- 입력하신 아이디를 찾을 수 없어요. 다시 한번 확인해 주세요. -->
										</div>
										<div class="activeButton">
											<!-- <button type="button" onclick="javascript:confirmId();">이메일 아이디 확인</button> -->
											<button type="button" onclick="location.href='${ctp}/search/matchPassword'">이메일 아이디 확인</button>
											<%-- <button type="submit">이메일 아이디 확인</button> --%>
										</div>
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