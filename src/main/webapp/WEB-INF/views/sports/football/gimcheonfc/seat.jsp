<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h4>
		<img src="${ctp}/images/sports/football/seat/gimcheonfc.png" alt="김천종합운동장 좌석도">
	</h4>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">일반석</h5>
		<a href="http://www.ticketlink.co.kr/my/discount/advanceticket-new" class="info">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #f4ba1e"></span>
				PREMIER(테이블석)
			</li>
			<li>
				<span class="cbx" style="background: #1a2b51"></span>
				GOLD(가변석)
			</li>
			<li>
				<span class="cbx" style="background: #e71419"></span>
				SILVER(일반석)
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #e344d2"></span>
				푸드슝~ZONE
			</li>
			<li>
				<span class="cbx" style="background: #1da4dd"></span>
				GOLD(가변석B)
			</li>
			<li>
				<span class="cbx" style="background: #e71419"></span>
				일반석 휠체어석
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #f19149"></span>
				올리즈석
			</li>
			<li>
				<span class="cbx" style="background: #67328f"></span>
				GOLD(스탠딩석)
			</li>
			<li>
				<span class="cbx" style="background: #6fc7d5"></span>
				원정석
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>