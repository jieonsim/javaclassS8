<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="quick_menu_wrap">
	<div class="title">
		<h2 class="title_txt">마이페이지</h2>
	</div>
	<ul class="quick_menu_list">
		<li class="quick_menu_item item_reserve">
			<div class="d-flex justify-content-center">
				<i class="quickMenuIcon ph-light ph-ticket"></i>
				<a href="${ctp}/my/reserve/list" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 예매티켓</span>
						<span class="qmenu_txt">
							<span class="number" id="quickMenuReserve">0</span>
						</span>
					</div>
				</a>
			</div>
		</li>
		<li class="quick_menu_item item_advance_ticket">
			<div class="d-flex justify-content-center">
				<i class="quickMenuIcon ph-light ph-shopping-cart"></i>
				<a href="${ctp}/my/discount/advanceTicket" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 예매권</span>
						<span class="qmenu_txt">
							<span class="number" id="quickMenuAdvanceTicket">0</span>
						</span>
					</div>
				</a>
			</div>
		</li>
		<li class="quick_menu_item item_event">
			<div class="d-flex justify-content-center">
				<i class="quickMenuIcon ph-light ph-hand-heart"></i>
				<a href="${ctp}/my/activity/event" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 이벤트</span>
						<span class="qmenu_txt">
							<span class="number" id="quickMenuEvent">0</span>
						</span>
					</div>
				</a>
			</div>
		</li>
		<li class="quick_menu_item item_info">
			<div class="d-flex justify-content-center">
				<i class="quickMenuIcon ph-light ph-user-circle"></i>
				<a href="${ctp}/my/memberInfo/info" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 회원정보</span>
						<span class="qmenu_txt">
							<span class="txt">수정</span>
						</span>
					</div>
				</a>
			</div>
		</li>
	</ul>
</div>
<script src="${ctp}/js/my/common/quickMenuWrap.js"></script>