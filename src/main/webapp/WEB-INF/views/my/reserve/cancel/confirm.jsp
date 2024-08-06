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
						<h4>취소상세</h4>
					</div>
					<p class="guide_txt">취소 및 환불 금액과 수수료를 확인하신 후, 취소를 진행해주세요.</p>
					<form id="cancelForm" method="post">
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
									<tr class="ng-scope line">
										<input type="hidden" name="reservationId" value="${reservation.id}">
										<th scope="row" rowspan="1" class="ng-scope">예매번호</th>
										<td colspan="3" class="ng-binding">${reservation.reservationNumber}&nbsp;(총&nbsp;${reservation.ticketAmount}매)</td>
									</tr>
									<tr>
										<th scope="row">총 결제금액</th>
										<td class="tr ng-binding">
											<fmt:formatNumber value="${cancelInfo.totalAmount}" type="number" />
											원
										</td>
										<th scope="row">티켓금액</th>
										<td class="tr ng-binding">
											<fmt:formatNumber value="${cancelInfo.totalTicketPrice}" type="number" />
											원
										</td>
									</tr>
									<tr>
										<th scope="row">예매수수료</th>
										<td class="tr ng-binding"><fmt:formatNumber value="${cancelInfo.bookingFee}" type="number" />원</td>
										<th scope="row">취소수수료</th>
										<td class="tr ng-binding"><fmt:formatNumber value="${cancelInfo.cancellationFee}" type="number" />원</td>
									</tr>
								</tbody>
								<tfoot>
									<tr class="line">
										<th scope="row" class="bgnone">총 환불금액</th>
										<td colspan="3">
											<span class="color_point ng-binding"><fmt:formatNumber value="${cancelInfo.refundAmount}" type="number" />원</span>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
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
						<div class="list_btn">
							<button type="submit" class="btn btn_full">취소하기</button>
						</div>
					</form>
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
									<td class="color_point tl end ng-scope">없음</td>
								</tr>
								<tr class="ng-scope">
									<td class="color_black tl ng-binding">예매익일~취소마감시간 전</td>
									<td class="color_black tl ng-binding ng-scope">${reservation.cancelPeriod}</td>
									<td class="color_black tl end ng-scope">
										티켓 금액의 <strong class="color_point ng-binding">10%</strong>
									</td>
								</tr>
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
											<li>취소 마감시간이 지난 이후에는 취소가 불가능합니다.</li>
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
		<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script>
		const reservationId = ${reservation.id}
	</script>
	<script src="${ctp}/js/my/reserve/cancel/confirm.js"></script>
</body>
</html>