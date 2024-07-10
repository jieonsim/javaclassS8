<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매/현장판매 안내</h5>
		<ul class="dsc type2">
			<li>예매오픈시간 : 경기일 기준 7일전 오전 11시(1경기씩)</li>
			<li>예매가능시간 : 경기 당일 경기시작 시간까지</li>
			<li>취소가능시간 : 경기 당일 경기시작 2시간 전까지</li>
			<li>현장판매시간 : 평일 (화~금) 경기시작 1시간30분 전 / 주말(토.일) : 경기시작시간 2시간 전</li>
		</ul>
		<br>
		<h5 class="mgt20" style="font-size: 20px">한화생명 이글스 파크 _ 경기장 안내</h5>
		<ul class="dsc type2">
			<li>주소 : 대전광역시 중구 대종로 373</li>
			<li>TEL : 042-530-8200</li>
			<li>
				신축 야구장 건설에 따른 한밭종합운동장 공사 진행으로 인하여 한화생명이글스파크 내부 지상 주차가 제한됩니다.
				<br>
				지하 주차장은 기존과 동일하게 이용이 가능합니다.
			</li>
		</ul>
		<br>


		<div class="bx_cnt">
			<h5 class="mgt20" style="font-size: 20px">우천취소 환불안내</h5>
			<ul class="dsc type2">
				<li>우천 취소 시 경기 시작 후, 5회 이전의 경우에는 일괄 취소되며, 5회 이후에는 경기로 인정되어 금액환불이 되지 않습니다.</li>
				<li>우천취소 확정 이전에 본인이 직접 취소하시는 경우, 취소환불 규정에 따라 취소수수료가 부과됩니다.</li>
			</ul>
			<div class="basic_tbl cost">
				<table>
					<caption>구단 안내</caption>
					<colgroup>
						<col style="width: 108px;">
						<col style="width: 115px;">
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
							<th rowspan="4" scope="row">예매/현장구매</th>
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
								<a class="link" href="http://www.ticketlink.co.kr/my/memberInfo/refundAccount" target="_blank">환불계좌 등록/변경하기 &gt;</a>
							</td>
						</tr>
						<tr>
							<td>현금(현장)</td>
							<td>
								<p>매표소에서 환불받으실 수 있습니다.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<br>

	<img src="http://image.toast.com/aaaaab/ticketlink/TKL_8/day_ticketInfo_detail.png" title="day_ticketInfo_detail.png">
	<br style="clear: both;">
</div>