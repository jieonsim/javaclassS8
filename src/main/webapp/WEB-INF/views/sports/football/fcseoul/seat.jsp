<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="seat_plan">
		<img src="${ctp}/images/sports/football/seat/fcseoul.png" alt="FC서울 서울월드컵경기장 좌석도">
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
				<span class="cbx" style="background: #e00312"></span>
				동측 지정석
			</li>
			<li>
				<span class="cbx" style="background: #1b1b1b"></span>
				신한카드 동측 지정석
			</li>
			<li>
				<span class="cbx" style="background: #000456"></span>
				북측 자유석
			</li>
			<li>
				<span class="cbx" style="background: #80981e"></span>
				원정석
			</li>
			<li>
				<span class="cbx" style="background: #556fb5"></span>
				서울 엄마아빠 VIP존
			</li>

		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #a64e1b"></span>
				그라놀로지 VIP석(2인)
			</li>
			<li>
				<span class="cbx" style="background: #218380"></span>
				그라놀로지 VIP석(1인)
			</li>
			<li>
				<span class="cbx" style="background: #e87e04"></span>
				프리미엄 서측지정석
			</li>
			<li>
				<span class="cbx" style="background: #ad8800"></span>
				프리미엄 서측 센터지정석
			</li>
			<li>
				<span class="cbx" style="background: #00479d"></span>
				AMIGO 나쵸석
			</li>

		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #925bc2"></span>
				한돈 스카이펍(테이블석)
			</li>
			<li>
				<span class="cbx" style="background: #20bdb5"></span>
				한돈 스카이펍(테라스석)
			</li>
			<li>
				<span class="cbx" style="background: #485f73"></span>
				KRUSH 테이블석
			</li>
			<li>
				<span class="cbx" style="background: #f9b42d"></span>
				서측지정석
			</li>

		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>