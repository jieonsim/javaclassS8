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
				<div class="help_rcont ng-scope" ng-controller="reserveCancelDetailCtrl">
					<h3 class="blind">예매관리</h3>
					<div class="h3_line">
						<h4>취소상세</h4>
					</div>
					<p class="guide_txt">취소 및 환불 금액과 수수료를 확인하신 후, 취소를 진행해주세요.</p>

					<h5 class="text_tit">취소내역</h5>
					<div class="basic_tbl_v4">
						<table>
							<caption>
								<span class="blind">티켓 취소내역</span>
							</caption>
							<colgroup>
								<col style="width: 150px">
								<col>
								<col style="width: 180px">
								<col>
							</colgroup>
							<tbody>
								<!-- ngRepeat: cancelTicketInfo in detail.cancelTicketInfos -->
								<tr ng-class="{'line': $first}" ng-repeat="cancelTicketInfo in detail.cancelTicketInfos" class="ng-scope line">
									<!-- ngIf: $first -->
									<th scope="row" rowspan="1" ng-if="$first" class="ng-scope">티켓</th>
									<!-- end ngIf: $first -->
									<td colspan="3" class="ng-binding">4층 일반석 3매</td>
								</tr>
								<!-- end ngRepeat: cancelTicketInfo in detail.cancelTicketInfos -->
								<!-- ngRepeat: cancelAdditionalProductOrderInfo in detail.cancelAdditionalProductOrderInfos -->
								<tr>
									<th scope="row">총 결제금액</th>
									<td class="tr ng-binding">36,000원</td>
									<th scope="row">부가상품</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<tr>
									<th scope="row">티켓금액</th>
									<td class="tr ng-binding">33,000원</td>
									<th scope="row">배송비</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<tr>
									<th scope="row">수수료</th>
									<td class="tr ng-binding">3,000원</td>
									<th scope="row">휴대폰 결제 수수료</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<tr>
									<th scope="row">취소수수료</th>
									<td class="tr ng-binding">0원</td>
									<th scope="row">송금수수료</th>
									<td class="tr ng-binding">0원</td>
								</tr>
								<!-- ngIf: detail.benepiaPointRefundAmount !== 0 -->
							</tbody>
							<tfoot>
								<tr class="line">
									<th scope="row" class="bgnone">총 환불금액</th>
									<td colspan="3">
										<span class="color_point ng-binding">36,000</span>
										원
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<div class="list_btn">
						<a class="btn btn_full" ng-click="cancel()">취소하기</a>
					</div>

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
								<!-- ngRepeat: commission in detail.cancelCommissions -->
								<tr ng-repeat="commission in detail.cancelCommissions" class="ng-scope">
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
									<td class="color_point tl end ng-scope" ng-if="commission.commission == 0">없음</td>
									<!-- end ngIf: commission.commission == 0 -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'UNIT' -->
								</tr>
								<!-- end ngRepeat: commission in detail.cancelCommissions -->
								<tr ng-repeat="commission in detail.cancelCommissions" class="ng-scope">
									<!-- ngIf: $first -->
									<td class="color_black tl ng-binding">예매익일~취소마감시간 전</td>
									<!-- ngIf: commission.applyStartDate == commission.applyEndDate -->
									<!-- ngIf: commission.applyStartDate != commission.applyEndDate -->
									<td class="color_black tl ng-binding ng-scope" ng-if="commission.applyStartDate != commission.applyEndDate">2024.07.28~2024.07.30</td>
									<!-- end ngIf: commission.applyStartDate != commission.applyEndDate -->
									<!-- ngIf: commission.commission == 0 -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<td class="color_black tl end ng-scope" ng-if="commission.commission != 0 &amp;&amp; commission.commissionUnitCode == 'TICKET_PRICE'">
										티켓 금액의 <strong class="color_point ng-binding">10%</strong>
									</td>
									<!-- end ngIf: commission.commission != 0 && commission.commissionUnitCode == 'TICKET_PRICE' -->
									<!-- ngIf: commission.commission != 0 && commission.commissionUnitCode == 'UNIT' -->
								</tr>
								<!-- end ngRepeat: commission in detail.cancelCommissions -->
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
								<!-- ngIf: detail.cancelAdditionalProductOrderInfos.length > 0 -->
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