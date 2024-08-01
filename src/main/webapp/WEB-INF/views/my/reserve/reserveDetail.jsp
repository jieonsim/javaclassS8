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
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/my/contents.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
				<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont ng-scope">
					<h3 class="blind">예매관리</h3>
					<div class="h3_line">
						<h4>예매확인/취소</h4>
					</div>
					<p class="guide_txt">예매한 티켓 확인/취소가 가능합니다.</p>
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
									<td class="ng-scope">
										<span class="ng-binding ng-scope">${reservation.homeTeamName} vs ${reservation.awayTeamName}</span>
									</td>
									<th scope="row">예매자</th>
									<td class="ng-binding">${reservation.memberName}</td>
								</tr>
								<tr>
									<th scope="row">관람일시</th>
									<td class="ng-binding">${reservation.gameDate}&nbsp;${reservation.gameTime}</td>
									<th scope="row">장소</th>
									<td class="ng-binding">${reservation.venueName}</td>
								</tr>
								<tr>
									<th scope="row" class="ng-scope">좌석</th>
									<td>
										<c:forEach items="${reservationDetails}" var="detail">
											<p class="ng-binding ng-scope">${detail.seatName}&nbsp;${detail.seatBlock}블럭&nbsp;${detail.seatRow}열&nbsp;${detail.seatNumber}번</p>
										</c:forEach>
									</td>
									<th scope="row">티켓수령 방법</th>
									<td class="ng-binding ng-scope">현장수령</td>
								</tr>
								<tr>
									<th scope="row">예매일</th>
									<td class="ng-binding">${reservation.formattedCreatedAt}</td>
									<th scope="row">현재상태</th>
									<td class="ng-binding">
										${reservation.status}
										<span class="ng-binding ng-hide">()</span>
									</td>
								</tr>
								<tr>
									<th scope="row">결제수단</th>
									<td>
										<ul>
											<li class="ng-scope">
												<span class="ng-binding ng-scope">${reservation.paymentMethod}</span>
											</li>
										</ul>
									</td>
									<th scope="row">예매채널</th>
									<td class="ng-binding">PC웹</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="list_btn ng-scope">
						<a href="${ctp}/my/reserve/print?reserveId=${reservation.id}" class="btn btn_full" id="printPopupBtn">프린트</a>
					</div>
					<h5 class="mgt40 text_tit">예매내역</h5>
					<h6 class="text_tit">티켓 예매내역</h6>
					<div class="basic_tbl basic_tbl_v3">
						<table>
							<caption>
								<span class="blind">티켓 예매내역</span>
							</caption>
							<colgroup>
								<col style="width: 100px">
								<col style="width: 140px">
								<col style="width: 100px">
								<col style="width: 145px">
								<col style="width: 80px">
								<col style="width: 70px">
								<col style="width: 90px">
							</colgroup>
							<thead class="text-center">
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">좌석등급</th>
									<th scope="col">권종</th>
									<th scope="col">좌석번호</th>
									<th scope="col">가격</th>
									<th scope="col">취소여부</th>
									<th scope="col">취소(가능)일</th>
								</tr>
							</thead>
							<tbody style="font-family: 'Pretendard-Regular'">
								<c:forEach items="${reservationDetails}" var="detail" varStatus="status">
									<tr class="ng-scope">
										<td class="font_option number">${reservation.reservationNumber}</td>
										<td class="ellipsis ng-binding">${detail.seatName}</td>
										<td class="ellipsis ng-binding">${detail.ticketTypeName}</td>
										<td class="ellipsis ng-binding">${detail.seatBlock}블록&nbsp;${detail.seatRow}열&nbsp;${detail.seatNumber}번</td>
										<td class="ng-binding">
											<fmt:formatNumber value="${detail.ticketPrice}" type="number" />
											원
										</td>
										<td class="color_point font_option ng-scope">
											<c:choose>
												<c:when test="${reservation.status eq '예매완료'}">취소가능</c:when>
												<c:otherwise>취소불가</c:otherwise>
											</c:choose>
										</td>
										<td class="number color_point font_option ng-binding ng-scope">${reservation.formattedCancelDeadline}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<c:if test="${reservation.cancelable}">
						<div class="list_btn">
							<a href="${ctp}/my/reserve/cancel/confirm?reservationId=${reservation.id}" class="btn btn_full ng-scope">취소하기</a>
						</div>
					</c:if>

					<c:if test="${reservation.hasAdvanceTicket}">
						<h5 class="mgt40 text_tit">스포츠 예매권 정보</h5>
						<div class="basic_tbl_v4">
							<table>
								<caption>
									<span class="blind">스포츠 예매권 정보</span>
								</caption>
								<colgroup>
									<col style="width: 120px">
									<col>
									<col style="width: 140px">
									<col>
								</colgroup>
								<tbody>
									<c:forEach items="${advanceTicketPrices}" var="ticket">
										<tr class="line">
											<th scope="row" class="lspacingm1">예매권 번호</th>
											<td class="tr ng-binding">${ticket.advanceTicketNumber}</td>
											<th scope="row" class="lspacingm1">사용매수</th>
											<td class="tr ng-binding">1매</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>

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
											<span class="number ng-binding">
												<fmt:formatNumber value="${reservation.totalAmount}" type="number" />
												원
											</span>
										</span>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr class="line">
									<th scope="row" class="lspacingm1">티켓금액</th>
									<td class="tr ng-binding">
										<fmt:formatNumber value="${reservation.totalTicketPrice}" type="number" />
										원
									</td>
									<th scope="row" class="lspacingm1">예매수수료</th>
									<td class="tr ng-binding">
										<fmt:formatNumber value="${reservation.bookingFee}" type="number" />
										원
									</td>
								</tr>
								<tr>
									<th scope="row" class="lspacingm1">예매권 할인</th>
									<td class="tr ng-scope">
										<c:choose>
											<c:when test="${reservation.hasAdvanceTicket}">
											-<fmt:formatNumber value="${reservation.advanceTicketDiscount}" type="number" />
											원
											</c:when>
											<c:otherwise>0원</c:otherwise>
										</c:choose>
									</td>
									<th scope="row" class="lspacingm1">부가상품</th>
									<td class="tr ng-binding">0원</td>
								</tr>
							</tbody>
						</table>
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
							<c:choose>
								<c:when test="${reservation.cancelable}">
									<!-- 취소 가능한 경우 -->
									<tbody>
										<tr>
											<td>취소 마감시간</td>
											<td colspan="3" class="color_point fbold tl end ng-binding">${reservation.cancelDeadline}</td>
										</tr>
										<tr class="ng-scope">
											<td rowspan="2" class="vam ng-scope">
												취소 수수료
												<br>
												(취소 마감시간 내에 한함)
											</td>
											<td class="color_black tl ng-binding">예매당일</td>
											<td class="color_black tl ng-binding ng-scope">${reservation.formattedCreatedAt}</td>
											<td class="color_point tl end ng-scope">
												<span class="color_point fbold">없음</span>
											</td>
										</tr>
										<tr class="ng-scope">
											<td class="color_black tl ng-binding">예매익일~취소마감시간 전</td>
											<td class="color_black tl ng-binding ng-scope">${reservation.cancelPeriod}</td>
											<td class="color_black tl end ng-scope">
												티켓 금액의
												<span class="color_point fbold number ng-binding">10%</span>
												부과
											</td>
										</tr>
									</tbody>
								</c:when>
								<c:otherwise>
									<!-- 취소 불가능한 경우 -->
									<tbody>
										<tr>
											<td>취소 마감시간</td>
											<td colspan="3" class="color_point fbold tl end ng-binding">${reservation.cancelDeadline}(기한종료)</td>
										</tr>
										<tr>
											<td rowspan="1" class="vam">
												취소 수수료
												<br>
												(취소 마감시간 내에 한함)
											</td>
											<td class="tl color_point vam fbold" colspan="3">예매취소가 마감되어 취소/환불/변경 불가합니다.</td>
										</tr>
									</tbody>
								</c:otherwise>
							</c:choose>
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
											<li>취소마감시간이 지난 이후에는 취소가 불가능합니다.</li>
											<li>취소 진행 시 취소 마감시간 확인 후 취소해주시기 바랍니다.</li>
											<li>예매수수료는 예매일 당일 취소하실 경우만 환불되며, 그 이후 취소 시에는 환불되지 않습니다.</li>
											<li>행사상의 문제로 인해 환불을 받으실 경우 별도의 수수료를 제공하지 않으며, 환불 주체가 티켓챔프가 아닌 행사 주최사가 될 수 있습니다.</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script>
		const reservationId = `${reservation.id}`;
	</script>
	<script src="${ctp}/js/my/reserve/reserveDetail.js"></script>
</body>
</html>