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
				<li class="step3 on">
					<span class="ng-binding ng-scope">권종/할인/매수선택</span>
				</li>
				<li class="step4">
					<span class="ng-binding ng-scope">예매확인</span>
				</li>
				<li class="step5">
					<span class="ng-binding ng-scope">결제</span>
				</li>
			</ul>
			<h2 class="blind">권종/할인/매수선택</h2>
		</div>
		<div id="container" class="ng-isolate-scope">
			<div class="reserve_content">
				<div class="reserve_left">
					<div class="pointb_box">
						<p class="inner_txt">
							선택하신 좌석이 고객님께 선점되었습니다.
							<span>8분 이내 결제하지 않으실 경우 선점된 좌석이 해제</span>
							됩니다.
						</p>
					</div>
					<div id="divPrice">
						<div class="reserve_step3 _denomination">
							<div class="title_box">
								<h4 class="title title_txt">티켓종류, 할인, 매수 선택</h4>
							</div>
							<table>
								<caption>좌석선택</caption>
								<colgroup>
									<col style="width: 154px;">
									<col>
									<col style="width: 160px">
									<col style="width: 75px">
								</colgroup>
								<tbody>
									<tr>
										<td colspan="4" class="th _selectGradeInfo">
											<span class="color_green fbold _selectName">외야그린석</span>을
											<span class="color_green fbold _selectCnt">1매</span>를 선택하셨습니다.
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="8">일반(정가)</th>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">일반</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">8,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<!-- 클릭 시 div class="selectbox is-active"로 처리 -->
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285258">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285258" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285258" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285258" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	청소년
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">-매표소에서만 증빙서류(학생증) 확인 후 티켓으로 발권 가능(무인발권기, 스마트티켓 발권 불가) -권종선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 재구매 필요)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">6,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285268">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285268" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285268" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285268" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	군인(사병)
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">* 매표소에서만 증빙서류 확인 후 티켓으로 발권 가능(무인발권기, 스마트티켓 발권 불가) * 군경할인은 휴가장병만 할인가능(직업군인,경찰 불가)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">6,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285272">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285272" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285272" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285272" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	어린이
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">- 매표소에서만 티켓으로 교환 가능하며, 증빙서류(등본, 여권)등 확인 후 티켓으로 발권 가능(무인발권기, 스마트티켓 발권 불가) - 36개월 미만 무료입장(단,좌석 점유시 해당 권종으로 티켓 구매) -권종선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 재구매 필요)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285276">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285276" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285276" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285276" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	경로
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">경로 할인(본인만) - 매표소에서만 티켓으로 교환 가능하며, 증빙서류 확인 후 티켓으로 발권 가능합니다.(무인발권기, 스마트티켓 발권 불가)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285280">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285280" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285280" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285280" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	장애인
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">장애인 할인(본인만) - 매표소에서만 티켓으로 교환 가능하며, 증빙서류 확인 후 티켓으로 발권 가능합니다.(무인발권기, 스마트티켓 발권 불가)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285284">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285284" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285284" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285284" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	국가유공자
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">국가유공자 할인(본인만) - 매표소에서만 티켓으로 교환 가능하며, 증빙서류 확인 후 티켓으로 발권 가능합니다.(무인발권기, 스마트티켓 발권 불가)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285288">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285288" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="285288" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285288" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반(정가)</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	이벤트할인(학생증)
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">해당 권종은 본인에 한해 할인 가능합니다. 매표소에서만 티켓 교환이 가능하며, 증빙서류 확인 후 티켓 발권 가능합니다. * 무인발권기, 스마트티켓 사용 불가 * 중학생, 고등학생, 대학(원)생 대상으로 할인 구매 가능 (중고생 기준 출생연도 : 2006년~2011년생 / 대학(원)생 기준 : 2006년생 이전) * 증빙서류(학생증, 청소년증, 모바일학생증 등)가 확인 되지 않으면 티켓은 변경, 취소 불가.</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145305107">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="305107" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4000" data-product_grade_id="96145" data-product_denomination_id="305107" data-denomination_class_code="BASE" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145305107" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="4">카드할인</th>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>카드할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	LG트윈스 신한카드
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">LG트윈스 신한카드로 결제 시 1일 1매에 대하여 3,000원 청구 할인 (선할인 신한카드는 신한카드 권종으로 결제 시에 할인)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">8,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285387">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285387" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285387" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285387" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>카드할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	LG트윈스 신한카드 체크
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">블루석 이하 경기당 1매, 3,000원 할인(LG트윈스 신한카드 체크 할인)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">5,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285391">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="5000" data-product_grade_id="96145" data-product_denomination_id="285391" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="5000" data-product_grade_id="96145" data-product_denomination_id="285391" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285391" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>카드할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	신한카드
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">블루석이하 경기당 1매 2,000원 할인(특정 27개 카드만 할인가능) 선할인 카드목록은 "티켓링크(WEB)내 LG트윈스 요금/할인카드" 에서 확인하세요!</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">6,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285398">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285398" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285398" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285398" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>카드할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	문화누리카드
																	<div class="layer_mother">
																		<a href="#" class="help">도움말보기</a>
																		<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																			<p class="layer_text">문화누리카드 권종 구매시 경기 당일 매표소에서만 티켓교환이 가능하며, 티켓 교환 시 결제 카드와 소유자 신분증 확인 후 티켓 발권가능합니다.(무인발권기, 스마트티켓 사용 불가)</p>
																		</span>
																	</div>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">4,800</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285403">
																		<li data-value="0" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4800" data-product_grade_id="96145" data-product_denomination_id="285403" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="NONE" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="4800" data-product_grade_id="96145" data-product_denomination_id="285403" data-denomination_class_code="CARD" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285403" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="2">일반할인</th>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	LG U+ 일반
																	<button type="button" class="btn_ly close _certifyDivButton" data-product_gradeid="96145" data-product_denomination_id="285376">
																		<span class="blind">인증영역 닫기</span>
																	</button>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">6,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285376">
																		<li data-value="0" data-denomination_certification_code="POINT_CERTIFY" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285376" data-denomination_class_code="NORMAL" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="POINT_CERTIFY" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="6000" data-product_grade_id="96145" data-product_denomination_id="285376" data-denomination_class_code="NORMAL" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285376" style="display: none;">
																<div class="confirm_area _gsnp">
																	<button type="button" class="btn btn_blank" data-point-type="LGU" data-product_grade_id="96145" data-product_denomination_id="285376" data-schedule_id="2089081482" data-denomination_certification_code="POINT_CERTIFY">
																		<span>[LGU+ 일반할인]</span>
																		<span>인증하기</span>
																	</button>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>일반할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">
																	LG U+ VIP
																	<button type="button" class="btn_ly close _certifyDivButton" data-product_gradeid="96145" data-product_denomination_id="285382">
																		<span class="blind">인증영역 닫기</span>
																	</button>
																</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">5,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285382">
																		<li data-value="0" data-denomination_certification_code="POINT_CERTIFY" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="5000" data-product_grade_id="96145" data-product_denomination_id="285382" data-denomination_class_code="NORMAL" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="POINT_CERTIFY" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="5000" data-product_grade_id="96145" data-product_denomination_id="285382" data-denomination_class_code="NORMAL" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285382" style="display: none;">
																<div class="confirm_area _gsnp">
																	<button type="button" class="btn btn_blank" data-point-type="LGU" data-product_grade_id="96145" data-product_denomination_id="285382" data-schedule_id="2089081482" data-denomination_certification_code="POINT_CERTIFY">
																		<span>[LGU+ VIP할인]</span>
																		<span>인증하기</span>
																	</button>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">인증할인</th>
										<td colspan="3">
											<div class="tbl_inner">
												<table>
													<caption>인증할인</caption>
													<colgroup>
														<col>
														<col style="width: 160px">
														<col style="width: 75px">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row" class="th">
																<div class="in">스포츠 예매권</div>
															</th>
															<td class="tr">
																<span class="color_green fbold _price">8,000</span>
																원
															</td>
															<td class="selectbox">
																<div class="selectbox">
																	<a href="#" class="select _price_cnt">0</a>
																	<ul class="select_list" id="selectList96145285562">
																		<li data-value="0" data-denomination_certification_code="SPORTS_PRETICKET" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285562" data-denomination_class_code="CERTIFY" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">0</a>
																		</li>
																		<li data-value="1" data-denomination_certification_code="SPORTS_PRETICKET" data-denominationlimit_count="1" data-grade_index="0" data-sale_price="8000" data-product_grade_id="96145" data-product_denomination_id="285562" data-denomination_class_code="CERTIFY" data-delivery_yn="N" data-site_receipt_yn="Y" data-member_limit_type_code="">
																			<a href="#">1</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="td_ly" id="certify96145285562" style="display: none;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="coupon"></div>
					<div id="integratePoint"></div>
					<div id="ktGift"></div>
					<div id="benepiaPoint"></div>
					<div id="useIntegratePoint" style="display: none"></div>
					<div id="saveIntegratePoint" style="display: none"></div>
					<div id="additionalProducts"></div>
					<div id="notice" class="notice_area">
						<strong class="title_notice">안내사항</strong>
						<ul class="notice_list">
							<li class="notice_item">
								<!-- [D] pre태그여서 앞으로 붙여놓았습니다.	어드민 입력 그대로 나와야 함 -->
								<pre class="pre_txt">* 일부 구역의 1열 및 마지막열 좌석은 시야방해로 인해 경기 당일 매표소에서 안내 후 판매.
