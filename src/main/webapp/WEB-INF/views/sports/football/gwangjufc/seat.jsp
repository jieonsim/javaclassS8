<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h4>
		<img src="${ctp}/images/sports/football/seat/gwangjufc.png" alt="광주축구전용구장 좌석도">
	</h4>
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
				<span class="cbx" style="background: #b8192f"></span>
				W석
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #ffcd00"></span>
				E/N석
			</li>
		</ul>

		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #8a8000"></span>
				원정석
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>