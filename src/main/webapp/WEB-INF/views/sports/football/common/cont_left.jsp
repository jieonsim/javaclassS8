<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="cont_left">
	<p class="games_logo">
		<img src="${ctp}/images/sports/football/common/2024_k_league.gif" alt="logo_football">
	</p>
	<ul class="left_sportsmenu">
		<li class="_teamArea">
			<span class="sportsmenuTEAM">K리그1</span>
			<ul class="left_submenu">
				<li class="${currentTeam == 'uhfc' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/uhfc/reservation">울산 HD FC</a>
				</li>
				<li class="${currentTeam == 'steelers' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/steelers/reservation">포항 스틸러스</a>
				</li>
				<li class="${currentTeam == 'gwangjufc' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/gwangjufc/reservation">광주 FC</a>
				</li>
				<li class="${currentTeam == 'hyundaimotorsfc' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/hyundaimotorsfc/reservation">전북 현대모터스</a>
				</li>
				<li class="${currentTeam == 'incheonutd' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/incheonutd/reservation">인천 유나이티드</a>
				</li>
				<li class="${currentTeam == 'daegufc' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/daegufc/reservation">대구FC</a>
				</li>
				<li class="${currentTeam == 'fcseoul' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/fcseoul/reservation">FC서울</a>
				</li>
				<li class="${currentTeam == 'gimcheonfc' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/football/gimcheonfc/reservation">김천상무프로축구단</a>
				</li>
			</ul>
		</li>
		<li class="_scheduleArea">
			<a href="${ctp}/sports/football/schedule">
				<span class="sportsmenu1">전체일정</span>
			</a>
		</li>
	</ul>
</div>