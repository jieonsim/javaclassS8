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
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/sports/common.css">
<link rel="stylesheet" href="${ctp}/css/sports/layout.css">
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
								<div id="scheduleListDiv" class="reserve_lst_bx" v-cloak>
									<ul>
										<!-- [D] 오늘오픈 : li에 class .today_frame 추가 -->
										<li v-for="(schedule, index) in schedules" :class="getTodayClass(schedule.timeOnSale)">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">{{ schedule.onDate | date }}</span>
												</div>
												<div class="day_time">
													<div class="day_lst" :class="getDayNameClass(schedule.onDate)">{{ schedule.onDate | day }}</div>
													<div class="time">
														<span class="time_num">{{ schedule.onDate | time }}</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx" v-if="schedule.teamMatchUse">
													<span class="bx_img">
														<img v-bind:src="schedule.homeLogoImgPath" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img v-bind:src="schedule.awayLogoImgPath" alt="구단 엠블럼">
													</span>
												</div>
												<div class="emblem_bx" v-if="!schedule.teamMatchUse">
													<span class="bx_img_v2">
														<img v-bind:src="schedule.productImageUrl" alt="임시">
													</span>
												</div>
												<div class="match_info_bx">
													<div class="flag_area">
														<span v-if="schedule.captchaUseYn === 'Y'" class="flag flag_clean">클린예매</span>
														<span v-if="schedule.waitingReservationUse" class="flag flag_waiting">취소표대기</span>
													</div>
													<div class="match_tit" v-if="schedule.subTitle1">
														<span :style="{
                                                    ...(schedule.gameTitleEmphasisUse && {background: 'linear-gradient(#FFFFFF00 60%, ' +schedule.gameTitleEmphasisColorCode + ' 40%,' +
                                                    schedule.gameTitleEmphasisColorCode + ' 100%)'})
                                                }">{{ schedule.subTitle1 }}</span>
													</div>
													<div class="team_name" v-if="schedule.teamMatchUse">
														<span>{{ schedule.homeTeamShortName }}</span>
														vs
														<span>{{ schedule.awayTeamShortName }}</span>
													</div>
													<div class="place">{{ schedule.venueName }}</div>
												</div>
											</div>

											<div class="match_btn">
												<a href="javascript:;" class="btn btn_reserve" v-if="schedule.reserveStateCode === 'ON_SALE'" @click="next(schedule)"> 예매하기 </a>
												<a href="javascript:;" class="btn btn_reserve_scdl" v-if="schedule.reserveStateCode === 'BEFORE'">
													판매예정
													<br>
													<span>{{ setDateFormat(schedule.timeOnSale) }}</span>
													오픈
												</a>
											</div>
										</li>
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
</body>
</html>