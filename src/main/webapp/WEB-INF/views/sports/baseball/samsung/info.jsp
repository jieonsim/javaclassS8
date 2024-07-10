<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<!-- 구단안내 -->

	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매안내</h5>
		<ul class="dsc type2">
			<li>예매오픈시간 : 경기일 기준 7일전 11시(3연전 동시오픈)</li>
			<li>예매가능시간 : 경기시작 후 1시간까지</li>
			<li>취소가능시간 : 경기시작 전까지</li>

		</ul>
		<div class="basic_tbl cost">
			<table>
				<caption>예매 안내</caption>
				<colgroup>
					<col style="width: 150px">
					<col>
					<col style="width: 140px">
					<col style="width: 140px">
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>예매방법</th>
						<th>예매수수료</th>
						<th>판매수량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">
							<div class="th">인터넷</div>
						</th>
						<td>
							<a class="link" href="http://www.ticketlink.co.kr/sports/baseball/57#reservation" target="_blank">경기 예매하기 &gt;</a>
						</td>
						<td rowspan="3">장당 1,000원</td>
						<td rowspan="3">
							경기당&nbsp;
							<span class="fbold color_green">8매</span>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="th">모바일</div>
						</th>
						<td>
							<a href="http://www.ticketlink.co.kr/appGuide" target="_blank" class="link">앱 다운로드하기 &gt;</a>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="th">전화예매</div>
						</th>
						<td>
							고객센터
							<span class="ico_phone"></span>
							1588-7890 (10:00~19:00)
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="bx_dsc">
			<p class="dsc type2">* 주말요금 기준 : 금, 토, 일, 공휴일</p>
			<p class="dsc type2">
				* 예매 시, KBO리그 SAFE캠페인에 동의가 필요합니다.
			</p>
		</div>
	</div>

	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">대구삼성라이온즈파크_ 경기장 안내</h5>
		<ul class="dsc type2">
			<li>
				대구삼성라이온즈파크 주소 : 대구광역시 수성구 야구전설로 1 대구삼성라이온즈파크
				<br>
				(지번 : 대구광역시 수성구 연호동 648)
			</li>
			<li>
				포항야구장 주소 : 경상북도 포항시 남구 희망대로 790
				<br>
				(지번 : 경상북도 포항시 남구 대도동 381-4)
			</li>

		</ul>


	</div>
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">우천취소 환불</h5>
		<ul class="dsc type2">
			<li>우천 취소 시 경기 시작 후, 5회 이전의 경우에는 일괄 취소되며, 5회 이후에는 경기로 인정되어 금액환불이 되지 않습니다.</li>
			<li>우천취소 확정 이전에 본인이 직접 취소하시는 경우, 취소환불 규정에 따라 취소수수료가 부과됩니다.</li>
		</ul>
		<div class="basic_tbl cost">
			<table>
				<caption>구단 안내</caption>
				<colgroup>
					<col style="width: 108px">
					<col style="width: 115px">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>결제수단</th>
						<th>환불방법</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" rowspan="4">예매/현장구매</th>
						<td>신용카드</td>
						<td>자동취소 처리됩니다. (취소일부터 영업일 기준 3~5일 후 카드사에서 확인가능)</td>
					</tr>
					<tr>
						<td>계좌이체</td>
						<td>결제한 계좌로 추후 입금됩니다.</td>
					</tr>
					<tr>
						<td>무통장입금</td>
						<td>
							등록하신 환불계좌로 추후 입금됩니다.
							<br>
							<a href="http://www.ticketlink.co.kr/my/memberInfo/refundAccount" target="_blank" class="link">환불계좌 등록/변경하기 &gt;</a>
						</td>
					</tr>
					<tr>
						<td>현금(현장)</td>
						<td>매표소에서 환불받으실 수 있습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<!-- //구단안내 -->
</div>