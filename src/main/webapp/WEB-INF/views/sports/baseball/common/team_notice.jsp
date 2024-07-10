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

		<c:if test="${currentTeam == 'lg'}">
			<p class="txt_info">
				* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
				<br>
				(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
				<br>
				* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
				<br>
				* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
				<br>
				* 권종선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.
				<br>
				(현장에서 재구매 해야합니다.)
			</p>
		</c:if>

		<c:if test="${currentTeam == 'kt'}">
			<p class="txt_info">
				· 수원종합운동장 주차장은 사전예약 차량만 주차 가능합니다.
				<br>
				└ kt wiz, 수원종합운동장 홈페이지를 통한 예약 가능(kt wiz 홈경기 7일전 14시 ~ 만차 시)
			</p>
		</c:if>

		<c:if test="${currentTeam == 'ssg'}">
			<p class="txt_info">
				* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능합니다. (단, 경기 시작 4시간 전부터는 취소는 불가)
				<br>
				* 36개월 미만 유아는 별도 예매 없이 무료 입장 가능합니다. (단, 좌석 선점 시 별도 예매 필요)
				<br>
				* 현장 매표소는 주중 경기시작 2시간 30분 전 ~ 6회말 , 주말 경기시작 3시간 전 ~ 6회말 까지 운영합니다.
				<br>
				* 7회 초 이후 무료 입장은 운영하지 않습니다.
				<br>
				* 몰리스 그린존을 포함해 인천 SSG 랜더스 필드 전체는 반려동물 출입이 금지됩니다. (시각장애인 안내견 제외)
			</p>
		</c:if>

		<c:if test="${currentTeam == 'kia'}">
			<p class="txt_info">
				* 경기 당일 매표소가 혼잡하오니, 스마트티켓을 활용하면 바로입장 가능합니다.
				<br>
				* 권종선택 실수로 인한 예매 건은 교환/환불 불가합니다.
				<br>
				* 매표소는 경기 당일 시작 시간 2시간 전 오픈입니다.
				<br>
				* 인터넷 예매 취소는 경기 당일 경기 시작 2시간 전까지만 본인이 직접 취소하셔야 합니다.
				<br>
				* 본인 확인이 힘든 경우 입장권 교환 불가하며,모든 증빙수단은 실물카드만 인정됩니다.
				<br>
				* 매진 시 입장권 구입 및 환불은 불가합니다.
				<br>
				* 주차장이 협소하므로 대중교통 이용을 부탁드립니다.
			</p>
		</c:if>

		<c:if test="${currentTeam == 'samsung'}">
			<p class="txt_info">
				[2024 삼성라이온즈 홈경기 예매 안내]
				<br>
				- 전좌석 지정좌석제로 운영되오니 예매 좌석에 착석하여 주시기 바랍니다.
				<br>
				- 경기장 내 캐치볼, 과도한 사진 촬영, 타인의 관람을 방해하는 물건 반입 등은 삼가주시기 바랍니다.
				<br>
				- 흡연은 정해진 구역에서만 가능합니다.
			</p>
		</c:if>

		<c:if test="${currentTeam == 'hanhwa'}">
			<p class="txt_info">
				[주차 불가 안내] 한화생명이글스파크 내부 지상 주차 제한(신축구장 건설관련, 지하 주차장 기존과 동일하게 이용 가능)
				<br>
				※ 무통장입금 서비스 제외
				<br>
				※ 청소년(2006년~2011년) , 어린이(36개월이상~초등학생)입장 시 대상자 확인
				<br>
				※ 36개월 이상 어린이는 티켓 구매 후 입장 가능
				<br>
				※ 다자녀 할인 = 성인2명 할인, 증빙수단 "실물카드"만 인증(가족관계증명서, 등본 인증불가)
				<br>
				※ 휠체어석 지정좌석제 변경 : 5월21일(화) 홈경기부터(온라인 예매가능)
			</p>
		</c:if>
	</div>
</div>