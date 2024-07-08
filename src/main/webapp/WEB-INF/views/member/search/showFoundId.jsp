<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 확인-티켓챔프</title>
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
									<h3>
										고객님의<br>이메일 아이디를 찾았어요
									</h3>
									<!-- 이름 + 휴대폰 번호로 가입된 여러개의 아이디가 있을 경우 모두 보여주기, 그 중 하나 선택하여 로그인 시도 가능 -->
									<!-- 로그인으로 이동할 때 radio로 선택된 이메일 아이디를 로그인 폼 아이디 인풋에 value로 넣어주기 -->
									<div class="resultListWrap">
										<ul>
											<li class="items">
												<input type="radio" name="idlist" id="id_1" value="wldjs0***@naver.com" checked>
												<label for="id_1">
													<div class="id">wldjs0***@naver.com</div>
													<div class="date">2018.06.09 가입</div>
												</label>
											</li>
											<li class="items">
												<input type="radio" name="idlist" id="id_2" value="wldjs5***@gmail.com">
												<label for="id_2">
													<div class="id">wldjs5***@gmail.com</div>
													<div class="date">2024.07.03 가입</div>
												</label>
											</li>
										</ul>
									</div>
								</div>
								<div class="bottomBtnWrap">
									<div class="textBubble" style="display: none;">
										<span>아이디를 선택해주세요</span>
									</div>
									<button type="button" class="basicBtn" onclick="location.href='${ctp}/search/matchPassword'">비밀번호 찾기</button>
									<button type="button" class="redBtn" onclick="location.href='${ctp}/login'">로그인</button>
								</div>
							</div>
						</div>
					</div>
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