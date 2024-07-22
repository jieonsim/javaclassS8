<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
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
						<div class='rightcont_inner'>
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_top_area.jsp" />
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_notice.jsp" />
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_tab.jsp">
								<jsp:param value="reservation" name="activeTab" />
							</jsp:include>
							<div class="tab_content" data-team="${currentTeam}">
								<!-- tab 클릭 시 schedule, seat, price, info 내용이 이 곳에 로드 -->
							</div>
							<div id="reservationContent">
								<div id="scheduleListDiv" class="reserve_lst_bx">
									<ul>
										<c:forEach var="game" items="${games}">
											<li class="_game_list" gamedate="${game.gameDate}" gametime="${game.gameTime}" bookingopendaysbefore="${game.bookingOpenDaysBefore}" bookingopentime="${game.bookingOpenTime}" bookingcloseminutesafterstart="${game.bookingCloseMinutesAfterStart}">
												<span class="ico_todayopen">
													<span class="text">오늘오픈</span>
												</span>
												<div class="match_day">
													<div class="date">
														<span class="date_num">
															<fmt:parseDate value="${game.gameDate}" pattern="yyyy-MM-dd" var="parsedDate" />
															<fmt:formatDate value="${parsedDate}" pattern="MM.dd" />
														</span>
													</div>
													<div class="day_time">
														<div class="day_lst day_${(parsedDate.day == 0) ? 7 : parsedDate.day}">
															(
															<fmt:formatDate value="${parsedDate}" pattern="E" />
															)
														</div>
														<div class="time">
															<span class="time_num">${fn:substring(game.gameTime, 0, 5)}</span>
														</div>
													</div>
												</div>

												<c:set var="emblemMap" value="${{
                                                    'LG': 'lg',
                                                    'kt': 'kt',
                                                    'SSG': 'ssg',
                                                    'KIA': 'kia',
                                                    '삼성': 'samsung',
                                                    '한화': 'hanhwa',
                                                    '두산': 'doosan',
                                                    'NC': 'nc',
                                                    '키움': 'kiwoom',
                                                    '롯데': 'lotte'
                                                }}" />
												<div class="match_team_info">
													<div class="emblem_bx">
														<span class="bx_img">
															<img src="${ctp}/images/sports/baseball/emblem/${emblemMap[game.homeTeamShortName]}.png" alt="홈팀 엠블럼">
														</span>
														<span class="versus">VS</span>
														<span class="bx_img">
															<img src="${ctp}/images/sports/baseball/emblem/${emblemMap[game.awayTeamShortName]}.png" alt="원정팀 엠블럼">
														</span>
													</div>

													<div class="match_info_bx">
														<div class="team_name">
															<span>${game.homeTeamShortName}</span>
															vs
															<span>${game.awayTeamShortName}</span>
														</div>
														<div class="place">${game.venueName}</div>
													</div>
												</div>
												<div class="match_btn">
													<!-- 버튼 내용은 JavaScript에서 동적으로 생성 -->
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/sports/common/reservation.js"></script>
</body>
</html>