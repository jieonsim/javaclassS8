<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/baseball/common/sports_cont_top.jsp" />
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/baseball/common/cont_left.jsp" />
					<div class="cont_right">
						<div class="rightcont_inner">
							<div class="sch_date">
								<a href="#" class="prev" style="cursor: default;">이전달</a>
								<a href="#" class="next" style="cursor: default;">다음달</a>
								<span class="_monthText">${currentYearMonth}</span>
							</div>
							<div class="sch_tbl">
								<table>
									<caption>전체 일정</caption>
									<colgroup>
										<col style="width: 100px;">
										<col>
										<col style="width: 135px;">
										<col style="width: 120px;">
									</colgroup>
									<thead>
										<tr>
											<th>날짜</th>
											<th>
												경기
												<span>(홈 vs 어웨이)</span>
											</th>
											<th>장소</th>
											<th>예매</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${not hasGames}">
											<tbody>
												<td colspan="4">
													<div class="no_team">
														<img src="${ctp}/images/sports/common/nogame.jpg" alt="현재 진행중인 경기가 없습니다">
													</div>
												</td>
											</tbody>
										</c:when>
										<c:otherwise>
											<tbody data-has-games="${hasGames}">
												<c:set var="prevDate" value="" />
												<c:set var="gamesForDate" value="0" />
												<c:forEach var="game" items="${games}" varStatus="status">
													<c:if test="${game.gameDate ne prevDate}">
														<c:if test="${not status.first}">
															<c:set var="gamesForDate" value="0" />
														</c:if>
													</c:if>
													<tr class="${gamesForDate % 2 == 0 ? '' : 'even'}">
														<c:if test="${game.gameDate ne prevDate}">
															<td rowspan="${fn:length(games.stream().filter(g -> g.gameDate eq game.gameDate).toList())}" class="date">
																<em><fmt:parseDate value="${game.gameDate}" pattern="yyyy-MM-dd" var="parsedDate" /> <fmt:formatDate value="${parsedDate}" pattern="MM.dd" /></em> (
																<fmt:formatDate value="${parsedDate}" pattern="E" />
																)
															</td>
														</c:if>
														<td class="match">
															<span>${game.homeTeamName}</span>
															vs
															<span>${game.awayTeamName}</span>
														</td>
														<td>${game.venueName}</td>
														<td class="_game_list" gamedate="${game.gameDate}" gametime="${game.gameTime}" bookingopendaysbefore="${game.bookingOpenDaysBefore}" bookingopentime="${game.bookingOpenTime}" bookingcloseminutesafterstart="${game.bookingCloseMinutesAfterStart}">
															<a href="${ctp}/reserve/seat?gameId=${game.id}" class="btn btn_reserve">예매하기</a>
															<span class="_sale_time"></span>
														</td>
													</tr>
													<c:set var="prevDate" value="${game.gameDate}" />
													<c:set var="gamesForDate" value="${gamesForDate + 1}" />
												</c:forEach>
											</tbody>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/sports/common/schedule.js"></script>
</body>
</html>