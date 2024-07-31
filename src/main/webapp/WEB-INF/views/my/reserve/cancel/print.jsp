<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/my/reserve/popup.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body class="ng-scope">
	<div id="wrap_popup" style="width: 500px;">
		<div id="header">
			<h1>티켓예매내역</h1>
		</div>
		<div id="container" class="pop_reserve_history">
			<div class="block mgt0">
				<div class="pointb_box ng-scope">
					<p class="inner_txt">
						<span style="margin-bottom: 20px;">
							본 경기는 예매확인서로 입장이 불가능합니다.
							<br>
							현장에서 입장권을 발급받아 입장해 주시기 바랍니다.
						</span>
					</p>
				</div>
				<h2>예매정보</h2>
				<div class="tbl">
					<table>
						<caption>예매정보</caption>
						<colgroup>
							<col style="width: 100px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상품명</th>
								<td class="ng-binding ng-scope">
									<span class="ng-binding ng-scope"> ${reservation.homeTeamName} vs ${reservation.awayTeamName} </span>
								</td>
							</tr>
							<tr>
								<th scope="row">예매자</th>
								<td class="ng-binding">${reservation.memberName}</td>
							</tr>
							<tr>
								<th scope="row">예매번호</th>
								<td class="ng-binding">${reservation.reservationNumber} (총 ${reservation.ticketAmount}매)</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td class="ng-binding">${reservation.venueName}</td>
							</tr>
							<tr>
								<th scope="row">일시</th>
								<td class="ng-binding">${reservation.gameDate}&nbsp;${reservation.gameTime}</td>
							</tr>
							<tr>
								<th scope="row">좌석</th>
								<td>
									<c:forEach items="${reservationDetails}" var="detail">
										<p class="ng-binding ng-scope">${detail.seatName}&nbsp;${detail.seatBlock}블럭&nbsp;${detail.seatRow}열&nbsp;${detail.seatNumber}번</p>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="block">
				<h2>결제내역</h2>
				<div class="tbl">
					<table>
						<caption>결제내역</caption>
						<colgroup>
							<col style="width: 100px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">예매일</th>
								<td class="ng-binding">${reservation.formattedCreatedAt}</td>
							</tr>
							<tr>
								<th scope="row">총 결제금액</th>
								<td>
									<span class="color_point fbold ng-binding">
										<fmt:formatNumber value="${reservation.totalAmount}" type="number" />
										원
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">결제수단</th>
								<td class="print_receipt ng-scope">
									<p class="ng-binding ng-scope">${reservation.paymentMethod}</p>
								</td>
							</tr>
						</tbody>
					</table>
					<span class="reserve_cancel" style="top: 0; right: 0;">예매취소</span>
				</div>
			</div>
			<div class="block">
				<h2>안내 및 주의사항</h2>
				<span style="font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 9pt;">
					<br>
					<b>관중 입장 예매 안내</b>
					<br>
					- 예매마감시간 : 경기 당일 경기 시작 1시간 후까지 가능
					<br>
					(경기 당일 경기 시작 2시간 ~ 경기 시작 1시간 후까지 예매분은 취소 불가)
					<br>
					- 예매취소시간 : 경기 당일 경기 시작 2시간 전까지 가능
					<br>
					<br>
					<b>취소수수료 안내</b>
					<br>
					예매 당일 취소 시에는 취소수수료가 부과되지 않으며 예매수수료도 환불됩니다.
					<br>
					예매 익일 취소 시에는 취소수수료가 부과되며 예매수수료는 환불되지 않습니다.(취소기한 내에 한함)
					<br>
					<br>
					<b>티켓수령안내</b>
					<br>
					경기시작 1시간 30분 전 부터 현장 매표소 또는 무인발권기를 통해 수령가능합니다.(주중/주말/공휴일 공통)
					<br>
					- 현장매표소 이용 시 예매번호, 성명, 생년월일, 휴대폰번호 뒷자리 확인이 필요합니다.
					<br>
					- 무인발권기 이용 시 예매번호와 생년월일 입력이 필요합니다.​
					<br>
					- 경기시작 2시간 전 부터 스마트(모바일)티켓 발권 가능합니다.
					<br>
					- 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
					<br>
					<br>
					<b>우천취소 안내</b>
					<br>
					우천취소 된 경우 예매내역은 자동으로 일괄 취소되며, 전액 환불처리 됩니다.
					<br>
					현장에서 현금으로 구매하신 경우 매표소에서 환불 받을 수 있으며, 현장에서 카드로 구매하신 경우는 자동취소 됩니다.
					<br>
					단, 경기 시작 후 5회 이후 취소된 경기는 정식 경기로 인정되어 환불되지 않습니다.
					<br>
					(경기 스코어에 따라 경기성립 기준이 5회초 종료 또는 5회말 종료가 될 수 있습니다.)
				</span>
			</div>
		</div>
		<div id="footer">
			<a class="btn btn_full" id="printBtn">프린트</a>
			<a class="btn btn_blank" id="closeBtn">닫기</a>
		</div>
	</div>
	<script src="${ctp}/js/my/reserve/print.js"></script>
</body>
</html>