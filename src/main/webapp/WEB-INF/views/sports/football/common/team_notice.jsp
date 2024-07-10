<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="team_notice">
	<div class="dummy_td">
		<h4 class="title">구단 공지</h4>
	</div>
	<div class="bx_notice">
		<div class="clean_reserve">
			<p class="txt_info">보안문자 입력 후 예매가 가능한 클린예매 상품입니다.</p>
		</div>

		<c:if test="${currentTeam == 'steelers'}">
			<p class="txt_info">
				[2024 포항스틸러스 홈경기 예매 안내]
				<br>
				- 홈팀 구역에서 원정유니폼 착용 또는 원정팀 응원 물품을 소지하거나 응원할 경우 무환불퇴장 조치됩니다.
				<br>
				- 원정팀 구역에서 홈유니폼 착용 또는 홈팀 응원 물품을 소지하거나 응원할 경우 무환불퇴장 조치됩니다.
				<br>
				- 전 좌석 지정좌석제로 운영되며 예매 좌석에 착석하여 주시길 바랍니다.
			</p>
		</c:if>

		<c:if test="${currentTeam == 'gwangjufc'}">
			<p class="txt_info">
				- 전 좌석 지정좌석제로 운영합니다.
				<br>
				- 온라인 예매 및 현장에서도 티켓 구매가 가능합니다.
				<br>
				- 경기장내 음식물 반입 및 섭취가능(단,캔.병.페트병600ml이상 반입금지)
				<br>
				- 경기 당일 원활한 입장을 위해 모바일 티켓을 적극 이용해 주시기 바랍니다. (1매표소 매우 혼잡합니다.)
				<br>
				- 티켓북 구매 고객도 온라인 예매를 통한 티켓 구매후 입장이 가능합니다.
				<br>
				- 원정석 이외 구역에서 원정팀과 관련된 유니폼, 물품등을 소지하거나 원정팀을 응원하는 행위 적발시 무환불 퇴장 조치됩니다.
			</p>
		</c:if>

		<c:if test="${currentTeam == 'hyundaimotorsfc'}">
			<p class="txt_info">경기당일 원활한 입장을 위해서 스마트티켓 또는 무인발매기를 적극 이용해 주시기 바랍니다.</p>
		</c:if>

		<c:if test="${currentTeam == 'incheonutd'}">
			<p class="txt_info">
				[2024 인천유나이티드 홈경기 예매 안내]
				<br>
				1. 원정석 등급만 티켓링크 홈페이지에서 예매 가능합니다.
				<br>
				2. 원정석 등급 이외 등급은 구단 홈페이지에서 예매 가능합니다.
				<br>
				3. 전구역 지정좌석제로 운영합니다.
				<br>
				4. 원정석 이외구역에서 원정팀과 관련된 유니폼, 물품 등을 소지하거나 원정팀을 응원할 경우 적발시, 무환불 퇴장조치됩니다.
				<br>
				5. 음식물 반입 및 취식 가능합니다
				<br>
				(단, 주류 반입 불가 / 유리병, 캔류, 600ml 초과 PET병 반입 불가)
				<br>
			</p>
		</c:if>

		<c:if test="${currentTeam == 'daegufc'}">
			<p class="txt_info">
				- 홈팀 구역에서 원정유니폼 착용 또는 원정팀 응원 물품을 소지하거나 응원할 경우 무환불퇴장 조치됩니다.
				<br>
				- 원정팀 구역에서 홈유니폼 착용 또는 홈팀 응원 물품을 소지하거나 응원할 경우 무환불퇴장 조치됩니다.
				<br>
				- 전 좌석 지정좌석제로 운영되며 예매 좌석에 착석하여 주시길 바랍니다.
			</p>
		</c:if>

		<c:if test="${currentTeam == 'fcseoul'}">
			<p class="txt_info">
				[2024시즌 예매안내]
				<br>
				36개월 이상 미취학 아동도 반드시 개별좌석 티켓 구매하셔야 입장 가능합니다.
				<br>
				원정석을 제외한 모든 좌석은 FC서울 응원 전용구역입니다.
				<br>
				경기당일 매표소를 최소화로 운영하기에 비대면 서비스인 무인발권기와 스마트티켓을 적극 이용해주시기 바랍니다.
			</p>
		</c:if>
		<c:if test="${currentTeam == 'gimcheonfc'}">
			<p class="txt_info">
				※ 스타디움 투어(부가상품) 유의사항
				<br>
				1. 스타디움 투어는 주말 경기에만 진행되며, 평일 경기는 진행되지 않습니다.
				<br>
				2. 구매는 원정석 제외 전 좌석 구매가 가능합니다.
				<br>
				3. 구매는 관람티켓 수량과 동일하게 구매 가능합니다.
				<br>
				4. 구매 마감 이후 개별 안내를 통해 세부 시간을 전달 할 예정입니다.
				<br>
				5. 스타디움 투어 구매자분들은 경기 전날 오후 2시 전까지 예매 취소가 가능합니다.
				<br>
				*오후 2시 이후부터는 경기 티켓과 스타디움 투어 취소가 불가
				<br>
			</p>
		</c:if>
	</div>
</div>