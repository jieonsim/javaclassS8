<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<h2 class="blind">스포츠</h2>
<!-- 1 depth -->
<h3 class="blind">football</h3>
<!-- 2 depth -->
<div class="sports_cont_top">
	<p class="location_path">
		<a href="${ctp}/">티켓챔프 홈</a>
		&gt;
		<a href="${ctp}/sports/football/main">축구</a>
		<c:if test="${not empty teamName}">
            &gt;
            <b>${teamName}</b>
		</c:if>
	</p>
	<p class="current_time">
		<em></em>현재시간
		<span>00:00</span>
	</p>
</div>
<script src="${ctp}/js/sports/common/currentTime.js"></script>