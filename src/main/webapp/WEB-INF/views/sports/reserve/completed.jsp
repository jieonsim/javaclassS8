<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/sports/reserve/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/sports/reserve.css">
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body class="ng-scope">
	<div id="wrap_reserve">
		<div id="header">
			<div class="reserve_title">
				<h1>
					<span class="blind">티켓챔프</span>
				</h1>
				<h2>티켓챔프 예매</h2>
			</div>
			<ul class="reserve_step ng-isolate-scope">
				<li class="step1">
					<span class="ng-binding ng-scope">날짜/회차선택</span>
				</li>
				<li class="step2">
					<span class="ng-binding ng-scope">등급/좌석선택</span>
				</li>
				<li class="step3">
					<span class="ng-binding ng-scope">권종/할인/매수선택</span>
				</li>
				<li class="step4">
					<span class="ng-binding ng-scope">예매확인</span>
				</li>
				<li class="step5 on">
					<span class="ng-binding ng-scope">결제</span>
				</li>
			</ul>
			<h2 class="blind">예매확인</h2>
		</div>
		<!-- <div id="container" class="has_ban"> -->
		<div id="container">
			<div class="reserve_left">
				<div class="pointb_box">
					<p class="inner_txt reserve_end">티켓예매가 완료되었습니다.</p>
				</div>
				<!-- ngIf: reserve.isConcertExhibition || reserve.isAdvanceTicket -->
				<!-- ngIf: reserve.isSports && reserve.isTicket -->
				<!-- ngIf: reserve.isSports && !reserve.isTicket -->
				<div class="white_box mgt10 ng-scope" ng-if="reserve.isSports &amp;&amp; !reserve.isTicket">
					<dl class="goods_info sports_info">
						<div class="bx">
							<dt class="blind">대표이미지</dt>
							<!-- ngIf: reserve.teamMatchUse -->
							<dt class="img_title ng-scope" ng-if="reserve.teamMatchUse">
								<em> <img ng-src="//image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png" src="//image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png">
								</em>
								<span class="versus sp_sports">vs</span>
								<em> <img ng-src="//image.toast.com/aaaaab/ticketlink/TKL_1/lotte_2023.png" src="//image.toast.com/aaaaab/ticketlink/TKL_1/lotte_2023.png">
								</em>
							</dt>
							<!-- end ngIf: reserve.teamMatchUse -->
							<!-- ngIf: !reserve.teamMatchUse -->
						</div>
						<div class="bx">
							<dt>예매번호</dt>
							<dd class="ng-binding">1468853619 (총 3매)</dd>
						</div>
						<div class="bx">
							<dt>티켓명</dt>
							<dd class="ng-binding">
								[2024 신한 SOL Bank KBO 리그]
								<br>
								<!-- ngIf: reserve.gameTitle -->
								<!-- ngIf: reserve.teamMatchUse -->
								<span ng-if="reserve.teamMatchUse" class="ng-binding ng-scope"> SSG 랜더스 vs 롯데자이언츠 </span>
								<!-- end ngIf: reserve.teamMatchUse -->
							</dd>
						</div>
						<div class="bx">
							<dt>장소</dt>
							<dd class="ng-binding">인천 SSG 랜더스 필드</dd>
						</div>
						<div class="bx">
							<dt>일시</dt>
							<dd class="ng-binding">2024.07.30(화) 18:30</dd>
						</div>
						<!-- ngIf: reserve.hasSeat && provideMySeatView === 'false' -->
						<!-- ngIf: reserve.hasSeat && provideMySeatView === 'true' -->
						<div class="bx seat_bx ng-scope" ng-if="reserve.hasSeat &amp;&amp; provideMySeatView === 'true'">
							<dt>
								<button type="button" class="btn_seat" ng-click="fn.seat.open()" ng-mouseenter="fn.seat.toggleTooltip(true)" ng-mouseleave="fn.seat.toggleTooltip(false)">좌석</button>
							</dt>
							<dd>
								<!-- ngRepeat: seat in reserve.seatAttributes -->
								<p ng-repeat="seat in reserve.seatAttributes" class="ng-binding ng-scope">[4층 일반석] 301블록 B열 6번</p>
								<!-- end ngRepeat: seat in reserve.seatAttributes -->
								<p ng-repeat="seat in reserve.seatAttributes" class="ng-binding ng-scope">[4층 일반석] 301블록 B열 7번</p>
								<!-- end ngRepeat: seat in reserve.seatAttributes -->
								<p ng-repeat="seat in reserve.seatAttributes" class="ng-binding ng-scope">[4층 일반석] 301블록 B열 8번</p>
								<!-- end ngRepeat: seat in reserve.seatAttributes -->
							</dd>
							<!-- ngIf: seatTooltip -->
							<dd class="tooltip ng-scope" ng-if="seatTooltip">
								<a href="javascript:" class="btn_seat" ng-click="fn.seat.open()">
									<span class="text pdl10">위치보기</span>
								</a>
							</dd>
							<!-- end ngIf: seatTooltip -->
						</div>
						<!-- end ngIf: reserve.hasSeat && provideMySeatView === 'true' -->
						<div class="bx">
							<!-- ngIf: reserve.entranceGateNames.length>0 -->
							<!-- ngIf: reserve.entranceGateNames.length>0 -->
						</div>

						<!-- ngIf: reserve.additionalProductOrderList != null -->

					</dl>
				</div>
				<!-- end ngIf: reserve.isSports && !reserve.isTicket -->
				<div class="white_box fin_box_left">
					<dl class="reserve_info">
						<dt>예매자</dt>
						<dd class="ng-binding">심지언</dd>
						<dt>연락처</dt>
						<dd class="ng-binding">010-8549-5209</dd>
						<dt>티켓수령방법</dt>
						<!-- ngIf: !reserve.isStreaming -->
						<dd ng-if="!reserve.isStreaming" class="ng-binding ng-scope">
							현장수령
							<!-- ngIf: isGangwonReceed -->
						</dd>
						<!-- end ngIf: !reserve.isStreaming -->
						<!-- ngIf: reserve.isStreaming -->
						<!-- ngIf: reserve.additionalProductOrderList != null -->
						<!-- ngIf: reserve.additionalProductOrderList != null && reserve.additionalProductDeliveryType == 'DELIVERY' -->
						<!-- ngIf: reserve.additionalProductOrderList != null && reserve.additionalProductDeliveryType != 'DELIVERY' -->
					</dl>
				</div>
				<div class="white_box fin_box_right">
					<table>
						<caption>결제정보</caption>
						<colgroup>
							<col style="width: 70px;">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>총 결제금액</th>
								<td class="ng-binding">36,000</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>티켓금액</th>
								<td class="ng-binding">33,000</td>
							</tr>
							<tr>
								<th>예매수수료</th>
								<td class="ng-binding">3,000</td>
							</tr>
							<tr>
								<th>부가상품</th>
								<td class="ng-binding">0</td>
							</tr>
							<tr>
								<th>배송료</th>
								<td class="ng-binding">0</td>
							</tr>
							<!-- ngIf: reserve.couponDiscountAmount > 0 -->
							<!-- ngIf: reserve.integratePoint.usedPoint > 0 || reserve.benepiaPoint.pointUsageAmount > 0 -->
							<tr>
								<th>결제정보</th>
								<!-- ngIf: reserve.nonBankingInfo != null -->
								<!-- ngIf: reserve.nonBankingInfo == null -->
								<td ng-if="reserve.nonBankingInfo == null" class="ng-scope">
									<!-- ngRepeat: payment in reserve.paymentDetails -->
									<p ng-repeat="payment in reserve.paymentDetails" class="ng-binding ng-scope">
										신용카드 간편결제
										<!-- ngIf: payment.paymentCompanyName -->
										<span class="color_point ng-binding">36,000</span>
									</p>
									<!-- end ngRepeat: payment in reserve.paymentDetails -->
								</td>
								<!-- end ngIf: reserve.nonBankingInfo == null -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="reserve_right">




				<div class="ad_area">
					<script type="text/javascript" src="//ads.netinsight.co.kr/NetInsight/js/ticketlink/ticketingbox/209@200"></script>
				</div>



				<div class="notice_end">
					<strong><span>유의사항</span></strong>
					<div ng-bind-html="reserve.reserveCompleteContent | trust" class="ng-binding">
						<span style="font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 9pt;">
							<b>예매 안내</b>
							<br>
							- 예매마감시간 : 경기 당일 경기 시작 1시간 후까지 가능
							<br>
							&nbsp;(경기당일 경기 시작 4시간 전 ~ 경기 시작 1시간 후까지 예매분은 취소 불가)
							<br>
							- 예매취소시간 : 경기 당일 경기 시작 4시간전까지 가능
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
							주중(월~금) : 경기시작 2시간 30분 전 / 주말(토,일,공휴일) : 경기시작 3시간 전 부터
							<br>
							현장 매표소 또는 무인발권기를 통해 수령가능합니다.
							<br>
							- 현장매표소 이용 시 예매번호, 성명, 생년월일, 휴대폰번호 뒷자리 확인이 필요합니다.
							<br>
							- 무인발권기 이용 시 예매번호와 생년월일 입력이 필요합니다.​
							<br>
							- 경기시작 4시간 전 부터 스마트(모바일)티켓 발권 가능합니다.
							<br>
							- 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.

						</span>
					</div>
				</div>
				<div class="reserve_btn">
					<!-- ngIf: !reserve.isStreaming -->
					<a class="btn btn_blank ng-scope" ng-if="!reserve.isStreaming" ng-click="print()">내역 프린트</a>
					<!-- end ngIf: !reserve.isStreaming -->
					<a class="btn btn_full" ng-click="confirm()">예매확인</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>