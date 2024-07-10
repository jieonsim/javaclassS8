<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="team_top_area">
	<div class="img_area">
		<span class="blind">구단로고</span>
		<img src="${ctp}/images/sports/baseball/emblem/${currentTeam}.png" width="101" height="101" alt="${teamName}">
	</div>
	<div class="team_info_area">
		<h5 class="team_name">
			<span class="blind">구단명</span>
			${teamName}
		</h5>
		<div class="product_detail_option">
			<div class="popup_btn_wrap">
				<button type="button" class="product_option_btn type_clean">클린예매</button>
				<div id="cleanReserveInfo" class="common_popup_wrap" style="display: none;">
					<div class="common_popup" role="dialog">
						<div class="common_popup_header">
							<h3 class="common_popup_title">클린예매 서비스안내</h3>
							<button type="button" id="cleanReserveClose" class="common_popup_close">
								<span class="common_icon icon_close ty_sm"></span>
								<span class="blind">닫기</span>
							</button>
						</div>
						<div class="common_popup_content">
							<div class="popup_section popup_clean_guide">
								<p class="popup_desc">
									<span class="text_medium">이 상품은 보안문자 입력 후 좌석 선택이 가능합니다.</span>
								</p>
								<div class="popup_imgbox">
									<img src="//tketlink.dn.toastoven.net/markup_resources/2024061901_M/renewal/pcweb/img/clean_reserve_info@2x.jpg" alt="클린예매 서비스안내" class="popup_img">
									<ol class="blind">
										<li>보안문자 확인</li>
										<li>위 이미지의 문자 입력</li>
										<li>입력완료 후 예매할 좌석 선택</li>
									</ol>
								</div>
								<p class="popup_desc">
									<span class="text_gray">
										-대/소문자 구분없음
										<br>
										-혼동하기 쉬운 문자 없음(I,L,O,Q 등)
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 홈팀으로 설정하면 on 클래스 추가 + '홈팀'으로 텍스트 변경 -->
	<a href="#" class="my_team">
		<!-- <span class="blind">홈팀설정</span> -->
		<span>홈팀설정</span>
	</a>
</div>