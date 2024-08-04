<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" href="${ctp}/admin/dashboard">
				<i class="mdi mdi-grid-large menu-icon"></i>
				<span class="menu-title">Dashboard</span>
			</a>
		</li>
		<li class="nav-item nav-category">USER</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#user" aria-expanded="false" aria-controls="user">
				<i class="menu-icon mdi mdi-account-circle-outline"></i>
				<span class="menu-title">회원</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="user">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/member/memberList">회원리스트</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">SPORTS</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#sports" aria-expanded="false" aria-controls="sports">
				<i class="menu-icon mdi mdi-bike"></i>
				<span class="menu-title">스포츠</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/sportRegister">종목 | 구단 | 경기장 등록</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/sportList">종목 | 구단 | 경기장 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/game/gameRegister">경기 등록</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/game/gameList">경기 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/seat/seatRegister">좌석 등급 등록</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="sports">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/sports/price/priceRegister">요금 등록</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">RESERVATION</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#reservation" aria-expanded="false" aria-controls="reservation">
				<i class="menu-icon mdi mdi-playlist-plus"></i>
				<span class="menu-title">예매</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="reservation">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/reservation/reservationList">예매리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="reservation">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">예매조회</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#advanceTicket" aria-expanded="false" aria-controls="advanceTicket">
				<i class="menu-icon mdi mdi-panorama-horizontal"></i>
				<span class="menu-title">예매권</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="advanceTicket">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/reservation/advanceTicket/advanceTicketList">예매권 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="advanceTicket">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/reservation/advanceTicket/issuing">예매권 발행하기</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">EVENT</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#event" aria-expanded="false" aria-controls="event">
				<i class="menu-icon mdi mdi-cube-outline"></i>
				<span class="menu-title">이벤트</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/event/upload">이벤트 등록</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/event/eventList">이벤트 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/event/drawList">이벤트 추첨 리스트</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">USER HOME</li>
		<li class="nav-item">
			<a class="nav-link" href="${ctp}/">
				<i class="menu-icon mdi mdi-home"></i>
				<span class="menu-title">유저 홈으로 이동</span>
			</a>
		</li>
		<c:if test="${not empty sessionScope.loginMember}">
			<li class="nav-item nav-category">현재 로그인한 관리자 아이디</li>
			<li class="nav-item">
				<span class="nav-link">
					<i class="menu-icon mdi mdi-account-card-details"></i>
					<span class="menu-title">${loginMember.email}</span>
				</span>
			</li>
		</c:if>
	</ul>
</nav>