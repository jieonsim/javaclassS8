<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<ul class="team_tab">
	<li tabname="reservation" class="${param.activeTab == 'reservation' ? 'on' : ''}">
		<a href="${ctp}/sports/baseball/${currentTeam}/reservation">
			<span class="team_tab1">예매하기</span>
		</a>
	</li>
	<li tabname="price" class="${param.activeTab == 'price' ? 'on' : ''}">
		<a href="${ctp}/sports/baseball/${currentTeam}/price">
			<span class="team_tab3">요금</span>
		</a>
	</li>
	<li tabname="seat" class="${param.activeTab == 'seat' ? 'on' : ''}">
		<a href="${ctp}/sports/baseball/${currentTeam}/seat">
			<span class="team_tab4">좌석도</span>
		</a>
	</li>
	<li tabname="info" class="system ${param.activeTab == 'info' ? 'on' : ''}">
		<a href="${ctp}/sports/baseball/${currentTeam}/info">
			<em>구단안내</em>
		</a>
	</li>
</ul>
<script src="${ctp}/js/sports/baseball/team_tab.js"></script>