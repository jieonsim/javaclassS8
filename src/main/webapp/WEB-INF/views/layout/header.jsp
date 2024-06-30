<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/layout/header.css">
<div class="m_header">
	<div class="container">
		<div class="headerInner my-2">
			<a class="header_title_link" href="${ctp}/">
				<i class="ph ph-person-simple-throw" id="header_title_logo"></i>
				<span class="logo-text">ticket</span>
				<span class="logo-text champ">champ</span>
			</a>
		</div>
	</div>
</div>

<header class="common_header">
	<div class="header_util bg-light py-2">
		<div class="container d-flex justify-content-between">
			<div class="header_util_left"></div>
			<div class="header_util_right">
				<ul class="nav">
					<li class="nav-item">
						<a href="${ctp}/login" id="loginBtn" class="nav-link text-dark">로그인</a>
					</li>
					<li class="nav-item">
						<a href="${ctp}/my/memberInfo/info" id="loggedIn"
							class="nav-link text-dark">zieonsim@gmail.com</a>
					</li>
					<li class="nav-item">
						<a href="#" id="reserve" class="nav-link text-dark">예매확인/취소</a>
					</li>
					<li class="nav-item">
						<a href="${ctp}/signup" id="joinBtn" class="nav-link text-dark">회원가입</a>
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
	<div class="header_inner container d-flex align-items-center py-3">
		<h1 class="header_title mb-0">
			<a class="header_title_link" href="${ctp}/">
				<i class="ph ph-person-simple-throw" id="header_title_logo"></i>
				<span class="logo-text">ticket</span>
				<span class="logo-text champ">champ</span>
			</a>
		</h1>
		<div class="header_banner ml-auto d-flex align-items-center">
			<img src="${ctp}/images/layout/header/banner.jpg" alt="헤더 광고 배너"
				class="img-fluid mr-3" style="width: 200px;">
			<div class="banner-text">
				<p class="mb-1">
					<strong>모든 스포츠, 하나의 플랫폼</strong>
				</p>
				<p class="mb-0">티켓챔프에서 열정을 예매하세요!</p>
			</div>
		</div>
	</div>
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
						<a class="nav-link" href="/sports/basketball/off-season">농구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/sports/volleyball/off-season">배구</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/event/main">이벤트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/community/main">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/community/main">굿즈샵</a>
					</li>
				</ul>
			</nav>
			<div class="header_search ml-auto">
				<div class="search-wrapper input-group">
					<input type="search" class="form-control"
						placeholder="검색어를 입력해 주세요">
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

<nav class="m_toolbar">
	<ul class="toolbar_menu">
		<li class="toolbar_item">
			<a class="toolbar_link " href="#">
				<span class="icon_toolbar toolbar_category">
					<svg class="category"></svg>
				</span>
				<span class="toolbar_text">카테고리</span>
			</a>
		</li>
		<li class="toolbar_item">
			<a class="toolbar_link " href="#">
				<span class="icon_toolbar toolbar_search">
					<svg class="search"></svg>
				</span>
				<span class="toolbar_text">검색</span>
			</a>
		</li>
		<li class="toolbar_item">
			<a href="${ctp}/" class="toolbar_link is-active">
				<span class="icon_toolbar toolbar_home">
					<svg class="home"></svg>
				</span>
				<span class="toolbar_text">홈</span>
			</a>
		</li>
		<li class="toolbar_item">
			<a class="toolbar_link " href="#">
				<span class="icon_toolbar toolbar_ticket">
					<svg class="ticket"></svg>
				</span>
				<span class="toolbar_text">티켓</span>
			</a>
		</li>
		<li class="toolbar_item">
			<a class="toolbar_link " href="${ctp}/login">
				<span class="icon_toolbar toolbar_my">
					<svg class="my"></svg>
				</span>
				<span class="toolbar_text">마이</span>
			</a>
		</li>
	</ul>
	<div class="toolbar_util">
		<button type="button" class="toolbar_top">
			<span class="blind">맨 위로 이동하기</span>
		</button>
	</div>
</nav>