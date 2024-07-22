<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="tab_content">
		<h5 class="mgt20" style="font-size: 24px">KIA 챔피언스필드</h5>
		<div class="seat_plan">
			<img alt="KIA 챔피언스필드 야구장 좌석도" src="${ctp}/images/sports/baseball/seat/kia.png">
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
					<span class="cbx" style="background: #d15050"></span>
					챔피언석
				</li>
				<li>
					<span class="cbx" style="background: #5e964a"></span>
					타이거즈가족석(4인,6인)
				</li>
				<li>
					<span class="cbx" style="background: #6ebe88"></span>
					에코다이나믹스 가족석(6인)
				</li>
				<li>
					<span class="cbx" style="background: #93cb3b"></span>
					K5존
				</li>
				<li>
					<span class="cbx" style="background: #c49f48"></span>
					외야자유석
				</li>
			</ul>
			<ul class="seat_lst">
				<li>
					<span class="cbx" style="background: #284786"></span>
					중앙테이블석(2인,3인)
				</li>
				<li>
					<span class="cbx" style="background: #85c0dc"></span>
					파티석(4인)
				</li>
				<li>
					<span class="cbx" style="background: #db59af"></span>
					K9존
				</li>
				<li>
					<span class="cbx" style="background: #9575c1"></span>
					K3존
				</li>
			</ul>
			<ul class="seat_lst">
				<li>
					<span class="cbx" style="background: #df7242"></span>
					서프라이즈존
				</li>
				<li>
					<span class="cbx" style="background: #4d499a"></span>
					스카이피크닉석(4인)
				</li>
				<li>
					<span class="cbx" style="background: #f0bc2e"></span>
					K8존
				</li>
				<li>
					<span class="cbx" style="background: #8f7356"></span>
					휠체어석
				</li>
			</ul>
			<span class="bar"></span>
			<span class="bar v2"></span>
		</div>
	</div>
</div>