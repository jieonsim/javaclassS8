<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/hotIssue/main.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="loading-container" id="loding_container">
		<p class="loading-text">최신 스포츠 핫이슈를 실시간으로 불러오고 있어요!</p>
		<img src="${ctp}/images/icon/news.png" alt="스포츠 뉴스" class="loading-image">
		<div class="progress-bar">
			<div class="progress" id="progressBar"></div>
		</div>
		<p class="loading-text2">스포츠 트렌드 분석 중...</p>
		<p class="fun-fact" id="funFact"></p>
	</div>
	<div class="container" id="content_container">
		<div class="sportsRankingNews mt-5">
			<span class="hotIssue-title">스포츠 랭킹 뉴스</span>
			<table class="table news-table">
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="row my-5">
			<div class="col majorGameSchedule">
				<span class="hotIssue-title">주요 경기 일정</span>
				<table class="table">
					<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="promotion">
					<a href="${ctp}/event/main">
						<div class="card bg-light text-dark">
							<div class="card-body d-flex justify-content-start">
								<img src="${ctp}/images/icon/tickets.png">
								<div class="card-text m-3 p-3">
									<p class="m-0">경기장의 열기를 직접 느끼고 싶다면?</p>
									<p class="ml-0 mr-0 mt-0 mb-2">지금 댓글 남기고 무료 예매권의 주인공이 되세요!</p>
									<p class="m-0">
										<strong>티켓챔프 이벤트 참여하러 가기 &gt;&gt;</strong>
									</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="col kboTeamRanking">
				<div class="text-right">
					<small class="hotIssue-title"></small>
				</div>
				<table class="table team-ranking">
					<thead>
						<tr>
							<th colspan="10" class="text-center">KBO TEAM RANKING</th>
						</tr>
						<tr class="table-secondary">
							<th>순위</th>
							<th>팀명</th>
							<th>경기</th>
							<th>승</th>
							<th>패</th>
							<th>무</th>
							<th>승률</th>
							<th>게임차</th>
							<th>연속</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/hotIssue/main.js"></script>
</body>
</html>