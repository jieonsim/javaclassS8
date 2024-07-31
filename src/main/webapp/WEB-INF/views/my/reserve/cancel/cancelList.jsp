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
<link rel="stylesheet" href="${ctp}/css/common/paginate.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
				<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont">
					<h3 class="blind">예매관리</h3>
					<div class="h3_line">
						<h4 class="tit_reserve01">예매확인/취소</h4>
					</div>
					<p class="guide_txt">
						<span class="color_point">예매번호</span>
						를 클릭하면 예매 상세 내용을 확인할 수 있습니다.
						<br>
						공연/전시 예매 내역은 하단의 공연/전시 탭을 선택하면 확인할 수 있습니다.
					</p>
					<ul class="mypage_tab">
						<li>
							<a href="${ctp}/my/reserve/list">예매확인</a>
						</li>
						<li class="on">
							<a href="${ctp}/my/reserve/cancel/list">예매취소</a>
						</li>
					</ul>
					<div class="sortbx">
						<dl class="daysortbx fl">
							<dt>기간별 조회</dt>
							<dd>
								<ul class="daysort">
									<li class="ng-scope">
										<a href="javascript:;" class="ng-binding">15일</a>
									</li>
									<li class="ng-scope on">
										<a href="javascript:;" class="ng-binding">1개월</a>
									</li>
									<li class="ng-scope">
										<a href="javascript:;" class="ng-binding">2개월</a>
									</li>
									<li class="ng-scope">
										<a href="javascript:;" class="ng-binding">3개월</a>
									</li>
								</ul>
							</dd>
						</dl>
					</div>
					<p class="guide_txt v2">
						예매한 내역이 확인이 안되실 경우
						<a href="/cs/inquiry" onclick="window.open(this.href, '', 'left=100, top=100, width=880, height=900'); return false;">1:1 상담 문의</a>
						를 이용해주세요.
					</p>

					<div class="basic_tbl basic_tbl_v3">
						<table>
							<caption>예매확인/취소 리스트</caption>
							<colgroup>
								<col style="width: 90px">
								<col>
								<col style="width: 135px">
								<col style="width: 50px">
								<col style="width: 100px">
								<col style="width: 155px">
							</colgroup>
							<thead class="text-center">
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">티켓명</th>
									<th scope="col">관람일시</th>
									<th scope="col">매수</th>
									<th scope="col">취소가능일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:choose>
									<c:when test="${not empty reservations}">
										<c:forEach items="${reservations}" var="reservation">
											<tr class="ng-scope">
												<td class="fs12 number">
													<a href="${ctp}/my/reserve/cancel/detail?reservationId=${reservation.reservationId}" class="point_number ng-binding">${reservation.reservationNumber}</a>
												</td>
												<td class="tl ng-scope">
													<span class="elp ng-scope" style="text-align: center;">
														<span class="ng-binding ng-scope">${reservation.homeTeamName} vs ${reservation.awayTeamName}</span>
													</span>
												</td>
												<td class="fs12 number ng-binding">${reservation.gameDate}${reservation.gameTime}</td>
												<td class="ng-binding">${reservation.ticketAmount}장</td>
												<td class="fs12 number color_point ng-binding">${reservation.cancelDeadline}</td>
												<td>
													<div class="reserve_condition1 ng-binding">
														${reservation.status}
													</div>
													<div class="reserve_condition2 ng-binding">${reservation.formattedCanceledAt}</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<!-- 취소내역 없을 때 -->
										<tr>
											<td colspan="6" class="no_data">취소한 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<tr>
									<td colspan="6" class="m-0 p-0"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<c:if test="${not empty reservations}">
						<div class="paging" id="pagination">
							<a href="?page=1" class="first ${paginationInfo.currentPage == 1 ? 'disabled' : ''}">맨앞</a>
							<a href="?page=${paginationInfo.currentPage - 1}" class="prev ${paginationInfo.currentPage == 1 ? 'disabled' : ''}">이전</a>

							<c:forEach begin="${paginationInfo.startPage}" end="${paginationInfo.endPage}" var="pageNum">
								<c:choose>
									<c:when test="${pageNum == paginationInfo.currentPage}">
										<strong>${pageNum}</strong>
									</c:when>
									<c:otherwise>
										<a href="?page=${pageNum}">${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<a href="?page=${paginationInfo.currentPage + 1}" class="next ${paginationInfo.currentPage == paginationInfo.totalPages ? 'disabled' : ''}">다음</a>
							<a href="?page=${paginationInfo.totalPages}" class="end ${paginationInfo.currentPage == paginationInfo.totalPages ? 'disabled' : ''}">맨뒤</a>
						</div>
					</c:if>
					<div class="notes2">
						<h6>
							<span></span>
							티켓취소 안내
						</h6>
						<ol>
							<li>예매 당일 자정까지 취소하실 경우는 예매수수료도 환불되며, 취소수수료가 부과되지 않습니다. 그 이후에 취소하실 경우는 예매수수료가 환불되지 않으며, 취소수수료는 정책에 따라 부과됩니다.</li>
							<li>일부 경기의 경우 상황에 따라 일괄 취소 건이 발생할 수있으며, 일괄 취소 시에는 취소 수수료가 부과되지 않습니다.</li>
							<li>티켓의 날짜/시간/좌석 등급/좌석 위치 변경은 불가합니다. 자세한 안내가 필요할 경우 고객센터를 이용해주세요.</li>
							<li>구단 홈페이지에서 예매한 내역은 구단 홈페이지에서만 확인이 가능합니다.</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/reserve/reserveList.js"></script>
</body>
</html>