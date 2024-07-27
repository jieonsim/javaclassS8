<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/my/contents.css">
<link rel="stylesheet" href="${ctp}/css/my/memberInfo/matchPassword.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
				<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont ng-scope" ng-controller="reserveDetailCtrl">
					<h3 class="blind">예매관리</h3>
					<div class="h3_line">
						<h4>예매확인/취소</h4>
					</div>
					<p class="guide_txt">
						예매한 티켓 확인/취소가 가능합니다.
						<br>
						신용카드 단일 결제 시 부분 취소가 가능합니다. 단, <strong class="color_point">복합결제 및 신용카드를 제외한 다른 결제수단으로 예매 시 부분취소가 불가</strong>합니다.
					</p>
					<h5 class="text_tit">예매정보</h5>
					<div class="basic_tbl_v4">
						<table>
							<caption>
								<span class="blind">예매한 티켓정보</span>
							</caption>
							<colgroup>
								<col style="width: 116px">
								<col style="width: 255px">
								<col style="width: 116px">
								<col>
							</colgroup>
							<tbody>
								<tr class="line">
									<th scope="row">티켓명</th>
									<!-- ngIf: reserve.displayProductType === 'SPORTS_PRODUCT_NAME' -->
									<!-- ngIf: reserve.displayProductType === 'SPORTS_TEAM_MATCH' -->
									<td ng-if="reserve.displayProductType === 'SPORTS_TEAM_MATCH'" class="ng-scope">
										<!-- ngIf: reserve.leagueName -->
										<span ng-if="reserve.leagueName" class="ng-binding ng-scope">
											[2024 신한 SOL Bank KBO 리그]
											<br>
										</span>
										<!-- end ngIf: reserve.leagueName -->
										<!-- ngIf: reserve.gameTitle -->
										<!-- ngIf: reserve.teamMatchUseYn === 'Y' -->
										<span ng-if="reserve.teamMatchUseYn === 'Y'" class="ng-binding ng-scope"> SSG 랜더스 vs 롯데자이언츠 </span>
										<!-- end ngIf: reserve.teamMatchUseYn === 'Y' -->
									</td>
									<!-- end ngIf: reserve.displayProductType === 'SPORTS_TEAM_MATCH' -->
									<!-- ngIf: reserve.displayProductType === 'DEFAULT_PRODUCT_NAME' -->
									<th scope="row">예매자</th>
									<td class="ng-binding">심지언</td>
								</tr>
								<tr>
									<th scope="row">관람일시</th>
									<td class="ng-binding">2024.07.30(화) 18:30</td>
									<th scope="row">장소</th>
									<td class="ng-binding">인천 SSG 랜더스 필드</td>
								</tr>
								<tr>
									<!-- ngIf: reserve.provideMySeatView -->
									<th scope="row" ng-if="reserve.provideMySeatView" class="ng-scope">
										<!-- [D] 좌석(btn_seat) 마우스오버 시 툴팁 노출, x 버튼 클릭시 닫힘 -->
										<div class="seat_bx">
											<button type="button" ng-click="fn.seat.popup()" ng-mouseenter="fn.seat.toggleTooltip(true)" ng-mouseleave="fn.seat.toggleTooltip(false)" class="btn_seat">좌석</button>
											<!-- [D] 좌석보기 툴팁 -->
											<!-- ngIf: seatTooltip -->
											<div class="tooltip ng-scope" ng-if="seatTooltip">
												<a href="javascript:;" class="btn_seat" ng-click="fn.seat.popup()">
													<span class="text pdl10">위치보기</span>
												</a>
											</div>
											<!-- end ngIf: seatTooltip -->
											<!-- //[D] 좌석보기 툴팁 -->
										</div>
										<!-- //[D] 좌석(btn_seat) 마우스오버 시 툴팁 노출, x 버튼 클릭시 닫힘 -->
									</th>
									<!-- end ngIf: reserve.provideMySeatView -->
									<!-- ngIf: !reserve.provideMySeatView -->

									<td>
										<!-- ngRepeat: seatName in reserve.seatNames track by $index -->
										<p ng-repeat="seatName in reserve.seatNames track by $index" class="ng-binding ng-scope">4층 일반석 301블록 B열 6번</p>
										<!-- end ngRepeat: seatName in reserve.seatNames track by $index -->
										<p ng-repeat="seatName in reserve.seatNames track by $index" class="ng-binding ng-scope">4층 일반석 301블록 B열 7번</p>
										<!-- end ngRepeat: seatName in reserve.seatNames track by $index -->
										<p ng-repeat="seatName in reserve.seatNames track by $index" class="ng-binding ng-scope">4층 일반석 301블록 B열 8번</p>
										<!-- end ngRepeat: seatName in reserve.seatNames track by $index -->
									</td>

									<th scope="row">티켓수령 방법</th>
									<!-- ngIf: !reserve.streamingProduct -->
									<td ng-if="!reserve.streamingProduct" class="ng-binding ng-scope">
										현장수령
										<!-- ngIf: reserve.shippingInfo.isPreparing && reserve.shippingInfo.deliveryConsignYn == 'Y' -->
										<!-- ngIf: reserve.shippingInfo.isShipped && reserve.shippingInfo.deliveryConsignYn == 'Y' -->
										<!-- ngIf: reserve.shippingInfo.isPreparing && reserve.shippingInfo.deliveryConsignYn != 'Y' -->
										<!-- ngIf: reserve.isAddressModifiable -->
										<!-- ngIf: (reserve.shippingInfo.isShipped && reserve.reserveStateCode.name != 'ALL_CANCEL') && reserve.shippingInfo.deliveryConsignYn != 'Y' -->
									</td>
									<!-- end ngIf: !reserve.streamingProduct -->
									<!-- ngIf: reserve.streamingProduct -->
								</tr>
								<tr>
									<th scope="row">예매일</th>
									<td class="ng-binding">2024.07.27</td>
									<th scope="row">현재상태</th>
									<td class="ng-binding">
										예매완료
										<span ng-show="reserve.cancelReason != null &amp;&amp; reserve.cancelReason.isFrontExposable" class="ng-binding ng-hide">()</span>
										<span ng-show="reserve.nonDepositYn === 'Y'" class="ng-hide">(미입금 취소)</span>
										<!-- ngIf: !isMemberHasRefundAccount && reserve.cancelCount>0 && reserve.payment.isNonBanking -->
									</td>
								</tr>
								<tr>
									<th scope="row">결제수단</th>
									<td>
										<ul>
											<!-- ngRepeat: payment in reserve.payment.details -->
											<li ng-repeat="payment in reserve.payment.details" class="ng-scope">
												<!-- ngIf: reserve.payment.isWaitingForDeposit -->
												<!-- ngIf: !reserve.payment.isWaitingForDeposit -->
												<span ng-if="!reserve.payment.isWaitingForDeposit" class="ng-binding ng-scope"> 신용카드 간편결제 </span>
												<!-- end ngIf: !reserve.payment.isWaitingForDeposit -->

											</li>
											<!-- end ngRepeat: payment in reserve.payment.details -->
										</ul>
									</td>
									<th scope="row">예매채널</th>
									<td class="ng-binding">PC웹</td>
								</tr>
								<!-- ngIf: reserve.hasAdditionalProductOrders -->
							</tbody>
						</table>
					</div>
					<!-- ngIf: !reserve.streamingProduct -->
					<div class="list_btn ng-scope" ng-if="!reserve.streamingProduct">
						<a class="btn btn_full" ng-click="fn.print()">프린트</a>
						<!-- ngIf: fn.smartTicket.exposable() -->
					</div>
					<!-- end ngIf: !reserve.streamingProduct -->

					<!-- [D] 온라인 관람 상품일 경우 노출 -->
					<!-- ngIf: reserve.streamingProduct -->
					<!-- //[D] 온라인 관람 상품일 경우 노출 -->
					<h5 class="mgt40 text_tit">예매내역</h5>
					<h6 class="text_tit">티켓 예매내역</h6>
					<div class="basic_tbl basic_tbl_v3">
						<table>
							<caption>
								<span class="blind">티켓 예매내역</span>
							</caption>
							<colgroup>
								<col style="width: 40px">
								<col style="width: 70px">
								<col>
								<col>
								<col>
								<col style="width: 80px">
								<col style="width: 60px">
								<col style="width: 90px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<!-- ngIf: reserve.isCancelable && hasCancelableTicket -->
										<span class="checkbox ng-scope" ng-if="reserve.isCancelable &amp;&amp; hasCancelableTicket" ng-class="{'disabled' : !reserve.isCancelable || hasPresentStateCodeReceive || hasEntranceStateCodeEntered || isIssueCancelSmartTicket, 'checked' : fn.ticket.isAllChecked()}" ng-click="fn.ticket.changeAll()">
											<input type="radio" id="reserve_num1" name="reserve_num">
										</span>
										<!-- end ngIf: reserve.isCancelable && hasCancelableTicket -->
									</th>
									<th scope="col">예매번호</th>
									<th scope="col">좌석등급</th>
									<th scope="col">권종</th>
									<th scope="col">좌석번호</th>
									<th scope="col">가격</th>
									<th scope="col">취소여부</th>
									<th scope="col">취소(가능)일</th>
								</tr>
							</thead>
							<tbody>
								<!-- ngRepeat: ticket in reserve.tickets -->
								<tr ng-repeat="ticket in reserve.tickets" ng-class="{'disabled' : !reserve.isCancelable}" class="ng-scope">
									<td>
										<span class="checkbox" ng-class="{'disabled' : !reserve.isCancelable || !ticket.isCancelable || isIssueCancelSmartTicket, 'checked' : ticket.isChecked}" ng-click="fn.ticket.change(ticket)">
											<input type="radio" id="reserve_num0" name="reserve_num">
										</span>
									</td>
									<td class="font_option number">
										<label for="reserve_num0" class="ng-binding"> 1468853619 </label>
									</td>
									<td class="ellipsis ng-binding">4층 일반석</td>
									<td class="ellipsis ng-binding">일반</td>
									<td class="ellipsis ng-binding">301블록 B열 6번</td>
									<td class="ng-binding">
										11,000원
										<!-- ngIf: ticket.markPriceExposureYn -->
									</td>
									<!-- ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<td class="color_point font_option ng-scope" ng-if="reserve.isCancelable &amp;&amp; ticket.isCancelable &amp;&amp; !isIssueCancelSmartTicket">취소가능</td>
									<!-- end ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<!-- ngIf: !ticket.isCancelable && !ticket.isCanceled  ||
                                    (!ticket.isCanceled && (hasPresentStateCodeReceive || hasEntranceStateCodeEntered || isReIssueTicket || isPaperIssueTicket || isIssueCancelSmartTicket)) -->
									<!-- ngIf: ticket.isCanceled -->
									<!-- ngIf: ticket.displayCancelDatetime -->
									<td class="number color_point font_option ng-binding ng-scope" ng-if="ticket.displayCancelDatetime">2024.07.30 14:30</td>
									<!-- end ngIf: ticket.displayCancelDatetime -->
								</tr>
								<!-- end ngRepeat: ticket in reserve.tickets -->
								<tr ng-repeat="ticket in reserve.tickets" ng-class="{'disabled' : !reserve.isCancelable}" class="ng-scope">
									<td>
										<span class="checkbox" ng-class="{'disabled' : !reserve.isCancelable || !ticket.isCancelable || isIssueCancelSmartTicket, 'checked' : ticket.isChecked}" ng-click="fn.ticket.change(ticket)">
											<input type="radio" id="reserve_num1" name="reserve_num">
										</span>
									</td>
									<td class="font_option number">
										<label for="reserve_num1" class="ng-binding"> 1468853619 </label>
									</td>
									<td class="ellipsis ng-binding">4층 일반석</td>
									<td class="ellipsis ng-binding">일반</td>
									<td class="ellipsis ng-binding">301블록 B열 7번</td>
									<td class="ng-binding">
										11,000원
										<!-- ngIf: ticket.markPriceExposureYn -->
									</td>
									<!-- ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<td class="color_point font_option ng-scope" ng-if="reserve.isCancelable &amp;&amp; ticket.isCancelable &amp;&amp; !isIssueCancelSmartTicket">취소가능</td>
									<!-- end ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<!-- ngIf: !ticket.isCancelable && !ticket.isCanceled  ||
                                    (!ticket.isCanceled && (hasPresentStateCodeReceive || hasEntranceStateCodeEntered || isReIssueTicket || isPaperIssueTicket || isIssueCancelSmartTicket)) -->
									<!-- ngIf: ticket.isCanceled -->
									<!-- ngIf: ticket.displayCancelDatetime -->
									<td class="number color_point font_option ng-binding ng-scope" ng-if="ticket.displayCancelDatetime">2024.07.30 14:30</td>
									<!-- end ngIf: ticket.displayCancelDatetime -->
								</tr>
								<!-- end ngRepeat: ticket in reserve.tickets -->
								<tr ng-repeat="ticket in reserve.tickets" ng-class="{'disabled' : !reserve.isCancelable}" class="ng-scope">
									<td>
										<span class="checkbox" ng-class="{'disabled' : !reserve.isCancelable || !ticket.isCancelable || isIssueCancelSmartTicket, 'checked' : ticket.isChecked}" ng-click="fn.ticket.change(ticket)">
											<input type="radio" id="reserve_num2" name="reserve_num">
										</span>
									</td>
									<td class="font_option number">
										<label for="reserve_num2" class="ng-binding"> 1468853619 </label>
									</td>
									<td class="ellipsis ng-binding">4층 일반석</td>
									<td class="ellipsis ng-binding">일반</td>
									<td class="ellipsis ng-binding">301블록 B열 8번</td>
									<td class="ng-binding">
										11,000원
										<!-- ngIf: ticket.markPriceExposureYn -->
									</td>
									<!-- ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<td class="color_point font_option ng-scope" ng-if="reserve.isCancelable &amp;&amp; ticket.isCancelable &amp;&amp; !isIssueCancelSmartTicket">취소가능</td>
									<!-- end ngIf: reserve.isCancelable && ticket.isCancelable && !isIssueCancelSmartTicket -->
									<!-- ngIf: !ticket.isCancelable && !ticket.isCanceled  ||
                                    (!ticket.isCanceled && (hasPresentStateCodeReceive || hasEntranceStateCodeEntered || isReIssueTicket || isPaperIssueTicket || isIssueCancelSmartTicket)) -->
									<!-- ngIf: ticket.isCanceled -->
									<!-- ngIf: ticket.displayCancelDatetime -->
									<td class="number color_point font_option ng-binding ng-scope" ng-if="ticket.displayCancelDatetime">2024.07.30 14:30</td>
									<!-- end ngIf: ticket.displayCancelDatetime -->
								</tr>
								<!-- end ngRepeat: ticket in reserve.tickets -->
							</tbody>
						</table>
					</div>


					<!-- ngIf: reserve.hasAdditionalProductOrders -->
					<!-- ngIf: reserve.hasAdditionalProductOrders -->

					<div class="list_btn">
						<!-- ngIf: reserve.isCancelable && !reserve.isCallReserve && (hasCancelableTicket || hasCancelableAddProduct) -->
						<a ng-if="reserve.isCancelable &amp;&amp; !reserve.isCallReserve &amp;&amp; (hasCancelableTicket || hasCancelableAddProduct)" class="btn btn_full ng-scope" ng-click="fn.cancel()">취소하기</a>
						<!-- end ngIf: reserve.isCancelable && !reserve.isCallReserve && (hasCancelableTicket || hasCancelableAddProduct) -->
						<!-- ngIf: reserve.isCallReserve -->
					</div>

					<!-- ngIf: reserve.displayOnlineConcert -->
					<!-- ngIf: reserve.displayOnlineConcert -->

					<!-- ngIf: reserve.hasAdvanceTickets -->
					<!-- ngIf: reserve.hasAdvanceTickets -->

					<!-- ngIf: reserve.hasTicketUserInfoList -->
					<!-- ngIf: reserve.hasTicketUserInfoList -->

					<!-- ngIf: reserve.surveyUse || reserve.hasSurveyAnswers -->
					<!-- ngIf: reserve.surveyUse || reserve.hasSurveyAnswers -->

					<div class="btn_txt_bx ng-hide" ng-show="reserve.surveyUse &amp;&amp; reserve.isSurveyAnswerModifiable">
						<a class="btn" ng-click="fn.survey.modify()">부가정보 수정</a>
					</div>

					<h5 class="mgt40 text_tit">결제정보</h5>
					<div class="basic_tbl_v4">
						<table>
							<caption>
								<span class="blind">결제 정보</span>
							</caption>
							<colgroup>
								<col style="width: 120px">
								<col>
								<col style="width: 140px">
								<col>
							</colgroup>
							<tfoot>
								<tr class="final final_option">
									<th scope="row">총 결제금액</th>
									<td colspan="3">
										<span class="color_point">
											<span class="number ng-binding">36,000</span>
											원
										</span>
									</td>
								</tr>
								<tr class="final final_option">
									<th scope="row">결제상세정보</th>
									<td colspan="3">
										<ul class="final_list">
											<!-- ngRepeat: payment in reserve.payment.details -->
											<li ng-repeat="payment in reserve.payment.details" class="ng-binding ng-scope">신용카드 간편결제 36,000원</li>
											<!-- end ngRepeat: payment in reserve.payment.details -->
											<!-- ngIf: reserve.pointUse.integratePointDiscountTypeCode == 'KTGIFT' -->
											<!-- ngIf: reserve.hasBenepiaPoint -->
										</ul>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr class="line">
									<th scope="row" class="lspacingm1">티켓금액</th>
									<td class="tr ng-binding">33,000원</td>
									<th scope="row" class="lspacingm1">배송료</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<tr>
									<th scope="row" class="lspacingm1">예매수수료</th>
									<td class="tr ng-binding">3,000원</td>
									<th scope="row" class="lspacingm1">휴대폰결제 수수료</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<tr>
									<th scope="row" class="lspacingm1">쿠폰 할인</th>
									<!-- ngIf: reserve.payment.hasCoupons -->
									<!-- ngIf: !reserve.payment.hasCoupons -->
									<td class="tr ng-scope" ng-if="!reserve.payment.hasCoupons">0원</td>
									<!-- end ngIf: !reserve.payment.hasCoupons -->
									<th scope="row" class="lspacingm1">부가상품</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<!-- ngIf: reserve.pointUse.integratePointDiscountTypeCode == 'SSG' -->
								<!-- ngIf: reserve.hasBenepiaPoint -->
							</tbody>
						</table>
					</div>

					<!-- ngIf: reserve.refund.hasRefunded -->
					<!-- ngIf: reserve.refund.hasRefunded -->

					<h5 class="mgt40 text_tit">취소 유의사항</h5>
					<div class="basic_tbl basic_tbl_v2">
						<table>
							<caption>
								<span class="blind">취소 마감시간 및 취소 수수료 표</span>
							</caption>
							<colgroup>
								<col style="width: 190px">
								<col style="width: 200px">
								<col>
								<col style="width: 175px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th colspan="3" scope="col">취소 수수료</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>취소 마감시간</td>
									<td colspan="3" class="color_point fbold tl end ng-binding">2024년 07월 30일 14:30</td>
								</tr>
								<!-- ngRepeat: commission in reserve.cancelCommissions -->
								<!-- ngIf: isCancelable() -->
								<tr ng-if="isCancelable()" ng-repeat="commission in reserve.cancelCommissions" class="ng-scope">
									<!-- ngIf: $first -->
									<td rowspan="2" class="vam ng-scope" ng-if="$first">
										취소 수수료
										<br>
										(취소 마감시간 내에 한함)
									</td>
									<!-- end ngIf: $first -->
									<td class="color_black tl ng-binding">예매당일</td>
									<!-- ngIf: commission.applyStartDate == commission.applyEndDate -->
									<td class="color_black tl ng-binding ng-scope" ng-if="commission.applyStartDate == commission.applyEndDate">2024.07.27</td>
									<!-- end ngIf: commission.applyStartDate == commission.applyEndDate -->
									<!-- ngIf: commission.applyStartDate != commission.applyEndDate -->
									<!-- ngIf: commission.commission == 0 -->
									<td class="color_point tl end ng-scope" ng-if="commission.commission == 0">
										<span class="color_point fbold">없음</span>
									</td>
									<!-- end ngIf: commission.commission == 0 -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'UNIT' -->
								</tr>
								<!-- end ngIf: isCancelable() -->
								<!-- end ngRepeat: commission in reserve.cancelCommissions -->
								<!-- ngIf: isCancelable() -->
								<tr ng-if="isCancelable()" ng-repeat="commission in reserve.cancelCommissions" class="ng-scope">
									<!-- ngIf: $first -->
									<td class="color_black tl ng-binding">예매익일~취소마감시간 전</td>
									<!-- ngIf: commission.applyStartDate == commission.applyEndDate -->
									<!-- ngIf: commission.applyStartDate != commission.applyEndDate -->
									<td class="color_black tl ng-binding ng-scope" ng-if="commission.applyStartDate != commission.applyEndDate">2024.07.28~2024.07.30</td>
									<!-- end ngIf: commission.applyStartDate != commission.applyEndDate -->
									<!-- ngIf: commission.commission == 0 -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<td class="color_black tl end ng-scope" ng-if="commission.commission != 0 &amp;&amp; commission.commissionUnitCode == 'TICKET_PRICE'">
										티켓 금액의
										<span class="color_point fbold number ng-binding">10%</span>
										부과
									</td>
									<!-- end ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'UNIT' -->
								</tr>
								<!-- end ngIf: isCancelable() -->
								<!-- end ngRepeat: commission in reserve.cancelCommissions -->
								<!-- ngIf: !isCancelable() -->
							</tbody>
						</table>

					</div>

					<h5 class="mgt40 text_tit">유의사항</h5>
					<div class="tbl_notice">
						<table>
							<caption>
								<span class="blind">유의사항</span>
							</caption>
							<colgroup>
								<col style="width: 122px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">수수료</th>
									<td>
										<ul>
											<li>취소마감시간이 공연전시 상품 및 스포츠 구단마다 상이하며, 마감시간이 지난 이후에는 취소가 불가능합니다.</li>
											<li>취소 진행 시 취소 마감시간 확인 후 취소해주시기 바랍니다.</li>
											<li>예매수수료는 예매일 당일 취소하실 경우만 환불되며, 그 이후 취소 시에는 환불되지 않습니다.</li>
											<li>행사상의 문제로 인해 환불을 받으실 경우 별도의 수수료를 제공하지 않으며, 환불 주체가 NHN LINK가 아닌 행사 주최사가 될 수 있습니다.</li>
											<li>신용카드로 결제한 건에 대해 취소하실 경우, 최초 결제와 동일한 카드로 예매시점에 따라 취소 수수료와 배송비 등을 재승인합니다. 따라서 무이자할부 혜택 등 기간 별 프로모션 혜택이 적용되지 않을 수 있습니다.</li>
											<li>배송준비중 혹은 배송이후 상태에서는 배송지 변경이 불가합니다.</li>
											<li>발송 받으신 티켓을 분실하셨거나 티켓이 훼손되었을 경우 취소 및 변경이 절대 불가하오니 이 점 유의하시기 바랍니다.</li>
											<li>
												이미 배송이 시작된 티켓의 경우는 온라인 및 콜센터에서 취소가 불가합니다. 반드시 취소마감 시간 이전에 티켓이 아래 주소로 반송되어야 합니다. 취소수수료는 도착일자 기준으로 부과됩니다.
												<br>
												- 주소 : 06043, 서울특별시 강남구 강남대로 586, 제이빌딩
												<br>
												- 받는사람: NHN LINK 환불담당자
												<br>
												- 연락처: 1588-7890
											</li>
											<li>티켓 반송시, 고객님의 예매번호와 연락처, 반송사유를 함께 보내주시면 빠른 처리에 도움이 됩니다. 또한 무통장 입금이나 계좌이체를 이용하셨을 경우 환불 받으실 계좌와 예금주를 적으셔서 티켓과 함께 등기우편으로 보내주시길 부탁 드립니다.</li>
										</ul>
									</td>
								</tr>
								<!-- ngIf: reserve.hasAdditionalProductOrders -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/memberInfo/changePassword.js"></script>
</body>
</html>