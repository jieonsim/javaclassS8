<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<ul class="team_tab">
	<li tabname="reservation" class="${param.activeTab == 'reservation' ? 'on' : ''}">
		<a href="${ctp}/sports/football/${currentTeam}/reservation">
			<span class="team_tab1">예매하기</span>
		</a>
	</li>
	<li tabname="schedule" class="${param.activeTab == 'schedule' ? 'on' : ''}">
		<a href="${ctp}/sports/football/${currentTeam}/schedule">
			<span class="team_tab2">경기일정</span>
		</a>
	</li>
	<li tabname="price" class="${param.activeTab == 'price' ? 'on' : ''}">
		<a href="${ctp}/sports/football/${currentTeam}/price">
			<span class="team_tab3">요금/할인카드</span>
		</a>
	</li>
	<li tabname="seat" class="${param.activeTab == 'seat' ? 'on' : ''}">
		<a href="${ctp}/sports/football/${currentTeam}/seat">
			<span class="team_tab4">좌석도</span>
		</a>
	</li>
	<!-- [D] 어드민 입력된 탭메뉴 일때 system 클래스 추가, 어드민에서 입력된 탭메뉴명은 em 영역으로 호출 -->
	<li tabname="info" class="system ${param.activeTab == 'info' ? 'on' : ''}">
		<a href="${ctp}/sports/football/${currentTeam}/info">
			<em>구단안내</em>
		</a>
	</li>
</ul>
<script src="${ctp}/js/sports/football/team_tab.js"></script>