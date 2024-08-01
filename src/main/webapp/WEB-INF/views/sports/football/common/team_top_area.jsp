<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="team_top_area">
	<div class="img_area">
		<span class="blind">구단로고</span>
		<img src="${ctp}/images/sports/football/emblem/${currentTeam}.png" width="101" height="101" alt="${teamName}">
	</div>
	<div class="team_info_area">
		<h5 class="team_name">
			<span class="blind">구단명</span>
			${teamName}
		</h5>
		<div class="product_detail_option">
			<div class="popup_btn_wrap">
				<a href="#" class="product_option_btn type_clean" data-toggle="popover" data-placement="bottom" data-content="보안문자 입력 후 좌석 선택 가능">클린예매</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>