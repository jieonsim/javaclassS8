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
<body ng-controller="reservePrintCtrl" class="ng-scope">
	<div id="wrap_popup" style="width: 500px;">
		<div id="header">
			<h1>티켓예매내역</h1>
		</div>
		<div id="container" class="pop_reserve_history">
			<div class="block mgt0">
				<!-- ngIf: reserve.isBarcodeExposable && !reserve.hasEvidenceDenomination -->
				<div class="pointb_box ng-scope" ng-if="reserve.isBarcodeExposable &amp;&amp; !reserve.hasEvidenceDenomination" ng-init="barcode = reserve.barcode">
					<!-- ngIf: barcode.barcodeImagePath == null -->
					<!-- ngIf: reserve.homeTicketInfo != '' -->
					<p class="inner_txt ng-scope" ng-if="reserve.homeTicketInfo != ''">
						<span style="white-space: pre;" class="ng-binding">▼ 무인발권기 전용 바코드 ▼ (게이트 바로입장불가)</span>
					</p>
					<!-- end ngIf: reserve.homeTicketInfo != '' -->
					<!-- ngIf: barcode.barcodeImagePath != null -->
					<p class="barcode ng-scope" ng-if="barcode.barcodeImagePath != null">
						<img ng-src="//image.toast.com/aaaaab/ticketlink/TKL_10/R1468853619826.JPEG" alt="" width="300" height="60" src="//image.toast.com/aaaaab/ticketlink/TKL_10/R1468853619826.JPEG">
					</p>
					<!-- end ngIf: barcode.barcodeImagePath != null -->
				</div>
				<!-- end ngIf: reserve.isBarcodeExposable && !reserve.hasEvidenceDenomination -->
				<!-- ngIf: reserve.hasEvidenceDenomination -->

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
								<!-- ngIf: reserve.displayProductType === 'SPORTS_PRODUCT_NAME' -->
								<!-- ngIf: reserve.displayProductType === 'SPORTS_TEAM_MATCH' -->
								<td ng-if="reserve.displayProductType === 'SPORTS_TEAM_MATCH'" class="ng-binding ng-scope">
									[2024 신한 SOL Bank KBO 리그]
									<br>
									<!-- ngIf: reserve.gameTitle -->
									<!-- ngIf: reserve.teamMatchUseYn === 'Y' -->
									<span ng-if="reserve.teamMatchUseYn === 'Y'" class="ng-binding ng-scope"> SSG 랜더스 vs 롯데자이언츠 </span>
									<!-- end ngIf: reserve.teamMatchUseYn === 'Y' -->
								</td>
								<!-- end ngIf: reserve.displayProductType === 'SPORTS_TEAM_MATCH' -->
								<!-- ngIf: reserve.displayProductType === 'DEFAULT_PRODUCT_NAME' -->
							</tr>
							<tr>
								<th scope="row">예매자</th>
								<td class="ng-binding">심지언</td>
							</tr>
							<tr>
								<th scope="row">예매번호</th>
								<td class="ng-binding">1468853619 (총 3매)</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td class="ng-binding">인천 SSG 랜더스 필드</td>
							</tr>
							<tr>
								<th scope="row">일시</th>
								<td class="ng-binding">2024.07.30(화) 18:30</td>
							</tr>
							<tr>
								<th scope="row">좌석</th>
								<td>
									<!-- ngRepeat: seatName in reserve.seatNames -->
									<p ng-repeat="seatName in reserve.seatNames" class="ng-binding ng-scope">4층 일반석 301블록 B열 6번</p>
									<!-- end ngRepeat: seatName in reserve.seatNames -->
									<p ng-repeat="seatName in reserve.seatNames" class="ng-binding ng-scope">4층 일반석 301블록 B열 7번</p>
									<!-- end ngRepeat: seatName in reserve.seatNames -->
									<p ng-repeat="seatName in reserve.seatNames" class="ng-binding ng-scope">4층 일반석 301블록 B열 8번</p>
									<!-- end ngRepeat: seatName in reserve.seatNames -->
								</td>
							</tr>
							<!-- ngIf: reserve.additionalProductOrders.length > 0 -->
							<!-- ngIf: reserve.entranceGateNames.length>0 -->
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
								<td class="ng-binding">2024.07.27</td>
							</tr>
							<tr>
								<th scope="row">총결제금액</th>
								<td>
									<span class="color_point fbold ng-binding">36,000</span>
								</td>
							</tr>
							<tr>
								<th scope="row">결제정보</th>
								<!-- ngIf: reserve.payment.isWaitingForDeposit -->
								<!-- ngIf: !reserve.payment.isWaitingForDeposit -->
								<td ng-if="!reserve.payment.isWaitingForDeposit" class="print_receipt ng-scope">
									<!-- ngRepeat: payment in reserve.payment.details -->
									<p ng-repeat="payment in reserve.payment.details" class="ng-binding ng-scope">신용카드 간편결제 36,000</p>
									<!-- end ngRepeat: payment in reserve.payment.details -->
								</td>
								<!-- end ngIf: !reserve.payment.isWaitingForDeposit -->
							</tr>
						</tbody>
					</table>
					<span class="reserve_cancel ng-hide" style="top: 0; right: 0" ng-show="reserve.reserveStateCode.name == 'ALL_CANCEL'">예매취소</span>
					<span class="reserve_hold ng-hide" ng-show="reserve.payment.isWaitingForDeposit">예매대기</span>
				</div>
			</div>
			<div class="block">
				<h2>안내 및 주의사항</h2>
				<br>
				<span style="font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 9pt;">
					<b>예매 안내</b>
					<br>
					- 예매마감시간 : 경기 당일 경기 시작 1시간 후까지 가능
					<br>
					(경기 당일 경기 시작 4시간 전 ~ 경기 시작 1시간 후까지 예매분은 취소 불가)
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
			<a class="btn btn_full" ng-click="print()">프린트</a>
			<a class="btn btn_blank" ng-click="close()">닫기</a>
		</div>
	</div>
	<script>
		//<![CDATA[
		angular
				.module('reservePrintApp', [])
				.controller(
						'reservePrintCtrl',
						function($scope) {
							$scope.reserve = {
								"reserveNo" : 1468853619,
								"displayReserveNo" : "1468853619",
								"productId" : 48921,
								"scheduleId" : 1808249308,
								"memberNo" : 14187984,
								"memberName" : "심지언",
								"reserveCount" : 3,
								"cancelCount" : 0,
								"reserveDatetime" : 1722044308000,
								"cancelCloseDate" : 1722317400000,
								"issueFlag" : "N",
								"reserveChannelCode" : "TKL_WEB",
								"reserveStateCode" : {
									"nameKo" : "예매완료",
									"nameGrobale" : "Ticket confirmation",
									"name" : "COMPLETE"
								},
								"nonDepositYn" : "N",
								"issueStateCode" : "NOT",
								"status" : "예매완료",
								"placeName" : "인천 SSG 랜더스 필드",
								"hallName" : "인천 SSG 랜더스 필드",
								"productStartDate" : 1711119600000,
								"productEndDate" : 1732892400000,
								"startDatetime" : 1722331800000,
								"playDate" : "2024.07.30(화) 18:30",
								"playDateEng" : "2024.07.30 18:30",
								"productClassAndType" : {
									"productClassCode" : "SPORTS_SEAT",
									"productTypeCode" : "LEAGUE_SINGLE_HOME",
									"isTicket" : false,
									"isSeasonTicket" : false,
									"isAdvanceTicket" : false,
									"hasPlan" : true,
									"isSports" : true,
									"isExhibition" : false,
									"isConcert" : false,
									"hasPeriod" : false
								},
								"productName" : "[2024 신한 SOL Bank KBO 리그] SSG 랜더스 vs 롯데자이언츠",
								"productNameEng" : " SSG Landers vs LOTTE Giants",
								"displayProductName" : "2024 SSG 랜더스 정규리그",
								"displayProductNameEng" : "",
								"seatNames" : [ "4층 일반석 301블록 B열 6번",
										"4층 일반석 301블록 B열 7번",
										"4층 일반석 301블록 B열 8번" ],
								"entranceGateNames" : [],
								"provideMySeatView" : true,
								"benepiaPoint" : {
									"pointUsageAmount" : 0
								},
								"tickets" : [
										{
											"reserveNo" : 1468853619,
											"reserveDetailNo" : 1,
											"productGradeName" : "4층 일반석",
											"productDenominationName" : "일반",
											"productGradeId" : 95715,
											"seatName" : "301블록 B열 6번",
											"price" : 11000,
											"markPrice" : 11000,
											"cancelCloseDatetime" : 1722317400000,
											"smartTicketState" : "NOT_EXIST",
											"ticketNo" : 1125557748,
											"hasAdvanceTicketAndNotCancellable" : false,
											"requiredCancelable" : true,
											"blockId" : 116787,
											"blockName" : "301블록",
											"rowNo" : "B열",
											"seatNo" : "6번",
											"groupId" : 0,
											"externalServiceType" : "TKL",
											"hasShippingInfo" : false,
											"markPriceExposureYn" : false,
											"onlineViewCodeRequired" : false,
											"issueStateCode" : "NOT",
											"reserveIssued" : false,
											"shipped" : false,
											"canceled" : false,
											"clipService" : false,
											"displayCancelDatetime" : "2024.07.30 14:30",
											"isCanceled" : false,
											"isCancelable" : true
										},
										{
											"reserveNo" : 1468853619,
											"reserveDetailNo" : 2,
											"productGradeName" : "4층 일반석",
											"productDenominationName" : "일반",
											"productGradeId" : 95715,
											"seatName" : "301블록 B열 7번",
											"price" : 11000,
											"markPrice" : 11000,
											"cancelCloseDatetime" : 1722317400000,
											"smartTicketState" : "NOT_EXIST",
											"ticketNo" : 1125557749,
											"hasAdvanceTicketAndNotCancellable" : false,
											"requiredCancelable" : true,
											"blockId" : 116787,
											"blockName" : "301블록",
											"rowNo" : "B열",
											"seatNo" : "7번",
											"groupId" : 0,
											"externalServiceType" : "TKL",
											"hasShippingInfo" : false,
											"markPriceExposureYn" : false,
											"onlineViewCodeRequired" : false,
											"issueStateCode" : "NOT",
											"reserveIssued" : false,
											"shipped" : false,
											"canceled" : false,
											"clipService" : false,
											"displayCancelDatetime" : "2024.07.30 14:30",
											"isCanceled" : false,
											"isCancelable" : true
										},
										{
											"reserveNo" : 1468853619,
											"reserveDetailNo" : 3,
											"productGradeName" : "4층 일반석",
											"productDenominationName" : "일반",
											"productGradeId" : 95715,
											"seatName" : "301블록 B열 8번",
											"price" : 11000,
											"markPrice" : 11000,
											"cancelCloseDatetime" : 1722317400000,
											"smartTicketState" : "NOT_EXIST",
											"ticketNo" : 1125557750,
											"hasAdvanceTicketAndNotCancellable" : false,
											"requiredCancelable" : true,
											"blockId" : 116787,
											"blockName" : "301블록",
											"rowNo" : "B열",
											"seatNo" : "8번",
											"groupId" : 0,
											"externalServiceType" : "TKL",
											"hasShippingInfo" : false,
											"markPriceExposureYn" : false,
											"onlineViewCodeRequired" : false,
											"issueStateCode" : "NOT",
											"reserveIssued" : false,
											"shipped" : false,
											"canceled" : false,
											"clipService" : false,
											"displayCancelDatetime" : "2024.07.30 14:30",
											"isCanceled" : false,
											"isCancelable" : true
										} ],
								"payment" : {
									"totalPrice" : 36000,
									"ticketPrice" : 33000,
									"deliveryPrice" : 0,
									"commission" : 3000,
									"cellPhoneCommission" : 0,
									"discountPrice" : 0,
									"additionalProductPrice" : 0,
									"coupons" : [],
									"certifyList" : [],
									"details" : [ {
										"cardSettleInfo" : {
											"cardCompanyCode" : "CCDI",
											"cardCompanyName" : "현대카드",
											"cardNo" : "523930******3007"
										},
										"cellphoneSettleInfo" : {},
										"realtimeAccountTransferSettleInfo" : {},
										"nonBankbookSettleInfo" : {},
										"refundInfo" : {},
										"paymentDetailId" : 55987674,
										"paymentTradeNo" : "202407273992328398",
										"orderNo" : "202407273088659771",
										"sellerOrderReferenceKey" : "1468853619",
										"paymentMethodCode" : "31",
										"paymentMethodName" : "신용카드 간편결제",
										"paymentMethodNameEng" : "Credit card",
										"cardCompanyName" : "현대카드",
										"cardCompanyNameEng" : "Hyundai Card",
										"paymentCompanyName" : "",
										"paymentAmt" : 36000,
										"tradeYmdt" : "20240727103828",
										"pgAdmissionNo" : "24459073666297",
										"pgAdmissionYmdt" : "20240727103828",
										"easyPaymentYn" : "Y",
										"paymentCompletionYn" : "Y",
										"registerMemberNo" : 14187984,
										"registerDatetime" : 1722044308000,
										"modifyMemberNo" : 14187984,
										"modifyDatetime" : 1722044308000,
										"paymentServiceCode" : "PAYCO",
										"paymentTradeCode" : "ONLINE",
										"paymentDeviceCode" : "",
										"paymentDeviceCancelYn" : "N",
										"paymentServiceName" : "페이코",
										"externalPaymentMethodCode" : "CARD",
										"externalPaymentMethodName" : "신용카드",
										"actionId" : "20240727103827590"
									} ],
									"waitingForDeposit" : false,
									"isWaitingForDeposit" : false,
									"hasCoupons" : false,
									"hasDiscount" : false,
									"hasCertifyList" : false,
									"isNonBanking" : false,
									"isCash" : false,
									"isCreditCard" : true
								},
								"cancelCommissions" : [
										{
											"productId" : 48921,
											"commissionClassCode" : "CANCEL_COMMISSION_TYPE_CODE",
											"commissionItemCode" : "SPORTS_RESERVE_DAY",
											"commissionUnitCode" : "TICKET_PRICE",
											"commissionUnitNotation" : "%",
											"commission" : 0,
											"commissionLimit" : 0,
											"cancelCommissionTypeName" : "예매당일",
											"cancelCommissionTypeNameGlobal" : "reservation day",
											"commissionUnitNotationGlobal" : "%",
											"applyStartDate" : 1722006000000,
											"applyEndDate" : 1722006000000,
											"allowedLimitItem" : false,
											"sports" : false,
											"priority" : 1
										},
										{
											"productId" : 48921,
											"commissionClassCode" : "CANCEL_COMMISSION_TYPE_CODE",
											"commissionItemCode" : "SPORTS_AFTER_RESERVE",
											"commissionUnitCode" : "TICKET_PRICE",
											"commissionUnitNotation" : "%",
											"commission" : 10,
											"commissionUnitCodeLimit" : "UNIT",
											"commissionUnitNotationLimit" : "원",
											"commissionLimit" : 0,
											"cancelCommissionTypeName" : "예매익일~취소마감시간 전",
											"cancelCommissionTypeNameGlobal" : "예매익일~취소마감시간 전(EN)",
											"commissionUnitNotationGlobal" : "%",
											"applyStartDate" : 1722092400000,
											"applyEndDate" : 1722265200000,
											"allowedLimitItem" : false,
											"sports" : false,
											"priority" : 2
										} ],
								"shippingInfo" : {
									"deliveryMethodCode" : "SITE",
									"issued" : false,
									"trackingDelivery" : false,
									"deliveryConsignYn" : "N",
									"deliveryMethodName" : "현장수령",
									"hasShippingInfo" : false,
									"isShipped" : false,
									"isAddressModifiable" : false,
									"isPreparing" : false,
									"isAfterComplete" : false
								},
								"additionalProductOrders" : [],
								"game" : {
									"homeTeamName" : "SSG 랜더스",
									"homeTeamNameEng" : "SSG Landers",
									"homeTeamLogoImagePath" : "http://image.toast.com/aaaaab/ticketlink/TKL_7/nssg(em).png",
									"awayTeamName" : "롯데자이언츠",
									"awayTeamNameEng" : "",
									"awayTeamLogoImagePath" : "http://image.toast.com/aaaaab/ticketlink/TKL_1/lotte_2023.png",
									"round" : 1
								},
								"refund" : {
									"totalPrice" : 0,
									"commission" : 0,
									"cancelCommission" : 0,
									"discountPrice" : 0,
									"ticketPrice" : 0,
									"additionalProductPrice" : 0,
									"deliveryPrice" : 0,
									"internationalDeliveryFee" : 0,
									"cellPhoneCommission" : 0,
									"remitCommission" : 0,
									"totalRefundPrice" : 0,
									"benepiaPointRefundPrice" : 0,
									"hasRefunded" : false
								},
								"ticketUserInfoList" : [],
								"surveyAnswers" : [],
								"cashReceiptEnableByProduct" : true,
								"barcode" : {
									"reserveBarcodeId" : 9613105,
									"reserveNo" : 1468853619,
									"barcodeImageId" : 15150509,
									"barcodeImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_10/R1468853619826.JPEG",
									"issueAuthorityNo" : "826"
								},
								"reserveForSmartTicket" : {
									"productId" : 48921,
									"scheduleId" : 1808249308,
									"smartTicketImageUrl" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
									"smartTicketDetailImageUrls" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
									"reserveNo" : 1468853619,
									"smartTicketList" : [
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 1,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 6번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557748,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 6번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 2,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 7번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557749,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 7번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 3,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 8번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557750,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 8번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											} ],
									"ticketScheduleGameInfos" : [ {
										"homeTeam" : "SSG",
										"matchTeam" : "롯데",
										"teamMatchUse" : true,
										"matchInfo" : "SSG vs 롯데",
										"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
									} ],
									"smartTicketIssuableState" : "NOT_YET_TYPE_FOUR_HOURS",
									"reserveCount" : 3,
									"productName" : "2024 SSG 랜더스 정규리그",
									"reserveMemberNo" : 14187984,
									"reserveMemberName" : "심지언",
									"reserveCellPhoneNo" : "01085495209",
									"productClassCode" : "SPORTS_SEAT",
									"productTypeCode" : "LEAGUE_SINGLE_HOME",
									"reserveStateCode" : "COMPLETE",
									"productDate" : 1722265200000,
									"productTime" : 1722331800000,
									"productStartDate" : 1711119600000,
									"productEndDate" : 1732892400000,
									"hallName" : "인천 SSG 랜더스 필드",
									"hallNameBySchedule" : "인천 SSG 랜더스 필드",
									"deliveryMethodCode" : "SITE",
									"issueFlag" : "N",
									"smartTicketScheduleRestriction" : false,
									"productNameForSmartTicketListView" : "SSG vs 롯데",
									"productDateForSmartTicketListView" : "2024.07.30(화) 18:30",
									"productPlaceForSmartTicketListView" : "인천 SSG 랜더스 필드",
									"smartTicketCount" : 0,
									"serviceType" : "TKL",
									"smartTicketPresentUseYn" : true,
									"smartTicketSamsungWalletLinkYn" : false,
									"smartTicketReserveNoExposureYn" : false,
									"smartTicketMemberNameExposureYn" : false,
									"smartTicketReserveCellPhoneNoExposureYn" : false,
									"additionalProductInfoExposure" : false,
									"reserveMemberDataExposure" : false,
									"present" : false,
									"displayDate" : "2024.07.30(화) 18:30",
									"issued" : false,
									"smartTicketsApplyImagePath" : [
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 1,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 6번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557748,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 6번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 2,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 7번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557749,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 7번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 3,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 8번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557750,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 8번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											} ],
									"smartTicketListNonNull" : [
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 1,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 6번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557748,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 6번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 2,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 7번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557749,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 7번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											},
											{
												"productId" : 48921,
												"reserveNo" : 1468853619,
												"scheduleId" : 1808249308,
												"reserveDetailNo" : 3,
												"cancelYn" : "N",
												"markPrice" : 11000,
												"seatAttributeInfo" : "301블록 B열 8번",
												"entranceGateName" : "",
												"planGateCodeYn" : "N",
												"productDenominationName" : "일반",
												"productGradeName" : "4층 일반석",
												"productName" : "2024 SSG 랜더스 정규리그",
												"hallName" : "인천 SSG 랜더스 필드",
												"productDate" : 1722331800000,
												"ticketNo" : 1125557750,
												"issueStateCode" : "NOT",
												"printCount" : 0,
												"smartTicketImagePath" : "//image.toast.com/aaaaab/ticketlink/TKL_9/smt_ssg(1).png",
												"smartTicketDetailImagePaths" : [ "//image.toast.com/aaaaab/ticketlink/TKL_9/smt(640x378).png" ],
												"smartTicketStateCode" : "NOT_EXIST",
												"ticketScheduleGameInfos" : [ {
													"homeTeam" : "SSG",
													"matchTeam" : "롯데",
													"teamMatchUse" : true,
													"matchInfo" : "SSG vs 롯데",
													"matchInfoForSmartTicketNotify" : "SSG vs 롯데"
												} ],
												"displayDate" : "2024.07.30(화) 18:30",
												"smartTicketBlackListSchedule" : false,
												"smartTicketBarcodeEntrance" : true,
												"smartTicketHandEntrance" : false,
												"smartTicketAwayUseYn" : false,
												"productNameForSmartTicketDetailView" : "SSG vs 롯데",
												"productDateForSmartTicketDetailView" : "2024.07.30(화) 18:30",
												"productPlaceForSmartTicketDetailView" : "인천 SSG 랜더스 필드",
												"healthQuestionnaireNotifyYn" : false,
												"healthQuestionnaireCompleteYn" : false,
												"healthQuestionnaireUrl" : "/health-questionnaire/view?step=3&processSmartTicket=true&reserveNo=P6Cq%2BNkHNw6lxoThCKV2AA%3D%3D&writePage=true",
												"faceEntrancePossibleYn" : false,
												"faceEntranceUseYn" : false,
												"faceEntranceSeatGradeUseYn" : false,
												"hasFaceEntranceTicket" : false,
												"samsungWalletLinkYn" : false,
												"faceMemberStatus" : "NONE",
												"mobileTicket" : false,
												"reIssueTicket" : false,
												"paperIssueTicket" : false,
												"canceled" : false,
												"presentedTicket" : false,
												"smartTicketStateCodeByPresentStateCodeType" : "NONE",
												"smartTicketStateCodeWhenEntranceUseProductIsTrue" : "NOT_EXIST",
												"entered" : false,
												"matchInfoOrProductName" : "SSG vs 롯데",
												"productDateToFormatting" : "2024.07.30(화) 18:30",
												"realTicket" : false,
												"presentReceive" : false,
												"presentSend" : false,
												"barcodeExposable" : false,
												"presentIdAsDefault" : 0,
												"seatAttributeInfoAsDefault" : "301블록 B열 8번",
												"paperIssueTicketAndNotDelivery" : false,
												"firstPaperIssueTicket" : false,
												"smartTicketStateCodeNotFirstPaperIssueTicketAndNotEntered" : "POSSIBLE"
											} ],
									"matchInfoOrProductName" : "SSG vs 롯데",
									"productDateToFormatting" : "2024.07.30(화) 00:00",
									"smartIssueable" : false,
									"smartTicketUseable" : true,
									"smartTicketUnUseable" : false,
									"notYetIssuAble" : true,
									"smartTicketIssuableStateDescriptionHtml" : "관람일 당일 4시간 전부터 발권 가능",
									"isExposable" : false
								},
								"advanceTickets" : [],
								"channelCode" : "TKL_WEB",
								"cashReceiptIssueable" : false,
								"displayPlaceName" : "인천 SSG 랜더스 필드",
								"displayPlaceNameEng" : "",
								"displayDate" : "2024.07.30(화) 18:30",
								"teamMatchUseYn" : "Y",
								"leagueName" : "2024 신한 SOL Bank KBO 리그",
								"leagueNameEng" : "",
								"displayProductType" : "SPORTS_TEAM_MATCH",
								"externalServiceType" : "TKL",
								"homeTicketInfo" : "▼ 무인발권기 전용 바코드 ▼\n    (게이트 바로입장불가)",
								"displayOnlineConcert" : false,
								"streamingProduct" : false,
								"paymentServiceCode" : "PAYCO",
								"faceRegisteredYn" : false,
								"faceEntranceScheduleYn" : false,
								"samsungWalletMemberAgreeYn" : "N",
								"requiredCancelable" : true,
								"hasLotteryWinner" : false,
								"additionalProductStateType" : {
									"nameKo" : "",
									"nameGrobale" : "",
									"name" : ""
								},
								"reserveChannelMypageDisplayName" : "PC웹",
								"surveyUse" : false,
								"partiallyCancellable" : true,
								"site" : false,
								"barcodeExposable" : true,
								"hasCanceledTicket" : false,
								"hasEvidenceDenomination" : false,
								"isBarcodeExposable" : true,
								"isPartiallyCancellable" : true,
								"hasAdvanceTicketAndNotCancellable" : false,
								"isCallReserve" : false,
								"hasAdditionalProductOrders" : false,
								"hasAdvanceTickets" : false,
								"hasTicketUserInfoList" : false,
								"hasSurveyAnswers" : false,
								"hasExposureQuestion" : false,
								"hasReceipt" : false,
								"hasRefund" : false,
								"isInternationalAddressModifiable" : false,
								"isCancelable" : true,
								"isSeasonTicket" : false,
								"isAdvanceTicket" : false,
								"isSports" : true,
								"hasBenepiaPoint" : false,
								"isConcertExhibition" : false,
								"isSurveyAnswerModifiable" : false,
								"isAddressModifiable" : false
							};
							$scope.print = function() {
								window.print();
							}
							$scope.close = function() {
								window.close();
							}
						}).filter('trust', [ '$sce', function($sce) {
					return function(value, type) {
						return $sce.trustAs(type || 'html', value);
					}
				} ]);
		//]]>
	</script>
</body>
</html>