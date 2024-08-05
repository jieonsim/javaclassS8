<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매안내</h5>
		<ul class="dsc type2">
			<li>예매오픈시간 : 경기일 기준 7일전 오전 11시</li>
			<li>예매가능시간 : 경기 당일 경기시작 1시간 후까지</li>
			<li>취소가능시간 : 경기시작 2시간 전</li>
		</ul>
	</div>
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매티켓 수령안내</h5>
		<div class="basic_tbl cost cost_v1">
			<table>
				<caption>예매티켓 수령안내 정보</caption>
				<colgroup>
					<col style="width: 173px;">
					<col>
				</colgroup>
				<thead class="text-center">
					<tr>
						<th>구분</th>
						<th>티켓수령 방법</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<th scope="row">
							<div class="th">매표소</div>
						</th>
						<td>
							예매전용 매표소 및 전 창구
							<br>
							- 매표소운영 : 경기 시작 1시간30분 전 ~ 경기 종료 전까지
							<br>
							- 당일 경기만 발권가능합니다.
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="th">무인발권기</div>
						</th>
						<td>
							무인발권기에서 생년월일과 예매번호를 입력하시면 티켓이 출력됩니다.
							<br>
							- 현장증빙이 필요한 경우 무인발권기 사용이 불가합니다.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">${venueName} 경기장 안내</h5>
		<ul class="dsc type2">
			<li>주소 : ${address}</li>
		</ul>
	</div>
	<div class="bx_cnt">
		<div class="basic_tbl cost">
			<table>
				<caption>구단 안내</caption>
				<colgroup>
					<col style="width: 108px;">
					<col style="width: 115px;">
					<col>
				</colgroup>
				<thead class="text-center">
					<tr>
						<th>구분</th>
						<th>결제수단</th>
						<th>환불방법</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<th rowspan="4" scope="row">예매/현장구매</th>
						<td>신용카드</td>
						<td>자동취소 처리됩니다. (취소일부터 영업일 기준 3~5일 후 카드사에서 확인가능)</td>
					</tr>
					<tr>
						<td>스포츠 예매권</td>
						<td>
							사용하신 스포츠 예매권은 예매 취소 시 원복되며,
							<br>
							유효기간 내 재사용하실 수 있습니다.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>