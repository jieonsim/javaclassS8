<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기-티켓챔프</title>
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
					<form name="matchEmailForm" method="post" id="matchEmailForm">
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
											<div class="tab current">
												<a href="${ctp}/search/matchEmail">아이디 찾기</a>
											</div>
											<div class="tab">
												<a href="${ctp}/search/matchPassword">비밀번호 찾기</a>
											</div>
										</div>
									</div>
									<div class="searchContentsWrapper">
										<div class="searchContents current">
											<div class="titleWrap">
												<span class="titleText">휴대폰 번호로 찾기</span>
											</div>
											<div class="contentsWrap">
												<div class="inner">
													<p class="message">
														입력하신 이름과 휴대폰 번호가 회원 정보와<br>일치할 경우 이메일 아이디 일부를 알려드려요.
													</p>
													<div class="inputForm">
														<div class="inputStyle">
															<input id="inputName" type="text" name="name" class="searchInput" placeholder="이름" autofocus>
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="inputStyle">
															<input id="inputPhone" type="text" name="phone" class="searchInput" placeholder="휴대폰 번호 (- 없이 입력)">
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="errorMessage">
															<div class="message" style="display: none;"></div>
														</div>
														<div class="confirmWrap">
															<div class="activeButton">
																<button type="submit" class="certBtn">이메일 아이디 확인</button>
															</div>
														</div>
													</div>
												</div>
											</div>
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
	<script src="${ctp}/js/member/search/matchEmail.js"></script>
</body>
</html>