<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h5 class="mgt20" style="font-size: 24px">수원 케이티위즈파크</h5>
	<div class="seat_plan">
		<img alt="케이티위즈파크 야구장 좌석도" src="${ctp}/images/sports/baseball/seat/kt.png">
	</div>
	<div class="seat_tit_area">
		<h5 class="sp_tit seat">예매 가능한 좌석</h5>
		<a class="info" href="${ctp}/my/discount/advanceTicket">
			스포츠예매권이란
			<span></span>
		</a>
	</div>
	<div class="seat_lst_wrap">
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #206ab2"></span>
				지니존
			</li>
			<li>
				<span class="cbx" style="background: #e94e5c"></span>
				KT알파쇼핑석
			</li>
			<li>
				<span class="cbx" style="background: #612273"></span>
				중앙지정석
			</li>
			<li>
				<span class="cbx" style="background: #24b8b7"></span>
				하이파이브존(1루)
			</li>
			<li>
				<span class="cbx" style="background: #24b8b7"></span>
				3루 익사이팅석
			</li>

		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #e69a3e"></span>
				Y박스석(1루)
			</li>
			<li>
				<span class="cbx" style="background: #519337"></span>
				지니TV석(3루)
			</li>
			<li>
				<span class="cbx" style="background: #af1d2a"></span>
				응원지정석(1/3루)
			</li>
			<li>
				<span class="cbx" style="background: #192b5b"></span>
				스카이존(5층, 1/3루)
			</li>

		</ul>
		<ul class="seat_lst">
			<li>
				<span class="cbx" style="background: #cbd87e"></span>
				외야잔디/자유석
			</li>
			<li>
				<span class="cbx" style="background: #f3a9ba"></span>
				티빙 테이블석(외야)
			</li>
			<li>
				<span class="cbx" style="background: #2FB0B2"></span>
				키즈랜드 캠핑존(4층)
			</li>
			<li>
				<span class="cbx" style="background: #1F8DCC"></span>
				키즈랜드 캠핑존(5층)
			</li>
		</ul>
		<span class="bar"></span>
		<span class="bar v2"></span>
	</div>
</div>