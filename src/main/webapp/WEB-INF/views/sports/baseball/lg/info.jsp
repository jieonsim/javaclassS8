<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매안내</h5>
		<ul class="dsc type2">
			<li>예매오픈시간 : 경기일 기준 7일전 오전 11시</li>
			<li>예매가능시간 : 경기 당일 경기시작 1시간 후까지</li>
			<li>취소가능시간 : 경기시작 2시간 30분 전</li>
		</ul>
		<div class="basic_tbl cost">
			<table>
				<caption>예매 안내</caption>
				<colgroup>
					<col style="width: 150px;">
					<col>
					<col style="width: 140px;">
					<col style="width: 140px;">
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
							<a class="link" href="http://www.ticketlink.co.kr/sports/baseball/59#reservation" target="_blank">경기 예매하기 &gt;</a>
						</td>
						<td rowspan="3">장당 1,000원</td>
						<td rowspan="3">
							경기당
							<span class="fbold color_green">8매 </span>
							예매 가능
							<br>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="th">모바일</div>
						</th>
						<td>
							<a class="link" href="http://www.ticketlink.co.kr/appGuide" target="_blank">앱 다운로드하기 &gt;</a>
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
			<p class="dsc type2">
				* 선예매는 LG트윈스 연간 유료회원에 한하여 제공됩니다.
				<a class="link" href="https://www.lgtwins.com/service/html.ncd?baRs=OUT_DS&amp;view=%2Fpc_twins%2Fticket%2Fticketbuy&amp;actID=BR_RetrieveTicketing" target="_blank">연간 유료회원 예매 바로가기</a>
			</p>
			<!--p class="dsc type2">
				* 주말요금 기준 : 토, 일, 공휴일
				<!a href="http://www.skwyverns.com/Wyverns/game/ticketing/ticketing02/ticketing02.asp?left_idx=171" class="btn">자세히보기</a>
			</p-->
			<p class="dsc type2">* 예매 시, KBO리그 SAFE캠페인에 동의가 필요합니다.</p>
		</div>
	</div>
	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">예매티켓 수령안내</h5>
		<!--img src="../img/sports/kia_stadium.jpg" width="697" height="579" alt="경기장 안내도"-->
		<div class="basic_tbl cost cost_v1">
			<table>
				<caption>예매티켓 수령안내 정보</caption>
				<colgroup>
					<col style="width: 173px;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>티켓수령 방법</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">
							<div class="th">매표소</div>
						</th>
						<td>
							예매전용 매표소 및 전 창구
							<br>
							- 매표소운영 : 경기 시작 1시간30분 전 ~7회초까지
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
					<tr>
						<th scope="row">
							<div class="th">모바일</div>
						</th>
						<td>
							<dl class="ticket_info">
								<!--<dt>[홈티켓]</dt>
					<dd>메뉴 > 예매확인/취소 > 당일 경기 예매상세내역 상단의 바코드를 게이트 직원에게<br> 제시해주세요.<br>
					예매한 티켓의 매수에 맞는 인원은 함께 입장하셔야 합니다.(개별입장 불가)<br> 
					(ex. 4매 예매할 경우 입장 시 4명이 함께 입장하여야 함)<br>
					홈티켓으로 입장한 경우 지류티켓으로 발권이 불가합니다.</dd>-->
								<dt>[스마트티켓]</dt>
								<dd>
									티켓링크 APP &gt; 예매확인/취소 &gt; 예매상세내역에서 스마트티켓 발권이 가능합니다.
									<br>
									스마트티켓은 경기시작 2시간 전부터 발권할 수 있습니다.
									<br>
									스마트티켓으로 발권한 경우 예매한 좌석이 모두 스마트 티켓으로 발권됩니다.
									<br>
									입장 시 게이트에서 스마트티켓 바코드 스캔 후 개별입장이 가능합니다.
									<br>
									스마트티켓은 &lt;선물하기&gt;서비스를 통해 티켓을 주고 받을 수 있습니다.
									<br>
									스마트티켓으로 발권한 후에는 지류티켓으로 발권이 불가합니다.
								</dd>
							</dl>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!--
	<div class="bx_cnt">
		<strong class="tit sell">현장 판매</strong>
		<dl class="sell_info">
			<dt> 판매시간</dt>
			<dd>경기 시작  2시간 전</dd>
			<dt> 판매장소</dt>
			<dd>중앙 매표소 </dd><br><br>
			<dt> 판매수량</dt>
			<dd> 1인 12매 </dd>
		</dl>
		
		<em class="tbl_dsc">현장할인 안내</em>
		<div class="basic_tbl cost cost_v1">
			<table>
			<caption>현장할인 안내</caption>
			<colgroup><col style="width: 174px;"><col style="width: 218px;"><col></colgroup>
			<thead>
				<tr>
					<th>할인대상</th>
					<th>할인내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><div class="th">병역이행자 쿠폰소지자</div></th>
					<td rowspan="2">2,000원 할인(3루내야석, 외야석)</td>
					<td>병무청 발행 할인권 제시</td>
				</tr>
				<tr>
					<th scope="row"><div class="th">병역명문가</div></th>
					<td>병역명문가증 제시</td>
				</tr>
				<tr>
					<th scope="row"><div class="th">국군장병, 직업군인</div></th>
					<td rowspan="4">학생요금과 동일(일반석)<br>-1루단체석(6인, 8인) 제외</td>
					<td>휴가증/외박증, 부대출입증 제시</td>
				</tr>
				<tr>
					<th scope="row"><div class="th">국가유공자</div></th>
					<td rowspan="3">증빙서류 제시</td>
				</tr>
				<tr>
					<th scope="row"><div class="th">경로<br>(1952년 이전 출생자)</div></th>
				</tr>
				<tr>
					<th scope="row"><div class="th">장애인<br>(1~3급)</div></th>
				</tr>
			</tbody>
			</table>
		</div>		
		
		<em class="tbl_dsc">무료입장 안내</em>
		<div class="basic_tbl cost cost_v1">
			<table>
			<caption>무료입장 안내</caption>
			<colgroup><col style="width: 174px;"><col style="width: 218px;"><col></colgroup>
			<thead>
				<tr>
					<th>대상</th>
					<th>해당좌석</th>
					<th>비고</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<th scope="row"><div class="th">36개월 미만</div></th>
					<td> 전 좌석등급(좌석은 미제공)</td>
					<td>주민등록등본 또는 가족관계증명서 제시</td>
				</tr>				
			</tbody>
			</table>
		</div>		
	</div>
	-->

	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">잠실야구장 _ 경기장 안내</h5>

		<ul class="dsc type2">
			<li>
				주소 : 서울 송파구 올림픽로 25 서울종합운동장 잠실야구장
				<br>
				(지번 : 잠실동 10 서울종합운동장)
			</li>

		</ul>

	</div>


	<div class="bx_cnt">
		<h5 class="mgt20" style="font-size: 20px">우천취소 환불</h5>
		<ul class="dsc type2">
			<li>
				우천 취소 시 경기 시작 후, 5회 이전의 경우에는 일괄 취소되며, 5회 이후에는 경기로 인정되어 금액환불이 되지 않습니다.
				<br>
				(※ 홈팀이 이기고 있을 경우 5회 초 종료 후 경기 인정, 원정팀이 이기고 있을 경우 혹은 동점 시 5회 말 종료 후 경기 인정)
			</li>
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
						<td>매표소에서 환불받으실 수 있습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>