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
<link rel="stylesheet" href="${ctp}/css/sports/layout.css">
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<!-- 데스크탑 -->
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<h2 class="blind">스포츠</h2>
				<!-- 1 depth -->
				<h3 class="blind">baseball</h3>
				<!-- 2 depth -->
				<div class="sports_cont_top">
					<p class="location_path">
						<a href="${ctp}/home">티켓챔프 홈</a>
						&gt;
						<a href="${ctp}/sports/baseball">야구</a>
					</p>
					<p class="current_time">
						<em></em>현재시간
						<span>14:02</span>
					</p>
				</div>
				<div class="sports_cont">
					<div class="cont_left">
						<p class="games_logo">
							<img src="${ctp}/images/sports/baseball/logo_baseball.gif" alt="logo_baseball">
						</p>
						<ul class="left_sportsmenu">
							<li class="_teamArea">
								<span class="sportsmenuTEAM">TEAM</span>
								<ul class="left_submenu">
									<li>
										<a href="/sports/baseball/lg">LG트윈스</a>
									</li>
									<li>
										<a href="/sports/baseball/kt">kt wiz</a>
									</li>
									<li>
										<a href="/sports/baseball/ssg">SSG 랜더스</a>
									</li>
									<li>
										<a href="/sports/baseball/kia">KIA 타이거즈</a>
									</li>
									<li>
										<a href="/sports/baseball/samsung">삼성 라이온즈</a>
									</li>
									<li>
										<a href="/sports/baseball/hanhwa">한화이글스</a>
									</li>
								</ul>
							</li>
							<!-- seasonoff -->
							<li class="_scheduleArea">
								<a href="/sports/baseball/schedule">
									<span class="sportsmenu1">전체일정</span>
								</a>
							</li>
							<li class="_guideArea">
								<a href="/help/guide/reservation/baseball">
									<span class="sportsmenu2">예매가이드</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="cont_right">
						<div class="rightcont_inner ">
							<div class="tab_content">
								<div class="no_team">
									<img src="${ctp}/images/sports/baseball/baseball.jpg" alt="baseball">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<button type="button" id="back_to_top" class="btn_move_top is-active is-stuck" onclick="window.scrollTo(0,0);">
			<span class="blind">맨 위로 이동하기</span>
		</button>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>