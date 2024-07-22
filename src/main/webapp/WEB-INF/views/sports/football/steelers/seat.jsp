<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h4>
		<img src="${ctp}/images/sports/football/seat/steelers.png" alt="포항스틸야드 좌석도">
	</h4>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">예매 가능한 좌석</h5>
		<a href="#" class="info">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #eb6100"></span>
				퍼스트클래스석
			</li>
			<li>
				<span class="cbx" style="background: #dcae42"></span>
				프레스티지석
			</li>
			<li>
				<span class="cbx" style="background: #b00703"></span>
				일반석
			</li>
			<li>
				<span class="cbx" style="background: #8a8000"></span>
				원정석
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #57311c"></span>
				데크석(4인)
			</li>
			<li>
				<span class="cbx" style="background: #007d42"></span>
				프리미엄석
			</li>
			<li>
				<span class="cbx" style="background: #000000"></span>
				서포팅존
			</li>
		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #1d005f"></span>
				테이블석
			</li>
			<li>
				<span class="cbx" style="background: #61008e"></span>
				W지정석
			</li>
			<li>
				<span class="cbx" style="background: #06a9e5"></span>
				스카이박스
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>