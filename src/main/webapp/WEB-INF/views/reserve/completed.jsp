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
				<li class="step3">
					<span class="ng-binding ng-scope">권종/할인/매수선택</span>
				</li>
				<li class="step4">
					<span class="ng-binding ng-scope">예매확인</span>
				</li>
				<li class="step5 on">
					<span class="ng-binding ng-scope">결제</span>
				</li>
			</ul>
			<h2 class="blind">예매확인</h2>
		</div>
		<div id="container">
			<div class="reserve_left">
				<div class="pointb_box">
					<p class="inner_txt reserve_end">티켓예매가 완료되었습니다.</p>
				</div>
				<div class="white_box mgt10 ng-scope">
					<dl class="goods_info sports_info">
						<div class="bx">
							<dt class="blind">대표이미지</dt>
							<dt class="img_title ng-scope">
								<em> <img src="${ctp}/images/sports/emblem/${game.homeTeamShortName}.png">
								</em>
								<span class="versus sp_sports">vs</span>
								<em> <img src="${ctp}/images/sports/emblem/${game.awayTeamShortName}.png">
								</em>
							</dt>
						</div>
						<div class="bx">
							<dt>예매번호</dt>
							<dd class="ng-binding">${reservationNumber}&nbsp;(총&nbsp;${ticketAmount}매)</dd>
						</div>
						<div class="bx">
							<dt>티켓명</dt>
							<dd class="ng-binding">
								<span class="ng-binding ng-scope"> ${game.homeTeamName}&nbsp;vs&nbsp;${game.awayTeamName} </span>
							</dd>
						</div>
						<div class="bx">
							<dt>장소</dt>
							<dd class="ng-binding">${game.venueName}</dd>
						</div>
						<div class="bx">
							<dt>일시</dt>
							<dd class="ng-binding">${gameDateTime}</dd>
						</div>
						<div class="bx seat_bx ng-scope">
							<dt>
								<button type="button" class="btn_seat">좌석</button>
							</dt>
							<dd>
								<c:forEach var="seatDetail" items="${seatDetails}">
									<p class="ng-binding ng-scope">[${seat.seatName}] ${seatDetail.seatBlock}블록 ${seatDetail.seatRow}열 ${seatDetail.seatNumber}번</p>
								</c:forEach>
							</dd>
						</div>
					</dl>
				</div>
				<div class="white_box fin_box_left">
					<dl class="reserve_info">
						<dt>예매자</dt>
						<dd class="ng-binding">${member.name}</dd>
						<dt>연락처</dt>
						<dd class="ng-binding">${member.phone}</dd>
						<dt>티켓수령</dt>
						<dd class="ng-binding ng-scope">현장수령</dd>
					</dl>
				</div>
				<div class="white_box fin_box_right">
					<table>
						<caption>결제정보</caption>
						<colgroup>
							<col style="width: 70px;">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>총 결제금액</th>
								<td class="ng-binding">
									<fmt:formatNumber value="${totalAmount}" type="number" />
									원
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>티켓금액</th>
								<td class="ng-binding">
									<fmt:formatNumber value="${ticketPrice}" type="number" />
									원
								</td>
							</tr>
							<tr>
								<th>예매수수료</th>
								<td class="ng-binding">
									<fmt:formatNumber value="${bookingFee}" type="number" />
									원
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="reserve_right">
				<div class="notice_end" style="margin-top: 20px;">
					<strong><span>유의사항</span></strong>
					<div class="ng-binding">
						<span style="font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 9pt;">
							<b>예매 안내</b>
							<br>
							- 예매마감시간 : 경기 당일 경기 시작 1시간 후까지 가능
							<br>
							&nbsp;(경기당일 경기 시작 2시간 전 ~ 경기 시작 1시간 후까지 예매분은 취소 불가)
							<br>
							- 예매취소시간 : 경기 당일 경기 시작 2시간전까지 가능
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
							- 현장매표소 이용 시 예매번호, 성명, 휴대폰번호 뒷자리 확인이 필요합니다.
							<br>
							- 무인발권기 이용 시 예매번호와 휴대폰번호 입력이 필요합니다.​
							<br>
							<br>
							- 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
						</span>
					</div>
				</div>
				<div class="reserve_btn">
					<a class="btn btn_blank ng-scope">내역 프린트</a>
					<a href="${ctp}/my/reserve/list" class="btn btn_full">예매확인</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>