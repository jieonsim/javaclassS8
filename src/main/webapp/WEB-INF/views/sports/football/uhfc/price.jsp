<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h5 class="mgt20" style="font-size: 24px">요금안내</h5>
	<div class="basic_tbl cost">
		<table>
			<caption>
				<span class="blind">요금안내</span>
			</caption>
			<colgroup>
				<col style="width: 150px;">
				<col style="width: 110px;">
				<col style="width: 140px;">
				<col style="width: 140px;">
			</colgroup>
			<thead>
				<tr>
					<th>등급</th>
					<th>권종</th>
					<th>주중(화~목)</th>
					<th>주말(금~일,공휴일)</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th rowspan="1" scope="row">켈리존(프리미엄석)</th>
					<td class="sort">일반</td>
					<td class="cost">80,000</td>
					<td class="cost">80,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">테이블석</th>
					<td class="sort">일반</td>
					<td class="cost">47,000</td>
					<td class="cost">53 ,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">익사이팅석</th>
					<td class="sort">일반</td>
					<td class="cost">25,000</td>
					<td class="cost">30,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">블루석</th>
					<td class="sort">일반</td>
					<td class="cost">20,000</td>
					<td class="cost">22,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">오렌지석(응원석)</th>
					<td class="sort">일반</td>
					<td class="cost">18,000</td>
					<td class="cost">20,000</td>
					<td class="cost">
						1루 205~208B
						<br>
						3루 219~222B
					</td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">레드석</th>
					<td class="sort">일반</td>
					<td class="cost">16,000</td>
					<td class="cost">18,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="1" scope="row">네이비석</th>
					<td class="sort">일반</td>
					<td class="cost">13,000</td>
					<td class="cost">15,000</td>
					<td class="cost"></td>
				</tr>

				<tr>
					<th rowspan="3" scope="row">외야그린석</th>
					<td class="sort">일반</td>
					<td class="cost">8,000</td>
					<td class="cost">9,000</td>
					<td class="cost"></td>
				</tr>
				<tr>
					<td class="sort">청소년</td>
					<td class="cost">6,000</td>
					<td class="cost">7,000</td>
					<td class="cost"></td>
				</tr>
				<tr>
					<td class="sort">어린이</td>
					<td class="cost">4,000</td>
					<td class="cost">4,500</td>
					<td class="cost"></td>
				</tr>
				<tr>
					<th rowspan="1" scope="row">휠체어석(블루석)</th>
					<td class="sort">일반(본인만)</td>
					<td class="cost">10,000</td>
					<td class="cost">11,000</td>
					<td class="cost">
						1루 109B
						<br>
						3루 114B
					</td>
				</tr>
				<tr>
					<th rowspan="1" scope="row">휠체어석(레드석)</th>
					<td class="sort">일반(본인만)</td>
					<td class="cost">8,000</td>
					<td class="cost">9,000</td>
					<td class="cost">
						1루 101~102B
						<br>
						3루 121~122B
					</td>
				</tr>

			</tbody>
		</table>
	</div>

	<!--
	<div class="cost_info">
		<h5><img src="http://ticketlink.dn.toastoven.net/web/sports/main/img/sports/sports_main_03.png" alt="구단 안내"></h5>
		<p class="desc">요금표의 주말 기준은 금, 토, 일, 공휴일입니다.</p>
		<p class="desc">오렌지석(응원석)은 1루 205~208B/3루 219~222B입니다.</p>
		<p class="desc">휠체어석은 101~102B, 109B, 114B, 121~122B입니다.</p>
    
	</div>-->

	<div class="cost_info">
		<p class="desc">요금표의 주말 기준은 금, 토, 일, 공휴일입니다.</p>
		<p class="desc">매표소운영 : 경기 시작 1시간30분 전&nbsp; ~7회초까지​</p>

		<br>
		<h5 class="mgt20" style="font-size: 24px">할인안내</h5>
		<div class="basic_tbl cost cost_v1">
			<table>
				<colgroup>
					<col style="width: 173px;">
					<col style="width: 285px;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>할인대상</th>
						<th>할인내용</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">신한카드</th>
						<td class="sort">
							<b>블루석 이하 경기당 1매 2,000원 할인</b>
						</td>
						<td>특정 27개카드만 할인가능</td>
					</tr>
					<tr>
						<th scope="row">LG트윈스 신한카드</th>
						<td class="sort">
							<b>블루석 이하 경기당 1매 3,000원 청구할인</b>
						</td>
						<td>LG트윈스 신한카드 권종 선택 후 결제</td>
					</tr>
					<tr>
						<th scope="row">LG트윈스 신한카드 체크</th>
						<td class="sort">
							<b>블루석 이하 경기당 1매 3,000원 선할인</b>
						</td>
						<td>LG트윈스 신한카드 체크 권종 선택 후 결제</td>
					</tr>
					<tr>
						<th scope="row">문화누리카드</th>
						<td class="sort">
							<b>블루석 이하 경기당 4매 40%할인</b>
						</td>
						<td>
							현장매표소에서 실물카드 확인 후 티켓발권 가능
							<br>
							(일반가 기준)
						</td>
					</tr>
					<tr>
						<th scope="row">LG U+ 일반</th>
						<td class="sort">
							<b>블루석 이하 경기당 2,000원 할인</b>
						</td>
						<td rowspan="2">1일 1매 한정, 포인트차감</td>
					</tr>
					<tr>
						<th scope="row">LG U+ VIP</th>
						<td class="sort">
							<b>블루석 이하 경기당 3,000원 할인</b>
						</td>
					</tr>
					<tr>
						<th rowspan="3" scope="row">외야그린석 할인</th>
						<td class="sort">
							<b>경로, 장애, 국가유공자 50%할인(본인만)</b>
						</td>
						<td rowspan="3">
							증빙서류 필요
							<br>
							예매할인되는 권종과 함께구매한 예매건은 매표소에서만 발권가능
							<br>
							(무인발권기, 스마트티켓 이용 불가)
							<br>
							군경 할인은 일반 사병만 가능
							<br>
							(직업군인,경찰 불가)
						</td>
					</tr>
					<tr>
						<td class="sort">
							<b>청소년(중,고등학생)/군경 2,000원 할인</b>
						</td>
					</tr>
					<tr>
						<td class="sort">
							<b>어린이(36개월이상~초등학생) 50%할인</b>
						</td>
					</tr>
					<tr>
						<th scope="row">문화가 있는날</th>
						<td class="sort">
							<b>매월 마지막 주 수요일 외야그린석 50%할인</b>
							<br>
							(2024년 3/27,6/26,7/31,8/28)
							<br>
						</td>
						<td>별도 중복할인 불가</td>
					</tr>
					<tr>
						<th scope="row">미취학아동</th>
						<td class="sort" colspan="2">
							<b>36개월 미만 어린이 본인에 한해 무료입장 가능</b>
							<br>
							(단, 좌석 점유시 티켓 구매 필요)
						</td>
					</tr>
					<tr>
						<th scope="row">휠체어석 할인</th>
						<td class="sort" colspan="2">
							<b>휠체어장애인에 한해 50%할인(블루석 이하 등급 정가 기준)</b>
							<br>
							단, 동반인티켓은 예매시 좌석 선택 후 권종에서 "동반1인" 선택 결제 후
							<br>
							티켓1장으로 2명 입장 가능
							<br>
							동반인석은 1인만 구매가능, 추가인원은 그 주변 등급좌석으로 예매
							<br>
							<br>
							<b>휠체어석 위치(101B, 122B - 동반인석 없음)</b>
							<br>
							1루 101~102B, 109B / 3루 114B, 121~122B
							<br>
							<br>
							<b>티켓수령</b>
							: 제 1매표소 장애인창구에서 증빙서류 확인 후 수령가능
						</td>


					</tr>

					<tr>
						<th scope="row">장애인 할인</th>
						<td class="sort">
							<b>블루석 이하 등급 50%할인(본인만)</b>
						</td>
						<td class="sort">
							증빙서류 필요
							<br>
							예매할인되는 권종과 함께구매한 예매건은 매표소에서만 발권가능
							<br>
							(무인발권기, 스마트티켓 이용 불가)
						</td>

					</tr>

				</tbody>
			</table>
		</div>

	</div>
	<br>

	<div class="cost_info">
		<h5 class="mgt20" style="font-size: 16px">선할인 신한카드 안내(2024년)</h5>
		<div class="basic_tbl cost cost_v1">
			<table>
				<caption>신한카드할인안내(2024년)</caption>
				<colgroup>
					<col style="width: 173px;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>카드목록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">
							<div class="th">
								신한카드
								<br>
								(27개 카드만가능)
							</div>
						</th>
						<td>
							The Lady Best, Lady, Lady(체크), 2030, 2030(체크), Young Lady, Big Plus GS 칼텍스,
							<br>
							Big Plus GS 칼텍스(체크), SK엔크린, GS칼텍스보너스PLUS, The Best, LOVE,​ SK행복​
							<br>
							GS칼텍스 Dream 100, S-OIL보너스+100, ​THE YOU SK, 현대오일뱅크오일세이빙100, ​The Classic,​
							<br>
							SK에너지 Oiling, GS칼텍스 shine, 이마트, 이마트(체크), LOVE Platinum#, The Classic-L
						</td>
					</tr>
				</tbody>
			</table>
		</div>


		<h5 class="mgt20" style="font-size: 16px">할인카드안내</h5>
		<div class="salecrd_wrap">
			<ul class="salecrd_lst">

				<li>
					<a href="http://www.ticketlink.co.kr/help/guide/discountCard/baseball">
						<img width="80" height="50" alt="" src="http://ticketlink.dn.toastoven.net/web/sports/main/img/sports/crd_nh_culture.png">
					</a>
					<dl class="info">
						<dt>문화누리카드</dt>
						<dd>
							블루석이하
							<br>
							<span class="sale">40% 할인(경기당 4매)</span>
						</dd>
					</dl>
				</li>

				<li>
					<a href="http://www.ticketlink.co.kr/help/guide/discountCard/baseball">
						<img width="80" height="50" alt="" src="http://image.toast.com/aaaaab/ticketlink/TKL_8/LGTwins_Shinhan(1).png">
					</a>
					<dl class="info">
						<dt>LG트윈스 신한카드</dt>
						<dd>
							블루석이하
							<br>
							<span class="sale">3,000원 할인(청구할인)</span>
						</dd>
					</dl>
				</li>

				<li>
					<a href="http://www.ticketlink.co.kr/help/guide/discountCard/baseball">
						<img width="80" height="50" alt="" src="http://image.toast.com/aaaaab/ticketlink/TKL_1/shinhan.png">
					</a>
					<dl class="info">
						<dt>신한카드(27개특정)</dt>
						<dd>
							블루석이하
							<br>
							<span class="sale"> 2,000원 할인(경기당 1매)</span>
						</dd>
					</dl>
				</li>

				<li>
					<a href="http://www.ticketlink.co.kr/help/guide/discountCard/baseball">
						<img width="80" height="50" alt="" src="http://image.toast.com/aaaaab/ticketlink/TKL_9/LGTwins_Shinhancheck.png">
					</a>
					<dl class="info">
						<dt>LG트윈스 신한카드 체크</dt>
						<dd>
							블루석이하
							<br>
							<span class="sale"> 3,000원 할인(경기당 1매)</span>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
</div>