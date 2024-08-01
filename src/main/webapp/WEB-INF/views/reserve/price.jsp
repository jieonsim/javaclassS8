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
											<span class="color_green fbold _selectName">${seat.seatName}</span>
											을
											<span class="color_green fbold _selectCnt">${ticketAmount}매</span>
											를 선택하셨습니다.
										</td>
									</tr>
									<c:forEach var="category" items="${categoryList}">
										<c:set var="firstCategoryRow" value="true" />
										<c:forEach var="price" items="${prices}">
											<c:if test="${price.category eq category.name}">
												<tr>
													<c:if test="${firstCategoryRow}">
														<th scope="row" rowspan="${category.rowspan}">${category.name}</th>
														<c:set var="firstCategoryRow" value="false" />
													</c:if>
													<td>
														<div class="in">
															${price.ticketTypeName}
															<c:if test="${not empty price.description}">
																<div class="layer_mother">
																	<a href="#" class="help">도움말보기</a>
																	<span class="layer only_txt" style="width: 200px; top: 0px; left: 19px">
																		<p class="layer_text">${price.description}</p>
																	</span>
																</div>
															</c:if>
															<c:if test="${price.ticketTypeName eq '스포츠 예매권'}">
																<button type="button" class="btn_ly _certifyDivButton close" data-seat-id="${seat.id}" data-game-id="${game.id}">
																	<span class="blind"></span>
																</button>
															</c:if>
														</div>
													</td>
													<td class="tr">
														<span class="color_green fbold _price">
															<fmt:formatNumber value="${price.price}" type="number" />
														</span>원
													</td>
													<td class="selectbox">
														<div class="selectbox">
															<a href="#" class="select _price_cnt">0</a>
															<ul class="select_list" id="selectList${price.ticketTypeId}" data-limit-count="${ticketAmount}">
																<c:forEach begin="0" end="${ticketAmount}" var="i">
																	<li data-value="${i}" data-certification-code="${price.ticketTypeName eq '스포츠 예매권' ? 'ADVANCE_TICKET' : 'NONE'}" data-price="${price.price}" data-seat-id="${seat.id}" data-ticketType-id="${price.ticketTypeId}">
																		<a href="#">${i}</a>
																	</li>
																</c:forEach>
															</ul>
														</div>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="notice" class="notice_area">
						<strong class="title_notice">안내사항</strong>
						<ul class="notice_list">
							<li class="notice_item">
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
					<dl class="sports_info right_lst3">
						<dt class="img_title">
							<em class="img_bx"> <img src="${ctp}/images/sports/emblem/${game.homeTeamShortName}.png" alt="${homeTeamName}">
							</em>
							<span class="versus sp_sports">vs</span>
							<em class="img_bx"> <img src="${ctp}/images/sports/emblem/${game.awayTeamShortName}.png" alt="${awayTeamName}">
							</em>
						</dt>
						<dd class="title product_title">${game.homeTeamShortName}&nbsp;vs&nbsp;${game.awayTeamShortName}</dd>
						<dt class="blind">경기장</dt>
						<dd>${game.venueName}</dd>
						<dt class="blind">경기날짜</dt>
						<dd class="lspacing0">${gameDateTime}</dd>
						<dt class="blind">타이틀 상세정보</dt>
						<dd>
							<div class="tit_tooltip" style="display: none;">
								<h4>${game.homeTeamShortName}&nbsp;vs&nbsp;${game.awayTeamShortName}</h4>
							</div>
						</dd>
					</dl>
					<h4 class="blind">경기정보</h4>
					<div class="reserve_result">
						<strong> <span>예매정보</span>
						</strong>
						<ul class="seat_list" style="height: 72px;">
							<c:forEach begin="1" end="${ticketAmount}">
								<li>
									<span class="seat_level"> ${seat.seatName} </span>
									<span class="seat_price">자동배정</span>
								</li>
							</c:forEach>
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
									<input type="hidden" id="bookingFeePerTicket" data-booking-fee="${bookingPolicy.bookingFeePerTicket}">
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
								<span class="color_point" id="_cancel_time">${cancelDeadline}</span>
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
						</div>
					</div>
					<div class="reserve_btn">
						<a class="btn btn_blank" href="#">이전단계</a>
						<a class="btn btn_full" href="#">다음단계</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    	var gameId = `${tempReservation.gameId}`;
	    var advanceTicketsData = [
	        <c:forEach items="${advanceTickets}" var="ticket" varStatus="status">
	            {
	                id: "${ticket.id}",
	                advanceTicketNumber: "${ticket.advanceTicketNumber}",
	                formattedExpiresAt: "${ticket.formattedExpiresAt}"
	            }<c:if test="${!status.last}">,</c:if>
	        </c:forEach>
	    ];
	    var initialticketAmount = `${ticketAmount}`;
	</script>
	<script src="${ctp}/js/reserve/price.js"></script>
</body>
</html>