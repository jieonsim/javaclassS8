<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h5 class="mgt20" style="font-size: 24px">잠실야구장</h5>
	<div class="bx_dsc">
		<p class="dsc type2">
			<b>잠실 종합운동장(잠실야구장) 주차 안내</b>
		</p>
		<ul class="dsc type2">
			<li>
				올림픽 주경기장 공사 등으로 잠실 종합운동장 주차공간이 매우 부족합니다.
				<br>
				야구 관람을 계획하신 팬 여러분께서는 반드시 대중교통 이용을 부탁드리며,
				<br>
				평소보다 조금 빨리 경기장에 도착 하실 것을 권장 드립니다.
			</li>

		</ul>
	</div>
	<div class="seat_plan">
		<img alt="잠실야구장 좌석도" src="${ctp}/images/sports/baseball/seat/lg.png">
	</div>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">예매 가능한 좌석</h5>
		<a class="info" href="http://www.ticketlink.co.kr/my/discount/advanceticket-new">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: rgb(77, 146, 217);"></span>
				켈리존(프리미엄석)
			</li>
			<li>
				<span class="cbx" style="background: rgb(53, 89, 163);"></span>
				블루석
			</li>
			<li>
				<span class="cbx" style="background: rgb(54, 63, 118);"></span>
				네이비석
			</li>
			<li>
				<img src="http://image.toast.com/aaaaab/ticketlink/TKL_2/wc_black.png" style="margin-right: 6px;">
				휠체어석
			</li>
			<span class="bar"></span>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: rgb(140, 84, 169);"></span>
				1루 테이블석
			</li>
			<li>
				<span class="cbx" style="background: rgb(254, 109, 0);"></span>
				오렌지석
			</li>
			<li>
				<span class="cbx" style="background: rgb(240, 206, 46);"></span>
				익사이팅석
			</li>
		</ul>
		<span class="bar v2"></span>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: rgb(140, 84, 169);"></span>
				3루 테이블석
			</li>
			<li>
				<span class="cbx" style="background: rgb(188, 62, 77);"></span>
				레드석
			</li>
			<li>
				<span class="cbx" style="background: rgb(43, 179, 114);"></span>
				외야그린석
			</li>
		</ul>
	</div>
</div>