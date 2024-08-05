<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<jsp:include page="/WEB-INF/views/admin/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/vendors/feather/feather.css">
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/typicons/typicons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="icon" href="${ctp}/images/admin/favicon.ico">
</head>
<body>
	<div class="container-controller">
		<jsp:include page="/WEB-INF/views/admin/layout/navbar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/WEB-INF/views/admin/layout/settings-panel.jsp" />
			<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">예매정보</h4>
									<div class="table-responsive">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<th>예매자</th>
													<td>${reservation.memberName}</td>
												</tr>
												<tr>
													<th>티켓명</th>
													<td>${reservation.homeTeamName}vs${reservation.awayTeamName}</td>
												</tr>
												<tr>
													<th>관람일시</th>
													<td>${reservation.gameDate}&nbsp;${reservation.gameTime}</td>
												</tr>
												<tr>
													<th>경기장</th>
													<td>${reservation.venueName}</td>
												</tr>
												<tr>
													<th>좌석</th>
													<td>
														<c:forEach items="${reservationDetails}" var="detail">
															<p>${detail.seatName}&nbsp;${detail.seatBlock}블럭&nbsp;${detail.seatRow}열&nbsp;${detail.seatNumber}번</p>
														</c:forEach>
													</td>
												</tr>
												<tr>
													<th>예매일</th>
													<td>${reservation.formattedCreatedAt}</td>
												</tr>
												<tr>
													<th>현재상태</th>
													<td>${reservation.status}</td>
												</tr>
												<tr>
													<th>결제수단</th>
													<td>${reservation.paymentMethod}</td>
												</tr>
												<tr>
													<td colspan="2" class="m-0 p-0"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">티켓 예매내역</h4>
									<div class="table-responsive">
										<table class="table">
											<thead class="text-center">
												<tr>
													<th>예매번호</th>
													<th>좌석등급</th>
													<th>권종</th>
													<th>좌석번호</th>
													<th>가격</th>
													<th>취소여부</th>
													<th>취소일</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<c:forEach items="${reservationDetails}" var="detail" varStatus="status">
													<tr>
														<td>${reservation.reservationNumber}</td>
														<td>${detail.seatName}</td>
														<td>${detail.ticketTypeName}</td>
														<td>${detail.seatBlock}블록&nbsp;${detail.seatRow}열&nbsp;${detail.seatNumber}번</td>
														<td>
															<fmt:formatNumber value="${detail.ticketPrice}" type="number" />
															원
														</td>
														<td class="text-danger">${reservation.status}</td>
														<td>${reservation.formattedCancelDeadline}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						<c:if test="${reservation.hasAdvanceTicket}">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">스포츠 예매권 정보</h4>
										<div class="table-responsive">
											<table class="table table-bordered">
												<c:forEach items="${advanceTicketPrices}" var="ticket">
													<tr>
														<th scope="row">예매권 번호</th>
														<td>${ticket.advanceTicketNumber}</td>
														<th scope="row">사용매수</th>
														<td>1매</td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:if>

						<div class="col-lg-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">결제정보</h4>
									<div class="table-responsive">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<th>티켓금액</th>
													<td>
														<fmt:formatNumber value="${reservation.totalTicketPrice}" type="number" />
														원
													</td>
												</tr>
												<tr>
													<th>예매수수료</th>
													<td>
														<fmt:formatNumber value="${reservation.bookingFee}" type="number" />
														원
													</td>
												</tr>
												<tr>
													<th>예매권 할인</th>
													<td>
														<c:choose>
															<c:when test="${reservation.hasAdvanceTicket}">
											-<fmt:formatNumber value="${reservation.advanceTicketDiscount}" type="number" />
											원
											</c:when>
															<c:otherwise>0원</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th>총 결제금액</th>
													<td class="text-danger">
														<fmt:formatNumber value="${reservation.totalAmount}" type="number" />
														원
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">취소정보</h4>
									<div class="table-responsive">
										<table class="table table-bordered">
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
															<td colspan="3" class="text-danger">${reservation.cancelDeadline}</td>
														</tr>
														<tr>
															<td rowspan="2">
																취소 수수료
																<br>
																(취소 마감시간 내에 한함)
															</td>
															<td>예매당일</td>
															<td>${reservation.formattedCreatedAt}</td>
															<td>
																<span class="text-danger">없음</span>
															</td>
														</tr>
														<tr>
															<td>예매익일~취소마감시간 전</td>
															<td>${reservation.cancelPeriod}</td>
															<td>
																티켓 금액의
																<span class="text-danger">10%</span>
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
															<td colspan="3" class="text-danger">${reservation.cancelDeadline}(기한종료)</td>
														</tr>
														<tr>
															<td rowspan="1">
																취소 수수료
																<br>
																(취소 마감시간 내에 한함)
															</td>
															<td class="text-danger" colspan="3">예매취소가 마감되어 취소/환불/변경 불가합니다.</td>
														</tr>
													</tbody>
												</c:otherwise>
											</c:choose>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">환불정보</h4>
									<div class="table-responsive">
										<table class="table">
											<thead class="text-center">
												<tr>
													<th>티켓금액</th>
													<th>취소수수료</th>
													<th>예매수수료</th>
													<th>총 환불금액</th>
												</tr>
											</thead>
											<tbody class="text-center">
												<tr>
													<td>
														<fmt:formatNumber value="${cancelInfo.totalTicketPrice}" type="number" />
														원
													</td>
													<td>
														<fmt:formatNumber value="${cancelInfo.cancellationFee}" type="number" />
														원
													</td>
													<td>
														<fmt:formatNumber value="${cancelInfo.bookingFee}" type="number" />
														원
													</td>
													<td class="text-danger">
														<fmt:formatNumber value="${cancelInfo.refundAmount}" type="number" />
														원
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>