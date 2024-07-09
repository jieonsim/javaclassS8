<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="cont_left">
	<p class="games_logo">
		<img src="${ctp}/images/sports/baseball/logo_baseball.gif" alt="logo_baseball">
	</p>
	<ul class="left_sportsmenu">
		<li class="_teamArea">
			<span class="sportsmenuTEAM">TEAM</span>
			<ul class="left_submenu">
				<li class="${currentTeam == 'lg' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/lg/reservation">LG트윈스</a>
				</li>
				<li class="${currentTeam == 'kt' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/kt/reservation">kt wiz</a>
				</li>
				<li class="${currentTeam == 'ssg' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/ssg/reservation">SSG 랜더스</a>
				</li>
				<li class="${currentTeam == 'kia' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/kia/reservation">KIA 타이거즈</a>
				</li>
				<li class="${currentTeam == 'samsung' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/samsung/reservation">삼성 라이온즈</a>
				</li>
				<li class="${currentTeam == 'hanhwa' ? 'on menu_option' : ''}">
					<a href="${ctp}/sports/baseball/hanhwa/reservation">한화이글스</a>
				</li>
			</ul>
		</li>
		<!-- seasonoff -->
		<li class="_scheduleArea">
			<a href="${ctp}/sports/baseball/schedule">
				<span class="sportsmenu1">전체일정</span>
			</a>
		</li>
		<li class="_guideArea">
			<a href="/help/guide/reservation/baseball">
				<span class="sportsmenu2">예매가이드</span>
			</a>
		</li>
	</ul>
</div>