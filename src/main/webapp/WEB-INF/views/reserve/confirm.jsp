<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/reserve/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/sports/reserve.css">
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
				<form id="paymentForm" method="post">
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
											<td class="ng-scope">
												<div class="radio_group">
													<span class="ng-scope">
														<span class="radio_box_type checked">
															<input type="radio" class="ng-pristine ng-untouched ng-valid ng-not-empty" checked>
															<label class="ng-binding" style="cursor: default;"> 현장수령 </label>
														</span>
													</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="notice_box">
							<ul class="notice ng-scope">
								<li class="ng-scope">
									<span class="ng-scope"> * 티켓은 관람일 당일 현장에서 예매번호 및 본인 확인 후 수령할 수 있습니다. </span>
								</li>
							</ul>
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
											<td class="ng-binding ng-scope">${member.name}</td>
											<th scope="row" class="th fbold">
												휴대폰 번호
												<span class="color_point">
													*
													<span class="blind">필수입력란</span>
												</span>
											</th>
											<td>
												<div class="input_block">
													<span class="input ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-maxlength" style="width: 180px">${member.phone}</span>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th fbold">
												이메일
												<span class="color_point">
													*
													<span class="blind">필수입력란</span>
												</span>
											</th>
											<td colspan="3">
												<div class="input_block">
													<span class="input ng-pristine ng-untouched ng-valid ng-not-empty" style="width: 517px">${member.email}</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="reserve_step3 customer_check">
							<div class="title_box">
								<h4 class="title title_txt">예매자 확인</h4>
							</div>
							<ul class="input_block_lst">
								<li>
									<span class="checkbox">
										<input type="checkbox" id="reserve_agree1">
									</span>
									<label for="reserve_agree1">
										주문자 확인 및 예매처리를 위해 휴대폰번호, 이메일을 수집하며,
										<br>
										이용목적 달성 이후 파기합니다.
									</label>
								</li>
								<li>
									<span class="checkbox">
										<input type="checkbox" id="reserve_agree2">
									</span>
									<label for="reserve_agree2">개인정보 제 3자 제공에 동의합니다. (고객응대 및 관람정보안내 등을 위함)</label>
								</li>
								<li>
									<span class="checkbox">
										<input type="checkbox" id="reserve_agree3">
									</span>
									<label for="reserve_agree3">KBO리그 SAFE캠페인에 동의합니다.</label>
								</li>
								<li>
									<span class="checkbox">
										<input type="checkbox" id="reserve_agree4">
									</span>
									<label for="reserve_agree4" class="ng-binding">프로스포츠 암표 근절 및 암표매매에 따른 제재사항에 동의합니다.</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="reserve_right right_type_2">
						<dl class="sports_info right_lst3 ng-scope">
							<dt class="img_title">
								<em class="img_bx"> <img src="${ctp}/images/sports/emblem/${game.homeTeamShortName}.png" alt="${game.homeTeamShortName}">
								</em>
								<span class="versus sp_sports">vs</span>
								<em class="img_bx"> <img src="${ctp}/images/sports/emblem/${game.awayTeamShortName}.png" alt="${game.awayTeamShortName}">
								</em>
							</dt>
							<dd class="title ng-binding">${game.homeTeamShortName}&nbsp;vs&nbsp;${game.awayTeamShortName}</dd>
							<dt class="blind">경기장</dt>
							<dd class="ng-binding">${game.venueName}</dd>
							<dt class="blind">경기날짜</dt>
							<dd class="lspacing0 ng-binding">${gameDateTime}</dd>
							<dt class="blind">타이틀 상세정보</dt>
							<dd>
								<div class="tit_tooltip ng-hide" style="display: none">
									<h4 class="ng-binding">${game.homeTeamShortName}&nbsp;vs&nbsp;${game.awayTeamShortName}</h4>
								</div>
							</dd>
						</dl>
						<div class="reserve_result v2">
							<strong> <span>예매정보</span>
							</strong>
							<ul class="seat_list ng-scope" style="height: 72px;">
								<c:forEach begin="1" end="${ticketAmount}">
									<li class="ng-scope">
										<span class="seat_level"> ${seat.seatName} </span>
										<span class="seat_price">자동배정</span>
									</li>
								</c:forEach>
							</ul>
							<table>
								<caption>예매정보</caption>
								<colgroup>
									<col style="width: 70px;">
									<col>
								</colgroup>
								<tfoot>
									<tr>
										<th>총결제</th>
										<td class="ng-binding">
											<fmt:formatNumber value="${totalAmount}" type="number" />
											원
										</td>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<th scope="row">티켓금액</th>
										<td class="ng-binding">
											<fmt:formatNumber value="${ticketPrice}" type="number" />
											원
										</td>
									</tr>
									<tr>
										<th scope="row">예매수수료</th>
										<td class="ng-binding">
											<fmt:formatNumber value="${bookingFee}" type="number" />
											원
										</td>
									</tr>
								</tbody>
							</table>
							<ul class="notice_result">
								<li>
									취소기한 :
									<span class="color_point ng-binding">${cancelDeadline}</span>
									&nbsp;
								</li>
								<li class="ng-scope">
									취소수수료 :
									<span class="color_point">티켓금액의 0~10%</span>
									<a href="#" id="cancelCommisonNoticeBtn">[상세보기]</a>
								</li>
							</ul>
						</div>
						<div id="cancelCommisonNotice" class="layer ly_cancel_info" style="display: none; bottom: 300px; left: -240px">
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
										<td class="lspacing0">${today}</td>
										<td class="tr color_green">취소수수료 없음</td>
									</tr>
									<tr>
										<th>예매익일~취소마감시간 전</th>
										<td class="lspacing0">${tomorrow}~${cancelDeadlineDate}</td>
										<td class="tr color_green">티켓금액의 10%</td>
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
							</div>
						</div>
						<div class="reserve_agree type2">
							<p>
								<span class="checkbox">
									<input type="checkbox" id="reserve_agree5">
								</span>
								<label for="reserve_agree5">취소기한 및 취소수수료 동의</label>
							</p>
						</div>
					    <input type="hidden" name="memberId" value="${member.id}">
					    <input type="hidden" name="gameId" value="${game.id}">
					    <input type="hidden" name="homeTeam" value="${game.homeTeamName}">
					    <input type="hidden" name="awayTeam" value="${game.awayTeamName}">
					    <input type="hidden" name="totalAmount" value="${totalAmount}">
					    <input type="hidden" name="ticketAmount" value="${ticketAmount}">
					    <input type="hidden" name="bookingFee" value="${bookingFee}">
					    <input type="hidden" name="buyerEmail" value="${member.email}">
					    <input type="hidden" name="buyerName" value="${member.name}">
					    <input type="hidden" name="buyerTel" value="${member.phone}">
					    <input type="hidden" name="seatId" value="${seat.id}">
					    <c:forEach var="ticket" items="${tempReservation.selectedTickets}">
							<input type="hidden" name="ticketType" value="${ticket.type}">
							<input type="hidden" name="ticketQuantity" value="${ticket.quantity}">
							<input type="hidden" name="ticketPrice" value="${ticket.price}">
							<input type="hidden" name="ticketTypeId" value="${ticket.ticketTypeId}">
						</c:forEach>
						<c:forEach var="advanceTicketId" items="${tempReservation.advanceTicketIds}">
							<input type="hidden" name="advanceTicketId" value="${advanceTicketId}">
						</c:forEach>
						<div class="reserve_btn ng-scope">
							<a class="btn btn_blank">이전단계</a>
							<a class="btn btn_full_point" id="paymentButton">결제하기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	    var memberId = ${member.id};
	    var gameId = ${game.id};
	    var homeTeam = "${game.homeTeamShortName}";
	    var awayTeam = "${game.awayTeamShortName}";
	    var totalAmount = ${totalAmount};
	    var ticketAmount = ${ticketAmount};
	    var bookingFee = ${bookingFee};
	    var buyerEmail = "${member.email}";
	    var buyerName = "${member.name}";
	    var buyerTel = "${member.phone}";
	</script>
	<script src="${ctp}/js/reserve/confirm.js"></script>
</body>
</html>