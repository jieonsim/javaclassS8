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
<link rel="stylesheet" href="${ctp}/css/sports/common.css">
<link rel="stylesheet" href="${ctp}/css/sports/layout.css">
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/baseball/topContent.jsp" />
				<%-- <h2 class="blind">스포츠</h2>
				<!-- 1 depth -->
				<h3 class="blind">baseball</h3>
				<!-- 2 depth -->
				<div class="sports_cont_top">
					<p class="location_path">
						<a href="${ctp}/">티켓챔프 홈</a>
						&gt;
						<a href="${ctp}/sports/baseball">야구</a>
						&gt;
						<b>LG트윈스</b>
					</p>
					<p class="current_time">
						<em></em>현재시간
						<span>14:02</span>
					</p>
				</div> --%>
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/baseball/leftContent.jsp" />
					<div class="cont_right">
						<div class='rightcont_inner'>
							<div class="team_top_area">
								<div class="img_area">
									<span class="blind">구단로고</span>
									<img src="http://image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" width="101" height="101" alt="LG트윈스">
								</div>
								<div class="team_info_area">
									<h5 class="team_name">
										<span class="blind">구단명</span>
										LG트윈스
									</h5>
									<div class="product_detail_option">
										<!-- [D] 할인쿠폰 클릭 시 쿠폰 다운로드 팝업 노출 -->
										<!-- [D] 클린예매 -->
										<div class="popup_btn_wrap">
											<
											<!-- button type="button" class="product_option_btn type_clean">클린예매</button> -->

											<div id="cleanReserveInfo" class="common_popup_wrap" style="display: none;">
												<div class="common_popup" role="dialog">
													<div class="common_popup_header">
														<h3 class="common_popup_title">클린예매 서비스안내</h3>
														<button type="button" id="cleanReserveClose" class="common_popup_close">
															<span class="common_icon icon_close ty_sm"></span>
															<span class="blind">닫기</span>
														</button>
													</div>
													<div class="common_popup_content">
														<div class="popup_section popup_clean_guide">
															<p class="popup_desc">
																<span class="text_medium">이 상품은 보안문자 입력 후 좌석 선택이 가능합니다.</span>
															</p>
															<div class="popup_imgbox">
																<img src="//tketlink.dn.toastoven.net/markup_resources/2024061901_M/renewal/pcweb/img/clean_reserve_info@2x.jpg" alt="클린예매 서비스안내" class="popup_img">
																<ol class="blind">
																	<li>보안문자 확인</li>
																	<li>위 이미지의 문자 입력</li>
																	<li>입력완료 후 예매할 좌석 선택</li>
																</ol>
															</div>
															<p class="popup_desc">
																<span class="text_gray">
																	-대/소문자 구분없음
																	<br>
																	-혼동하기 쉬운 문자 없음(I,L,O,Q 등)
																</span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- [D] 홈팀으로 설정하면 on 클래스 추가 + '홈팀'으로 텍스트 변경 -->
								<a href="#" class="my_team">
									<!-- <span class="blind">홈팀설정</span> -->
									<span>홈팀설정</span>
								</a>
								<div class="team_notice">
									<div class="dummy_td">
										<h4 class="title">구단 공지</h4>
									</div>
									<div class="bx_notice">
										<div class="clean_reserve">
											<p class="txt_info">보안문자 입력 후 예매가 가능한 클린예매 상품입니다.</p>
										</div>

										<p class="txt_info">
											* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
											<br>
											(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
											<br>
											* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
											<br>
											* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
											<br>
											* 권종선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.
											<br>
											(현장에서 재구매 해야합니다.)
										</p>

									</div>
								</div>
							</div>
							<!-- [D] 가이드 버튼 클릭 시 가이드 팝업 노출 -->
							<div class="bx_guide" id="globalGuideLayer">
								<!-- <button class="btn_guide" id="globalGuide" data-team_id="59" data-sport_id="baseball">
									Purchase
									<br>
									Guide
								</button> -->
								<!-- <button class="btn_close" id="globalGuideClose">
									<span class="blind">닫기</span>
								</button> -->
							</div>
							<ul class="team_tab">
								<li tabname="reservation" class="on">
									<a href="#">
										<span class="team_tab1">예매하기</span>
									</a>
								</li>
								<li tabname="schedule">
									<a href="#">
										<span class="team_tab2">경기일정</span>
									</a>
								</li>
								<li tabname="price">
									<a href="#">
										<span class="team_tab3">요금/할인카드</span>
									</a>
								</li>
								<li tabname="seat">
									<a href="#">
										<span class="team_tab4">좌석도</span>
									</a>
								</li>
								<!-- [D] 시즌권 비활성일때 off 클래스 추가 -->
								<!-- [D] 어드민 입력된 탭메뉴 일때 system 클래스 추가, 어드민에서 입력된 탭메뉴명은 em 영역으로 호출 -->
								<li class="system" tabname="info">
									<a href="#">
										<em>구단안내</em>
									</a>
								</li>
							</ul>
							<!-- <ul class="team_tab">
								<li tabname="reservation">
									<a href="#">
										<span class="team_tab1">예매하기</span>
									</a>
								</li>
								<li tabname="schedule">
									<a href="#">
										<span class="team_tab2">경기일정</span>
									</a>
								</li>
								<li tabname="price">
									<a href="#">
										<span class="team_tab3">요금/할인카드</span>
									</a>
								</li>
								<li tabname="seat">
									<a href="#">
										<span class="team_tab4">좌석도</span>
									</a>
								</li>
								[D] 시즌권 비활성일때 off 클래스 추가
								[D] 어드민 입력된 탭메뉴 일때 system 클래스 추가, 어드민에서 입력된 탭메뉴명은 em 영역으로 호출
								<li class="system" tabname="info">
									<a href="#">
										<em>구단안내</em>
									</a>
								</li>
							</ul> -->
							<div class="tab_content"></div>
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
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
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
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
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
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
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>SSG</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>SSG</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>두산</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>두산</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>두산</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>한화</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>한화</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>한화</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>삼성</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
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
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>삼성</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>NC</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>NC</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>NC</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>KIA</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>KIA</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>KIA</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>SSG</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>SSG</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>SSG</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>kt</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
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
											<!---->
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
											<!---->
											<div class="match_info_bx">
												<div class="flag_area">
													<span class="flag flag_clean">클린예매</span>
													<!---->
												</div>
												<!---->
												<div class="team_name">
													<span>LG</span>
													vs
													<span>kt</span>
												</div>
												<div class="place">잠실야구장</div>
											</div>
										</div>
										<div class="match_btn">
											<!---->
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
		</main>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>