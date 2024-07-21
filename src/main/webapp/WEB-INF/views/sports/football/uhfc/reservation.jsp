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
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/football/common/sports_cont_top.jsp" />
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/football/common/cont_left.jsp" />
					<div class="cont_right">
						<div class='rightcont_inner'>
							<jsp:include page="/WEB-INF/views/sports/football/common/team_top_area.jsp" />
							<jsp:include page="/WEB-INF/views/sports/football/common/team_notice.jsp" />
							<jsp:include page="/WEB-INF/views/sports/football/common/team_tab.jsp">
								<jsp:param value="reservation" name="activeTab" />
							</jsp:include>
							<div class="tab_content" data-team="${currentTeam}">
								<!-- tab 클릭 시 schedule, seat, price, info 내용이 이 곳에 로드 -->
							</div>
							<div id="reservationContent">
								<div id="scheduleListDiv" class="reserve_lst_bx">
									<ul>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.10</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_3">(수)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/Property1=KIA.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>KIA</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">
												<a href="javascript:;" class="btn btn_reserve"> 예매하기 </a>

											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.11</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_4">(목)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/Property1=KIA.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>KIA</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">
												<a href="javascript:;" class="btn btn_reserve"> 예매하기 </a>

											</div>
										</li>
										<li class="today_frame">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.16</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_2">(화)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">
												<a href="javascript:;" class="btn btn_reserve"> 예매하기 </a>

											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.17</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_3">(수)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.10 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.18</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_4">(목)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.11 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.19</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_5">(금)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/doosan.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>두산</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.12 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.20</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_6">(토)</div>
													<div class="time">
														<span class="time_num">18:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/doosan.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>두산</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.13 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.21</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_7">(일)</div>
													<div class="time">
														<span class="time_num">17:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/doosan.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>두산</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.14 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.26</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_5">(금)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=Hanwha.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>한화</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.19 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.27</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_6">(토)</div>
													<div class="time">
														<span class="time_num">18:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=Hanwha.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>한화</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.20 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.28</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_7">(일)</div>
													<div class="time">
														<span class="time_num">17:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=Hanwha.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>한화</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.21 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.30</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_2">(화)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>삼성</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.23 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">07.31</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_3">(수)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>
													<div class="match_tit">
														<span>문화가있는날</span>
													</div>
													<div class="team_name">
														<span>LG</span>
														vs
														<span>삼성</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.24 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.01</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_4">(목)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>삼성</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>07.25 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.09</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_5">(금)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/ncdinos.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>NC</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.02 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.10</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_6">(토)</div>
													<div class="time">
														<span class="time_num">18:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/ncdinos.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>NC</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.03 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.11</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_7">(일)</div>
													<div class="time">
														<span class="time_num">17:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/ncdinos.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>NC</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.04 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.16</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_5">(금)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/Property1=KIA.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>KIA</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.09 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.17</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_6">(토)</div>
													<div class="time">
														<span class="time_num">18:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/Property1=KIA.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>KIA</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.10 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.18</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_7">(일)</div>
													<div class="time">
														<span class="time_num">17:00</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_6/Property1=KIA.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>KIA</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.11 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.20</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_2">(화)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.13 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.21</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_3">(수)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.14 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.22</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_4">(목)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>SSG</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.15 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.27</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_2">(화)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=KT.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>kt</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.20 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.28</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_3">(수)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=KT.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>
													<div class="match_tit">
														<span style="background: linear-gradient(rgba(255, 255, 255, 0) 60%, rgb(255, 244, 149) 40%, rgb(255, 244, 149) 100%);">문화가있는날</span>
													</div>
													<div class="team_name">
														<span>LG</span>
														vs
														<span>kt</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.21 11:00</span>
													오픈
												</a>
											</div>
										</li>
										<li class="">
											<span class="ico_todayopen">
												<span class="text">오늘오픈</span>
											</span>
											<div class="match_day">
												<div class="date">
													<span class="date_num">08.29</span>
												</div>
												<div class="day_time">
													<div class="day_lst day_4">(목)</div>
													<div class="time">
														<span class="time_num">18:30</span>
													</div>
												</div>
											</div>
											<div class="match_team_info">
												<div class="emblem_bx">
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="구단 엠블럼">
													</span>
													<span class="versus">VS</span>
													<span class="bx_img">
														<img src="http://image.toast.com/aaaaab/ticketlink/TKL_4/Property1=KT.png" alt="구단 엠블럼">
													</span>
												</div>

												<div class="match_info_bx">
													<div class="flag_area">
														<span class="flag flag_clean">클린예매</span>

													</div>

													<div class="team_name">
														<span>LG</span>
														vs
														<span>kt</span>
													</div>
													<div class="place">잠실야구장</div>
												</div>
											</div>
											<div class="match_btn">

												<a href="javascript:;" class="btn btn_reserve_scdl">
													판매예정
													<br>
													<span>08.22 11:00</span>
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