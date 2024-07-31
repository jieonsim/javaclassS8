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
<link rel="stylesheet" href="${ctp}/css/home/home.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico" type="image/x-icon">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<div class="gameSchedule">
			<section class="common_section section_sport_open">
				<div class="section_heading">
				<h4 class="section_title">예매오픈</h4>
			</div>
				<div class="sport_open_filter">
					<div class="common_tab type_capsule">
						<div class="common_tab_area">
							<ul class="common_tab_list" role="tablist">
								<li class="common_tab_item" role="none">
									<button type="button" class="common_tab_btn" role="tab" aria-selected="true" data-sport="야구">야구</button>
								</li>
								<li class="common_tab_item" role="none">
									<button type="button" class="common_tab_btn" role="tab" aria-selected="false" data-sport="축구">축구</button>
								</li>
							</ul>
						</div>
					</div>
					<div class="common_nav_box">
						<button type="button" class="common_nav_btn swiper-button-prev">
							<span class="common_icon icon_arrow_left ty_xs"></span>
							<span class="blind">이전 경기 보기</span>
						</button>
						<button type="button" class="common_nav_btn swiper-button-next">
							<span class="common_icon icon_arrow_right ty_xs"></span>
							<span class="blind">다음 경기 보기</span>
						</button>
					</div>
				</div>
				<div class="sport_match_schedule">
					<div class="swiper swiper-container">
						<ul class="swiper-wrapper" id="gameList">
							<c:forEach var="game" items="${baseballGames}">
								<li class="swiper-slide" style="width: 354px; margin-right: 29px;">
									<div class="match_card">
										<div class="match_card_visual">
											<div class="match_team_group">
												<div class="match_team_imgbox">
													<img src="${ctp}/images/sports/emblem/${game.homeTeamShortName}.png" alt="${game.homeTeamShortName}" class="match_team_img">
												</div>
												<span class="common_icon icon_versus">
													<span class="blind">vs</span>
												</span>
												<div class="match_team_imgbox">
													<img src="${ctp}/images/sports/emblem/${game.awayTeamShortName}.png" alt="${game.awayTeamShortName}" class="match_team_img">
												</div>
											</div>
										</div>
										<div class="match_card_info">
											<span class="match_card_date">${game.formattedGameDate} ${game.formattedGameTime}</span>
											<span class="match_card_place">${game.venueName}</span>
										</div>
										<div class="match_card_btnarea">
											<div class="common_btn_box">
												<c:choose>
													<c:when test="${game.openForBooking}">
														<a href="${ctp}/reserve/seat?gameId=${game.id}" class="common_btn btn_primary btn_large btn_reserve">예매하기</a>
													</c:when>
													<c:otherwise>
														<a class="common_btn btn_primary btn_large plan_sale" aria-disabled="true" tabindex="-1">${game.openDate} ${game.openTime} 오픈예정</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>
		</div>
		<div class="banner-container">
			<div class="banner">
				<a href="${ctp}/event/main">
					<div class="banner-content">
						<div class="banner-left">
							<img src="${ctp}/images/icon/fireworks.png" alt="이벤트 아이콘" class="banner-icon">
							<div class="banner-info">
								<h2 class="banner-title">티켓팡! 댓글 한 번에 무료 관람의 기회가!</h2>
								<p class="banner-description">댓글 작성하고 추첨받아 스포츠 경기를 무료로 즐기세요.</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="banner">
				<a href="${ctp}/hotIssue">
					<div class="banner-content">
						<div class="banner-left">
							<img src="${ctp}/images/icon/zip.png" alt="핫이슈 아이콘" class="banner-icon">
							<div class="banner-info">
								<h2 class="banner-title">스포츠 열기를 한눈에! 핫이슈 모음.zip</h2>
								<p class="banner-description">실시간 속보부터 팀 순위까지, 놓치면 후회할 소식들</p>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%-- <div class="container-fluid d-flex justify-content-between" style="background: #f3f4f8; padding: 30px;">
		<section id="partners" class="container">
			<div class="wrapping">
				<div class="kbo-club">
					<div class="row club-list">
						<div class="col">
							<a href="http://www.lgtwins.com/" target="_blank">
								<img src="${ctp}/images/sports/KBO/LG.png" alt="LG 트윈스">
							</a>
						</div>
						<div class="col">
							<a href="http://www.ktwiz.co.kr/sports/site/baseball/main.do" target="_blank">
								<img src="${ctp}/images/sports/KBO/KT.png" alt="kt wiz">
							</a>
						</div>
						<div class="col">
							<a href="http://www.ssglanders.com" target="_blank">
								<img src="${ctp}/images/sports/KBO/SSG.png" alt="SSG 랜더스">
							</a>
						</div>
						<div class="col">
							<a href="https://www.ncdinos.com/" target="_blank">
								<img src="${ctp}/images/sports/KBO/NC.png" alt="NC 다이노스">
							</a>
						</div>
						<div class="col">
							<a href="http://www.doosanbears.com/" target="_blank">
								<img src="${ctp}/images/sports/KBO/DS.png" alt="두산 베어스">
							</a>
						</div>
						<div class="col">
							<a href="http://www.tigers.co.kr" target="_blank">
								<img src="${ctp}/images/sports/KBO/KIA.png" alt="KIA 타이거즈">
							</a>
						</div>
						<div class="col">
							<a href="http://www.giantsclub.com/html/" target="_blank">
								<img src="${ctp}/images/sports/KBO/LT.png" alt="롯데 자이언츠">
							</a>
						</div>
						<div class="col">
							<a href="http://www.samsunglions.com/" target="_blank">
								<img src="${ctp}/images/sports/KBO/SS.png" alt="삼성 라이온즈">
							</a>
						</div>
						<div class="col">
							<a href="http://www.hanwhaeagles.co.kr/" target="_blank">
								<img src="${ctp}/images/sports/KBO/HH.png" alt="한화 이글스">
							</a>
						</div>
						<div class="col">
							<a href="http://www.heroesbaseball.co.kr/index.do" target="_blank">
								<img src="${ctp}/images/sports/KBO/KW.png" alt="키움 히어로즈">
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div> --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/home/home.js"></script>
</body>
</html>