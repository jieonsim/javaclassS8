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
				<li class="step4 on">
					<span class="ng-binding ng-scope">예매확인</span>
				</li>
				<li class="step5">
					<span class="ng-binding ng-scope">결제</span>
				</li>
			</ul>
			<h2 class="blind">예매확인</h2>
		</div>
		<div id="container" class="reserve_cnt ng-scope" style="width: 990px">
			<div class="reserve_content">
				<div class="reserve_left" id="reserveMain">
					<div class="reserve_step3 mgt0">
						<div class="title_box">
							<h4 class="title title_txt">수령방법</h4>
						</div>
						<div class="white_box choice_delivery">
							<table class="table2">
								<caption>수령방법</caption>
								<colgroup>
									<col style="width: 93px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th fbold">티켓</th>
										<!-- ngIf: !reserve.isOnlineConcert && !reserve.isStreaming -->
										<td ng-if="!reserve.isOnlineConcert &amp;&amp; !reserve.isStreaming" class="ng-scope">
											<div class="radio_group">
												<!-- ngRepeat: delivery in deliveryList -->
												<span ng-repeat="delivery in deliveryList" class="ng-scope">
													<span class="radio_box_type checked" ng-class="{checked: reserve.deliveryMethodCode == delivery.deliveryMethodCode}" ng-click="fn.delivery.changeMethod(delivery)">
														<input type="radio" name="d_method" id="d_method_0" ng-value="delivery.deliveryMethodCode" ng-model="reserve.deliveryMethodCode" class="ng-pristine ng-untouched ng-valid ng-not-empty" value="SITE">
														<label for="d_method_0" ng-style="{'cursor':isDeliverySingle?'default':''}" class="ng-binding" style="cursor: default;">
															현장수령
															<!-- ngIf: delivery.deliveryMethodCode == 'DELIVERY' -->
														</label>
													</span>
												</span>
												<!-- end ngRepeat: delivery in deliveryList -->
											</div>
										</td>
										<!-- end ngIf: !reserve.isOnlineConcert && !reserve.isStreaming -->
										<!-- ngIf: reserve.isOnlineConcert -->
										<!-- ngIf: reserve.isStreaming -->
									</tr>

								</tbody>
							</table>
						</div>

						<!-- ngIf: reserve.additionalProductOrders != null -->

					</div>

					<div class="notice_box">
						<!-- 티켓이 현장수령인 경우-->
						<!-- ngIf: !reserve.isOnlineConcert && !reserve.isStreaming && reserve.deliveryMethodCode == 'SITE' -->
						<ul class="notice ng-scope" ng-if="!reserve.isOnlineConcert &amp;&amp; !reserve.isStreaming &amp;&amp; reserve.deliveryMethodCode == 'SITE'">
							<!-- FIXME: For Coupang -->
							<!--
                        <li ng-if="reserve.isCoupang && (!hasAdditionalProduct || reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY')">
                                * 스마트티켓 발권은 경기 당일 지원됩니다. 스마트티켓을 발권 받지 않으신 경우, 현장에서 본인확인 후 지류티켓을 수령하실 수 있습니다.
                        </li>
                        -->
							<!-- ngIf: !reserve.isCoupang && (!hasAdditionalProduct || reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY') -->
							<li ng-if="!reserve.isCoupang &amp;&amp; (!hasAdditionalProduct || reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY')" class="ng-scope">
								<!-- ngIf: isGangwonReceed -->
								<!-- ngIf: !isGangwonReceed -->
								<span ng-if="!isGangwonReceed" class="ng-scope"> * 티켓은 관람일 당일 현장에서 예매번호 및 본인 확인 후 수령할 수 있습니다. </span>
								<!-- end ngIf: !isGangwonReceed -->
							</li>
							<!-- end ngIf: !reserve.isCoupang && (!hasAdditionalProduct || reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY') -->
							<!-- ngIf: hasAdditionalProduct && reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY' -->
							<!-- ngIf: hasAdditionalProduct && reserve.additionalProductDelivery.deliveryMethodCode == 'SITE' -->
						</ul>
						<!-- end ngIf: !reserve.isOnlineConcert && !reserve.isStreaming && reserve.deliveryMethodCode == 'SITE' -->
						<!-- 티켓이 일반배송인 경우-->
						<!-- ngIf: !reserve.isOnlineConcert && !reserve.isStreaming && reserve.deliveryMethodCode == 'DELIVERY' -->
						<!-- 티켓수령방법 선택은 없고 부가상품이 일반배송인경우-->
						<!-- FIXME: For Coupang -->
						<!-- ngIf: !reserve.isCoupang && (reserve.isOnlineConcert || reserve.isStreaming) && hasAdditionalProduct && reserve.additionalProductDelivery.deliveryMethodCode == 'DELIVERY' -->
					</div>

					<div class="reserve_step3">
						<div class="title_box">
							<h4 class="title title_txt">주문자 정보</h4>
						</div>
						<div class="white_box">
							<table class="table2 table2_v2">
								<caption>주문자 정보</caption>
								<colgroup>
									<col style="width: 86px;">
									<col>
									<col style="width: 100px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th fbold">
											이름
											<span class="color_point">
												*
												<span class="blind">필수입력란</span>
											</span>
										</th>
										<!-- ngIf: reserve.memberName -->
										<td ng-if="reserve.memberName" class="ng-binding ng-scope">심지언</td>
										<!-- end ngIf: reserve.memberName -->
										<!-- ngIf: !reserve.memberName -->
										<th scope="row" class="th fbold">
											휴대폰 번호
											<span class="color_point">
												*
												<span class="blind">필수입력란</span>
											</span>
										</th>
										<td>
											<div class="input_block">
												<input type="text" class="input ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength" style="width: 180px" maxlength="11" title="휴대폰 번호" number-text-box="" ng-model="reserve.reserveCellPhoneNo">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th fbold">
											이메일
											<!-- ngIf: reserve.emailNeedYn == 'Y' -->
										</th>
										<td colspan="3">
											<div class="input_block">
												<input type="text" name="reserveEmail" class="input ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 517px" title="이메일" ng-model="reserve.reserveEmail">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- ngIf: reserve.additionalProductOrders != null -->
					<div class="reserve_step3 customer_check">
						<div class="title_box">
							<h4 class="title title_txt">예매자 확인</h4>
						</div>
						<ul class="input_block_lst">
							<li>
							<!-- 체크박스 시 class="checkbox checked"로 처리 -->
								<span class="checkbox" ng-init="agreeTerm1 = false" ng-class="{'checked' : agreeTerm1}" ng-click="agreeTerm1 = !agreeTerm1">
									<input type="checkbox" id="agree_phone" name="agree_phone">
								</span>
								<label for="agree_phone">
									주문자 확인 및 예매처리를 위해 휴대폰번호, 이메일을 수집하며,
									<br>
									이용목적 달성 이후 파기합니다.
								</label>
							</li>
							<li ng-show="!reserve.isCoupang">
								<span class="checkbox" ng-class="{checked : confirm2}" ng-click="confirm2 = !confirm2">
									<input type="checkbox" id="reserve_agree2" name="reserve_agree2" ng-value="confirm2" value="false">
								</span>
								<label for="reserve_agree2">개인정보 제 3자 제공에 동의합니다. (고객응대 및 관람정보안내 등을 위함)</label>
								<a href="#" class="btn_link confirm-open" ng-init="common.showConfirmFlag = false" ng-click="common.showConfirmFlag = !common.showConfirmFlag">[상세보기]</a>
							</li>
							<li ng-show="reserve.isKboProduct">
								<span class="checkbox " ng-class="{checked : confirm3}" ng-click="confirm3 = !confirm3">
									<input type="checkbox" id="reserve_agree3" name="reserve_agree3" ng-value="confirm3" value="false">
								</span>
								<label for="reserve_agree3">KBO리그 SAFE캠페인에 동의합니다.</label>
								<a href="#" class="btn_link confirm-open2" ng-init="common.showKboConfirmFlag = false" ng-click="common.showKboConfirmFlag = !common.showKboConfirmFlag">[상세보기]</a>
							</li>

							<!-- ngRepeat: term in reserve.productReserveTermsList -->
							<!-- ngIf: term.isHasTerm -->
							<li ng-repeat="term in reserve.productReserveTermsList" ng-if="term.isHasTerm" class="ng-scope">
								<span class="checkbox" ng-class="{checked: agreeReserveTerms.term0}" ng-click="fn.delivery.toggleReserveAgreeCheckbox($index, term)">
									<input type="checkbox" id="check_terms_0" name="check_terms_0">
								</span>
								<label for="check_terms_0" class="ng-binding">[동의] 프로스포츠 암표 근절 및 암표매매에 따른 제재사항에 동의합니다.</label>
								<a href="javascript:" class="btn_link" ng-show="term.isShowDetailLayer" ng-click="fn.delivery.showTermLayer(term, $index)">[상세보기]</a>
								<div class="ly_terms ng-hide" id="termDetail0" style="top: 5px; left: 210px;" ng-show="term.showReserveTermFlag">
									<button type="button" class="btn_close" style="cursor: pointer;" ng-click="term.showReserveTermFlag=false;">
										<span class="blind">레이어 닫기</span>
									</button>
									<h5 class="ly_tit ng-binding">프로스포츠 암표 근절 및 암표 매매에 따른 제재사항 안내</h5>
									<div class="ly_con" id="termLayer_0"></div>
								</div>
							</li>
							<!-- end ngIf: term.isHasTerm -->
							<!-- end ngRepeat: term in reserve.productReserveTermsList -->
						</ul>
					</div>

					<div ng-show="hasSeasonTicketUserInfoTypeList" class="reserve_step3 user_info ng-scope ng-hide" ng-controller="reserveSeasonTicketUserInfoCtrl">
						<div class="title_box">
							<h4 class="title title_txt">사용자정보</h4>
							<em> 실사용자 정보를 입력해주세요.</em>
						</div>
						<!-- ngIf: util.existsForUserInfo('EXTRA_INFO', typeList) -->
						<!-- ngRepeat: reserveDetail in reserveDetails -->
						<div class="white_box mgt10 ng-scope" ng-repeat="reserveDetail in reserveDetails">
							<div class="titbx">
								<strong class="tit_orded ng-binding">401블록 10열 88번</strong>
							</div>
							<div class="conbx user_info">
								<!-- ngIf: util.existsForUserInfo('NAME', typeList) -->
								<!-- ngIf: util.existsForUserInfo('BIRTHDAY', typeList) -->
								<!-- ngIf: util.existsForUserInfo('CONTACT', typeList) -->
								<!-- ngIf: util.existsForUserInfo('GENDER', typeList) -->

								<!-- ngIf: !isGangwonReceed -->
								<div ng-if="!isGangwonReceed" class="ng-scope">
									<!-- ngIf: util.existsForUserInfo('ETC_1', typeList) -->
									<!-- ngIf: util.existsForUserInfo('ETC_2', typeList) -->
								</div>
								<!-- end ngIf: !isGangwonReceed -->

								<!-- ngIf: util.existsForUserInfo('ETC_1', typeList) && isGangwonReceed -->
								<!-- ngIf: util.existsForUserInfo('ETC_2', typeList) && isGangwonReceed -->

							</div>
						</div>
						<!-- end ngRepeat: reserveDetail in reserveDetails -->
					</div>
					<div ng-show="hasSurvey" class="reserve_step3 ng-scope ng-hide" ng-controller="reserveSurveyCtrl">
						<div class="title_box">
							<h4 class="title title_txt">부가정보</h4>
						</div>
						<!-- ngRepeat: surveyQuestion in data.surveyQuestionList -->
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="reserve_right right_type_2">
					<!-- 시즌권 -->
					<!-- ngIf: reserve.isSports && reserve.isSeasonTicket -->
					<!-- 스포츠 : teamMatchUseYn === 'Y' 대진정보 사용 -->
					<!-- ngIf: reserve.isSports && !reserve.isSeasonTicket && reserve.teamMatchUse -->
					<dl class="sports_info right_lst3 ng-scope" ng-if="reserve.isSports &amp;&amp; !reserve.isSeasonTicket &amp;&amp; reserve.teamMatchUse">
						<dt class="img_title">
							<!-- [D] 구단 이미지 받아올 때 대체텍스트 함께 변경 -->
							<em class="img_bx"> <img ng-src="//image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="홈팀" src="//image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png">
							</em>
							<span class="versus sp_sports">vs</span>
							<em class="img_bx"> <img ng-src="//image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png" alt="원정팀" src="//image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png">
							</em>
						</dt>
						<dd class="title ng-binding" ng-mouseover="isTitleTooltipVisible=true" ng-mouseleave="isTitleTooltipVisible=false">
							<!-- ngIf: reserve.gameTitle -->
							LG vs 삼성
						</dd>
						<dt class="blind">경기장</dt>
						<dd class="ng-binding">잠실야구장</dd>
						<dt class="blind">경기날짜</dt>
						<dd class="lspacing0 ng-binding">2024.08.01(목) 18:30</dd>
						<dt class="blind">타이틀 상세정보</dt>
						<dd>
							<div class="tit_tooltip ng-hide" style="display:none">
								<h4 class="ng-binding">
									<!-- ngIf: reserve.gameTitle -->
									LG vs 삼성
								</h4>
							</div>
						</dd>
					</dl>
					<!-- end ngIf: reserve.isSports && !reserve.isSeasonTicket && reserve.teamMatchUse -->
					<!-- 스포츠 : teamMatchUseYn === 'N' 대진정보 x 매치타이틀만 사용 -->
					<!-- ngIf: reserve.isSports && !reserve.isSeasonTicket && !reserve.teamMatchUse -->
					<!-- 전시/공연/예매권 -->
					<!-- ngIf: reserve.isConcertExhibition || reserve.isAdvanceTicket -->

					<div class="reserve_result v2">
						<strong> <span>예매정보</span>
						</strong>
						<!-- ngIf: reserve.hasSeat && !reserve.isSeatAutoSelected -->
						<!-- ngIf: reserve.hasSeat && reserve.isSeatAutoSelected -->
						<ul class="seat_list ng-scope" style="height: 72px;" ng-if="reserve.hasSeat &amp;&amp; reserve.isSeatAutoSelected">
							<!-- ngRepeat: reserveDetail in reserveDetails -->
							<li ng-repeat="reserveDetail in reserveDetails" class="ng-scope">
								<span class="seat_level ng-binding">외야그린석</span>
								<span class="seat_price">자동배정</span>
							</li>
							<!-- end ngRepeat: reserveDetail in reserveDetails -->
						</ul>
						<!-- end ngIf: reserve.hasSeat && reserve.isSeatAutoSelected -->
						<table>
							<caption>예매정보</caption>
							<colgroup>
								<col style="width: 70px;">
								<col>
							</colgroup>
							<!-- FIXME 지정, 지정 자동, 비지정 구분 필요 -->


							<tfoot>
								<tr>
									<th>총결제</th>
									<td class="ng-binding">8,000</td>
								</tr>
							</tfoot>
							<tbody>
								<!-- ngIf: reserve.isConcertExhibition || reserve.isAdvanceTicket -->
								<tr>
									<th scope="row">티켓금액</th>
									<td class="ng-binding">8,000</td>
								</tr>
								<tr>
									<th scope="row">예매수수료</th>
									<td class="ng-binding">0</td>
								</tr>
								<!-- ngIf: product.additionalProductYn == 'Y' || hasAdditionalProduct -->
							</tbody>
						</table>
						<ul class="notice_result">
							<li>
								취소기한 :
								<span class="color_point ng-binding">2024.08.01 16:00</span>
								&nbsp;
								<!-- ngIf: !isCancelable() -->
							</li>
							<!-- ngIf: isCancelable() -->
							<li ng-if="isCancelable()" class="ng-scope">
								취소수수료 :
								<span class="color_point">티켓금액의 0~30%</span>
								<a class="notice-open color_point" ng-click="common.showCancelCommissionNoticeFlag = !common.showCancelCommissionNoticeFlag">[상세보기]</a>
							</li>
							<!-- end ngIf: isCancelable() -->
							<!-- ngIf: !isCancelable() -->
						</ul>
					</div>
					<div id="cancel_commission_description" class="layer ly_cancel_info ng-hide" style="display: none; bottom: 300px; left: -240px">
						<a class="close">레이어 닫기</a>
						<strong>취소일자별 수수료 안내</strong>
						<table>
							<caption>취소일자별 수수료 안내</caption>
							<colgroup>
								<col style="width: 155px">
								<col style="width: 150px">
								<col>
							</colgroup>
							<tbody id="cancel_commission_table">
								<tr>
									<th>예매당일</th>
									<td class="lspacing0">2024.07.26</td>
									<td class="tr color_green">취소수수료 없음</td>
								</tr>
								<tr>
									<th>예매익일~취소마감시간 전</th>
									<td class="lspacing0">2024.07.27~2024.08.01</td>
									<td class="tr color_green">티켓금액의10%</td>
								</tr>
							</tbody>
						</table>
						<div class="notice">
							<p>
								- 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 부과되지 않습니다.
								<br>
								(단, 취소기한 내에 한함)
							</p>
							<p>- 예매 당일 취소의 경우만 예매수수료가 환불되며, 그 이후 취소 시 환불되지 않습니다.</p>
							<p>- 신용카드 단일결제 시 부분취소가 가능합니다. (단, 일부 상품/권종/카드는 불가할 수 있음)</p>
							<p>
								<span class="color_point">- 당일 공연/전시 예매는 결제 이후 취소가 불가합니다.</span>
							</p>
							<p>
								<span class="color_point">- 이미 배송이 시작된 티켓은 직접취소가 불가합니다.</span>
								<br>
								(취소마감시간 이전까지 티켓이 NHN LINK로 반품되어야 취소처리 가능)
							</p>
						</div>
					</div>
					<div class="reserve_agree type2" ng-init="confirm1 = false; confirm2 = false; confirm3 = false">
						<p>
							<span id="confirm1" class="checkbox" ng-class="{checked : confirm1}" ng-click="confirm1 = !confirm1">
								<input type="checkbox" id="reserve_agree" name="reserve_agree">
							</span>
							<label for="reserve_agree">취소기한 및 취소수수료 동의</label>
						</p>
					</div>

					<!-- ngIf: !reserve.isFacilityChannel -->
					<div class="reserve_btn ng-scope" ng-if="!reserve.isFacilityChannel">
						<!-- ngIf: !isGlobal() -->
						<!-- end ngIf: !isGlobal() -->

						<a class="btn btn_blank" ng-click="fn.common.goToPreviousStep()">이전단계</a>
						<a class="btn btn_full_point">결제하기</a>
					</div>
					<!-- end ngIf: !reserve.isFacilityChannel -->

					<!-- ngIf: reserve.isFacilityChannel && !hasBunkerProduct -->


					<!-- ngIf: reserve.isFacilityChannel && hasBunkerProduct -->


					<div ng-show="common.showConfirmFlag" id="confirm" class="layer_step4 thirdparty thirdparty_pop ng-hide" style="display: none;">
						<a class="close" ng-click="common.showConfirmFlag = false">레이어 닫기</a>
						<h5>개인정보 제3자 정보제공</h5>
						<div class="layer_inner">
							<p>엔에이치엔링크㈜가 제공하는 상품 및 서비스를 구매하고자 할 경우, NHN LINK는 고객응대 및 상품정보 안내 등을 위하여 필요한 최소한의 개인정보만을 아래와 같이 제공하고 있습니다. NHN LINK는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 아래와 같이 개인정보 제공에 대한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
							<dl>
								<dt>1. 개인정보를 제공받는 자</dt>
								<dd class="ng-binding">
									- LG트윈스(구단)
									<!-- ngIf: reserve.isExternalService == true -->
									<!-- ngIf: isCharlotte -->
									<!-- ngIf: hasSSGProduct -->
								</dd>
								<dt>2. 제공하는 개인정보 항목</dt>
								<dd class="ng-binding">
									- LG트윈스(구단)
									<!-- ngIf: reserve.isExternalService == true -->
									: 이름, 생년월일, 아이디, 휴대폰번호, (제공 시)이메일 주소, (배송 시)주문/배송정보
								</dd>
								<!-- ngIf: isCharlotte -->
								<!-- ngIf: hasSSGProduct -->
								<dt>3. 개인정보를 제공받는 자의 이용목적</dt>
								<dd class="ng-binding">
									- LG트윈스(구단)
									<!-- ngIf: reserve.isExternalService == true -->
									: 티켓현장발권, 예매서비스 제공에 따른 내역 관리이행 등 티켓 예매 대행, 민원처리 등 고객상담, 서비스 분석과 통계에 따른 혜택 및 맞춤 서비스 제공, 서비스 이용에 따른 설문조사 및 혜택제공
								</dd>
								<!-- ngIf: hasSSGProduct -->
								<!-- ngIf: isCharlotte -->


								<dt>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간</dt>
								<dd class="ng-binding">
									- LG트윈스(구단)
									<!-- ngIf: reserve.isExternalService == true -->
									<!-- ngIf: isCharlotte -->
									: 회원탈퇴 시 또는 개인정보 이용목적 달성 시까지. 단, 관계법령의 규정에 의해 보존의 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유기간까지
								</dd>
								<!-- ngIf: hasSSGProduct -->
								<dt>5. 동의거부권 등에 대한 고지</dt>
								<dd>- 본 개인정보 제공에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 상품구매가 제한될 수 있습니다.</dd>
							</dl>
						</div>
					</div>

					<div class="layer_step4 campain ng-hide" style="display: none;">
						<a class="close">레이어 닫기</a>
						<h5>KBO리그 SAFE 캠페인</h5>
						<div class="layer_inner">
							<dl>
								<dt>&lt;KBO 경기장 안전가이드라인&gt; 주요사항 안내</dt>
								<dd>- 경기장 입장시 반입금지물품의 반입을 제한하기 위하여 보안검색이 실시됩니다.</dd>
								<dd>- 관객 1인당 소지품은 가로45cm X 세로45cm X 폭20cm 이하의 가방 1개 및 가로 30cm X 세로50cm(손잡이 포함) X 폭12cm 이하의 쇼핑백류 1개로 제한되며 이외 별도 휴대(상자, 아이스박스 등)하여 반입할 수 없습니다.</dd>
								<dd>- KBO 리그는 경기장 내 일체의 알코올류의 반입을 지양하며 주류 및 캔, 병, 1L 초과 PET 음료는 반입이 제한됩니다.</dd>
								<dd class="notice_in">
									※ 단, 주류 반입을 전면 제한하기에 앞서 충분한 홍보가 필요한 점을 감안하여 다음의 경우에는 반입이 허용될 수 있습니다.
									<ul>
										<li>· 입장시 일회용컵(종이/플라스틱)에 따라서 입장하는 경우</li>
										<li>
											· 또한 미개봉 상태의 1L 이하 PET 용기에 담겨있는 경우도 반입이 허용됨으로 구장 사정에 따라 선택적으로 운영할 수 있습니다. (1인당 1개 허용)
											<br>
											* 주류의 반입은 반드시 8도 이하 저도 주류로 제한됩니다. (막걸리 등 향이 강한 종류는 구단의 정책에 따라 제한할 수 있습니다.)
										</li>
									</ul>
								</dd>
								<dd>- (반입금지물) 무기류, 화약류, 인화성 물질, 마약류, 생화학물질, 유독성 물질, 칼·가위 등 위험 도구, 깃발·막대·삼각대 등 타격용으로 사용될 위험이 있는 도구, 가스버너 등 취사도구, 아이스박스, 앰프·대북·꽹과리·부부젤라·에어혼 등 소음이 큰 도구, 구단과 합의 되지 않은 현수막 등 표현물, 상업용 물품, 애완동물, 투척가능성이 있는 물품, 레이저 포인터, 풍선, 드론, 퀵보드, 돗자리, 휴대용 의자·간이테이블은 반입금지물이며, 이외에도 안전하고 쾌적한 관람 환경에 지장을 초래할 수 있는 물품들은 현장에서 판단하여 반입을 제한할 수 있습니다.</dd>
								<dd>- (금지행위) 반입금지물품 소지, 보안검색 거부, 타인의 관람 방해, 정치·종교·인종차별 등 개인이나 단체의 주의·주장 행위, 상업적 행위 및 상대 비방 행위, 지나친 알코올 섭취, 범죄행위, 불법 스포츠도박, 그라운드 난입·투척 등 경기 진행에 지장을 초래하는 등의 금지행위 기도자는 사안에 따라 경고·입장거부·퇴장 및 관련법에 의해 처벌받을 수 있습니다.</dd>
							</dl>
							<a href="https://www.koreabaseball.com/Event/Etc/Safe.aspx" class="link_point" target="_blank">&lt;KBO 경기장 안전가이드라인&gt; 자세히 보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>