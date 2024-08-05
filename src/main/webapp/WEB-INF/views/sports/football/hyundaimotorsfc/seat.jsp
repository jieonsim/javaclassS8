<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="seat_plan">
		<img src="${ctp}/images/sports/football/seat/hyundaimotorsfc.png" alt="전주 월드컵경기장 좌석도">
	</div>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">예매 가능한 좌석</h5>
		<a href="${ctp}/my/discount/advanceTicket" class="info">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #175945"></span>
				E/N/S존
			</li>
			<li>
				<span class="cbx" style="background: #6bbd45"></span>
				W존 엣지
			</li>
			<li>
				<span class="cbx" style="background: #4f5da1"></span>
				벤치존 H
			</li>
			<li>
				<span class="cbx" style="background: #9d7647"></span>
				커플석H(1F-1)
			</li>
			<li>
				<span class="cbx" style="background: #9d7647"></span>
				패밀리석A
			</li>
			<li>
				<span class="cbx" style="background: #e1d54f"></span>
				사이드테이블석
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #85c98c"></span>
				E존 센터석
			</li>
			<li>
				<span class="cbx" style="background: #6bbd45"></span>
				W존 벨류
			</li>
			<li>
				<span class="cbx" style="background: #b088be"></span>
				벤치존 A
			</li>
			<li>
				<span class="cbx" style="background: #9d7647"></span>
				테이블석A(1K)
			</li>
			<li>
				<span class="cbx" style="background: #f68845"></span>
				센트럴석
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #b3b2b2"></span>
				S존(원정석)
			</li>
			<li>
				<span class="cbx" style="background: #dbb685"></span>
				W존 센터석
			</li>
			<li>
				<span class="cbx" style="background: #9d7647"></span>
				테이블석H(1F)
			</li>
			<li>
				<span class="cbx" style="background: #9d7647"></span>
				커플석A(1K-1)
			</li>
			<li>
				<span class="cbx" style="background: #67b0c9"></span>
				스카이박스
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>