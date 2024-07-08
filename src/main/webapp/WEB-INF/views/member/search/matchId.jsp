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
					<form name="matchIdForm" method="post">
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
												<a href="${ctp}/search/matchId">아이디 찾기</a>
											</div>
											<div class="tab">
												<a href="${ctp}/search/checkId">비밀번호 찾기</a>
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
															<input id="inputHpMemNm" type="text" class="searchInput" placeholder="이름">
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="inputStyle">
															<input id="inputHp" type="tel" class="searchInput" placeholder="휴대폰 번호 (- 없이 입력)">
															<button type="button" class="inputBtn btnDel">
																<span class="blind">삭제</span>
															</button>
														</div>
														<div class="hasButtonWrap numberSend" style="display: none;">
															<div class="inputStyle">
																<input id="inputHpCertNo" type="text" class="certNoInput" maxlength="10" placeholder="인증번호 6자리">
																<button type="button" class="inputBtn btnDel">
																	<span class="blind">삭제</span>
																</button>
																<div class="count"></div>
															</div>
															<div class="buttonStyle">
																<button type="button" onclick="javascript:getCertCheckNo('hp'); return false;">다시 받기</button>
															</div>
														</div>
														<div class="errorMessage">
															<div class="message" style="display: none;"></div>
															<!-- 이름을 입력해주세요. -->
															<!-- 잘못된 휴대폰 형식입니다. (-없이 입력) -->
															<!-- 입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요. -->
														</div>
														<div class="confirmWrap">
															<div class="activeButton">
																<button type="button" class="certBtn" onclick="location.href='${ctp}/search/showFoundId';">이메일 아이디 확인</button>
																<%-- <button type="submit" class="certBtn">이메일 아이디 확인하기</button> --%>
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
</body>
</html>