* 판매하는 도면의 일부 좌석의 앞,뒤 위치는 실제 야구장과 상이 할 수 있습니다.
* 36개월 이상 어린이는 티켓 구매 후 입장(36개월 미만 유아는 무료입장 가능하나 보호자가 안고 관람 필요)
* 권종선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장에서 재구매 해야합니다.)
* 암표적발 시 직권취소 및 경찰신고
* 경기 당일 경기 시작 2시간 30분 ~ 경기 시작 1시간 후까지 예매분은 취소 불가
* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.</pre>
							</li>
						</ul>
					</div>
				</div>
				<div class="reserve_right">
					<!-- 스포츠 : teamMatchUseYn === 'Y' 대진정보 사용 -->
					<dl class="sports_info right_lst3">
						<dt class="img_title">
							<!-- [D] 구단 이미지 받아올 때 대체텍스트 함께 변경 -->
							<em class="img_bx"> <img src="//image.toast.com/aaaaab/ticketlink/TKL_9/Property1=LG.png" alt="LG트윈스">
							</em>
							<span class="versus sp_sports">vs</span>
							<em class="img_bx"> <img src="//image.toast.com/aaaaab/ticketlink/TKL_8/Property1=Samsung.png" alt="삼성 라이온즈">
							</em>
						</dt>
						<dd class="title product_title">LG vs 삼성</dd>
						<dt class="blind">경기장</dt>
						<dd>잠실야구장</dd>
						<dt class="blind">경기날짜</dt>
						<dd class="lspacing0">2024.08.01(목) 18:30</dd>
						<dt class="blind">타이틀 상세정보</dt>
						<dd>
							<div class="tit_tooltip" style="display: none;">
								<h4>LG vs 삼성</h4>
							</div>
						</dd>
					</dl>
					<h4 class="blind">경기정보</h4>
					<div class="reserve_result">
						<strong> <span>예매정보</span>
						</strong>
						<ul class="seat_list" style="height: 72px;">

							<li>
								<span class="seat_level">외야그린석</span>
								<span class="seat_price">자동배정</span>
							</li>
						</ul>
						<table>
							<caption>예매정보</caption>
							<colgroup>
								<col width="70px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>티켓금액</th>
									<td id="_price_ticket">0</td>
								</tr>
								<tr>
									<th>예매수수료</th>
									<td id="_price_fee">0</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>총결제</th>
									<td id="_price_amount">0</td>
								</tr>
							</tfoot>
						</table>
						<ul class="notice_result">
							<li>
								취소기한 :
								<span class="color_point" id="_cancel_time">2024.08.01 16:00</span>
								&nbsp;
								<span id="cancelDateEndText" class="color_point_end" style="display: none;">(기한 종료)</span>
							</li>
							<li>
								취소수수료 :
								<span id="cancelFee" class="color_point">티켓금액의 0~10%</span>
								<span id="cancelDisabledText" class="color_point_end" style="display: none;">취소/환불/변경 불가</span>
								<a href="#" id="cancelCommisonNoticeBtn">[상세보기]</a>
							</li>
						</ul>
					</div>
					<div class="layer ly_cancel_info" style="display: none; left: -240px; right: 300px;" id="cancelCommisonNotice">
						<a href="#" class="close">레이어 닫기</a>
						<strong>취소일자별 수수료 안내</strong>
						<table>
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
					<div class="reserve_btn">
						<a class="btn btn_blank" href="#">이전단계</a>
						<a class="btn btn_full" href="#" id="reserveNext">다음단계</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>