<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" href="${ctp}/admin/main">
				<i class="mdi mdi-grid-large menu-icon"></i>
				<span class="menu-title">Dashboard</span>
			</a>
		</li>
		<li class="nav-item nav-category">USER</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon mdi mdi-floor-plan"></i>
				<span class="menu-title">회원</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">회원리스트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Dropdowns</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Typography</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">RESERVATION</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
				<i class="menu-icon mdi mdi-card-text-outline"></i>
				<span class="menu-title">예매조회</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">전체 예매내역</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">조건별 예매내역 검색</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
				<i class="menu-icon mdi mdi-chart-line"></i>
				<span class="menu-title">예매권</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">예매권 발행 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/reservation/advanceTicket/issuing">예매권 발행하기</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
				<i class="menu-icon mdi mdi-table"></i>
				<span class="menu-title">Tables</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">Basic table</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
				<i class="menu-icon mdi mdi-layers-outline"></i>
				<span class="menu-title">Icons</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="icons">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">Mdi icons</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">EVENT</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#event" aria-expanded="false" aria-controls="auth">
				<i class="menu-icon mdi mdi-account-circle-outline"></i>
				<span class="menu-title">이벤트</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/event/list">이벤트 리스트</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="${ctp}/admin/event/upload">이벤트 업로드</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">이벤트 당첨자 추첨</a>
					</li>
				</ul>
			</div>
			<div class="collapse" id="event">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="#">이벤트 당첨자 리스트</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item nav-category">USER HOME</li>
		<li class="nav-item">
			<a class="nav-link" href="${ctp}/">
				<i class="menu-icon mdi mdi-file-document"></i>
				<span class="menu-title">유저 홈으로 이동</span>
			</a>
		</li>
	</ul>
</nav>