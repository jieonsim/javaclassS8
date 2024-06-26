<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/include/layout/header.css">
<header class="common_header">
	<div class="header_util bg-light py-2">
		<div class="container d-flex justify-content-between">
			<div class="header_util_left pt-2">
				<a class="header_title_link" href="${ctp}/">티켓어쩌구</a>
			</div>
			<div class="header_util_right">
				<ul class="nav">
					<li class="nav-item">
						<a href="#" id="loginBtn" class="nav-link text-dark">로그인</a>
					</li>
					<li class="nav-item">
						<a href="${ctp}/my/memberInfo/info" id="loggedIn" class="nav-link text-dark">zieonsim@gmail.com</a>
					</li>
					<li class="nav-item">
						<a href="#" id="reserve" class="nav-link text-dark">예매확인/취소</a>
					</li>
					<li class="nav-item">
						<a href="#" id="joinBtn" class="nav-link text-dark">회원가입</a>
					</li>
					<li class="nav-item">
						<a href="${ctp}/help/main" class="nav-link text-dark">고객센터</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link text-dark">어드민</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%-- <div class="header_inner container d-flex align-items-center pt-3">
		<h1 class="header_title mr-4">
			<a class="header_title_link" href="${ctp}/">티켓어쩌구</a>
		</h1>
		<nav class="header_nav">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link h4 text-dark" href="/">공연/전시</a>
				</li>
				<li class="nav-item">
					<a class="nav-link h4 text-dark" href="/sports">스포츠</a>
				</li>
				<li class="nav-item">
					<a class="nav-link h4 text-dark" href="#">여행</a>
				</li>
			</ul>
		</nav>
		<div class="header_banner ml-auto">
			<img src="${ctp}/images/balls.jpg" alt="헤더 광고 배너" class="img-fluid" style="width: 200px;">
		</div>
	</div>
	<hr> --%>
	<div class="header_gnb py-3">
		<div class="container d-flex align-items-center">
			<nav class="header_gnb_area">
				<ul class="nav">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/">홈</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/baseball">야구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/football">축구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/handball/off-season">핸드볼</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/basketball">농구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/volleyball">배구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/ice_hockey/off-season">아이스하키</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/etc/off-season">기타</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/esports/main">e스포츠</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/event/main">이벤트</a>
					</li>
				</ul>
			</nav>
			<div class="header_search ml-auto">
				<div class="search-wrapper input-group">
					<input type="search" class="form-control" placeholder="검색어를 입력해 주세요">
					<div class="input-group-append">
						<button class="btn" type="button">
							<i class="ph ph-magnifying-glass"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>