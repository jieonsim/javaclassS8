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
					<form name="matchPasswordForm" id="matchPasswordForm">
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
									<div class="searchContentsWrapper">
										<div class="searchContents current">
											<div class="titleWrap">
												<span class="titleText">이메일로 찾기</span>
											</div>
											<div class="contentsWrap">
												<div class="inner">
													<p class="message">
														입력하신 이름과 이메일 아이디가 회원 정보와<br>일치할 경우 해당 메일로 인증번호가 발송돼요.
													</p>
													<div class="inputForm">
														<div class="inputStyle">
															<input id="inputName" type="text" name="name" class="searchInput" placeholder="이름" autofocus>
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="inputStyle">
															<input id="inputEmail" type="text" name="email" class="searchInput" placeholder="이메일 아이디">
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="hasButtonWrap numberSend" style="display: none;">
															<div class="inputStyle">
																<input id="inputEmailCertNo" type="text" class="certNoInput" maxlength="10" placeholder="인증번호 8자리" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
																<button type="button" class="inputBtn btnDel">
																	<span class="blind">삭제</span>
																</button>
																<div class="count">00:00</div>
															</div>
															<div class="buttonStyle">
																<button type="button">다시 받기</button>
															</div>
														</div>
														<div class="errorMessage">
															<div class="message"></div>
															<!-- 인증 번호 공백일 때 or 인증번호 시간 만료되었을 때 : 인증번호를 입력해 주세요. -->
															<!-- 인증번호 불일치 일 때 : 인증번호가 일치하지 않아요. 다시 확인해 주세요. -->
															<!-- 인증번호 입력시간 만료 후 기존에 발송된 인증번호로 입력하거나 만료 후 아무번호나 넣었을 때 : 인증번호 유효시간이 초과되었습니다.-->
														</div>
														<div class="confirmWrap">
															<div class="activeButton">
																<button type="button" class="certBtn" style="display: block;">인증번호 받기</button>
																<button type="button" class="confirmBtn" style="display: none;">확인</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="intToast" role="alert" aria-live="assertive" style="display: none;">인증번호를 보냈어요</div>
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
	<script src="${ctp}/js/member/search/matchPassword.js"></script>
</body>
</html>