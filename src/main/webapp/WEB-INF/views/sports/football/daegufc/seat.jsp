<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="seat_plan">
		<img src="${ctp}/images/sports/football/seat/daegufc.png" alt="대구FC DGB대구은행파크 좌석도">
	</div>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">좌석 안내</h5>
		<a href="http://www.ticketlink.co.kr/my/discount/advanceticket-new" class="info">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #4679a4"></span>
				W석
			</li>
			<li>
				<span class="cbx" style="background: #ef9f43"></span>
				S석/스탠딩석
			</li>
			<li>
				<span class="cbx" style="background: #798dc8"></span>
				프리미엄 테이블석(2인/4인)
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #8fccf0"></span>
				E석
			</li>
			<li>
				<span class="cbx" style="background: #71d3d0"></span>
				E석 테이블석(2인,4인)
			</li>
			<li>
				<span class="cbx" style="background: #00528e"></span>
				스카이테이블석(2인)
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #ff9c9c"></span>
				N석
			</li>
			<li>
				<span class="cbx" style="background: #8957a1"></span>
				원정석
			</li>
			<li>
				<span class="cbx" style="background: #626262"></span>
				휠체어석(W석/E석
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
	<p class="caution">
		<b>&nbsp;</b>
	</p>
</div>