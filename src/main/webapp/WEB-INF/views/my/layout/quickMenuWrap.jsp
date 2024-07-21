<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="quick_menu_wrap">
	<div class="title">
		<h2 class="title_txt">마이페이지</h2>
	</div>
	<ul class="quick_menu_list">
		<li class="quick_menu_item item_payco">
			<a href="/my/discount/point" class="quick_link">
				<div class="qmemu_box">
					<span class="qmenu_tit">나의 예매티켓</span>
					<!-- [D] 숫자일 경우 .number / 한글텍스트일 경우 .txt -->
					<span class="qmenu_txt">
						<span class="number" id="quickMenuRestMileage">0</span>
					</span>
				</div>
			</a>
		</li>
		<li class="quick_menu_item item_reserve">
			<a href="/my/discount/advanceticket-new" class="quick_link">
				<div class="qmemu_box">
					<span class="qmenu_tit">나의 예매권</span>
					<span class="qmenu_txt">
						<span class="number" id="quickMenuPreTicket">0</span>
					</span>
				</div>
			</a>
		</li>
		<!-- [D]나의 쿠폰(item_coupon) 클릭 시 마이페이지 - 쿠폰으로 연결 / 보유한 쿠폰 중 사용가능한 쿠폰 개수 노출 -->
		<li class="quick_menu_item item_coupon">
			<a href="/my/discount/coupon" class="quick_link">
				<div class="qmemu_box">
					<span class="qmenu_tit">나의 이벤트</span>
					<span class="qmenu_txt">
						<span class="number" id="quickMenuCoupon">0</span>
					</span>
				</div>
			</a>
		</li>
		<li class="quick_menu_item item_info">
			<a href="/my/memberInfo/info.nhn" class="quick_link">
				<div class="qmemu_box">
					<span class="qmenu_tit">나의 회원정보</span>
					<span class="qmenu_txt">
						<span class="txt">수정</span>
					</span>
				</div>
			</a>
		</li>
	</ul>
</div>