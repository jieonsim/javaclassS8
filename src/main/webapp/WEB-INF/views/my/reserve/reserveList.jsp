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
<link rel="stylesheet" href="${ctp}/css/my/memberInfo/matchPassword.css">
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
						<li ng-class="{'on': search.state.name === stateType['PARTIALLY_COMPLETE'] }" ng-click="fn.toggleReserveType(stateType['PARTIALLY_COMPLETE'])" class="on">
							<a href="#">예매확인</a>
						</li>
						<li ng-class="{'on': search.state.name === stateType['ALL_CANCEL'] }" ng-click="fn.toggleReserveType(stateType['ALL_CANCEL'])">
							<a href="#">예매취소</a>
						</li>
					</ul>
					<div class="sortbx">
						<dl class="daysortbx fl">
							<dt>기간별 조회</dt>
							<dd>
								<ul class="daysort">
									<!-- ngRepeat: period in periodList -->
									<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
										<a href="javascript:;" ng-click="periodSelection.select(period)" class="ng-binding">15일</a>
									</li>
									<!-- end ngRepeat: period in periodList -->
									<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope on">
										<a href="javascript:;" ng-click="periodSelection.select(period)" class="ng-binding">1개월</a>
									</li>
									<!-- end ngRepeat: period in periodList -->
									<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
										<a href="javascript:;" ng-click="periodSelection.select(period)" class="ng-binding">2개월</a>
									</li>
									<!-- end ngRepeat: period in periodList -->
									<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
										<a href="javascript:;" ng-click="periodSelection.select(period)" class="ng-binding">3개월</a>
									</li>
									<!-- end ngRepeat: period in periodList -->
								</ul>
							</dd>
						</dl>
						<dl class="monthsortbx fr">
							<dt>월 별 조회</dt>
							<dd>
								<!-- [D] 셀렉트박스 -->
								<div class="selectbox" ng-init="targetDaySelection.close()" ng-class="{'is-active': targetDaySelection.isOpened()}">
									<a href="javascript:;" class="select ng-binding" ng-click="targetDaySelection.open()">예매일</a>
									<ul class="select_list ng-hide" style="display: block" ng-show="targetDaySelection.isOpened()">
										<!-- ngRepeat: targetDay in targetDayList -->
										<li ng-repeat="targetDay in targetDayList" class="ng-scope">
											<a href="javascript:;" ng-click="targetDaySelection.select(targetDay)" class="ng-binding">예매일</a>
										</li>
										<!-- end ngRepeat: targetDay in targetDayList -->
										<li ng-repeat="targetDay in targetDayList" class="ng-scope">
											<a href="javascript:;" ng-click="targetDaySelection.select(targetDay)" class="ng-binding">관람일</a>
										</li>
										<!-- end ngRepeat: targetDay in targetDayList -->
									</ul>
								</div>
								<!-- [D] 셀렉트박스 -->
								<div class="selectbox" ng-init="yearSelection.close()" ng-class="{'is-active': yearSelection.isOpened()}">
									<a href="javascript:;" class="select" ng-show="search.year == null" ng-click="yearSelection.open()">연도</a>
									<a href="javascript:;" class="select ng-binding ng-hide" ng-show="search.year != null" ng-click="yearSelection.open()">년</a>
									<ul class="select_list ng-hide" style="display: block" ng-show="yearSelection.isOpened()">
										<!-- ngRepeat: year in fn.common.before3Years() -->
										<li ng-repeat="year in fn.common.before3Years()" class="ng-scope">
											<a href="javascript:;" ng-click="yearSelection.select(year)" class="ng-binding">2024년</a>
										</li>
										<!-- end ngRepeat: year in fn.common.before3Years() -->
										<li ng-repeat="year in fn.common.before3Years()" class="ng-scope">
											<a href="javascript:;" ng-click="yearSelection.select(year)" class="ng-binding">2023년</a>
										</li>
										<!-- end ngRepeat: year in fn.common.before3Years() -->
										<li ng-repeat="year in fn.common.before3Years()" class="ng-scope">
											<a href="javascript:;" ng-click="yearSelection.select(year)" class="ng-binding">2022년</a>
										</li>
										<!-- end ngRepeat: year in fn.common.before3Years() -->
									</ul>
								</div>
								<!-- [D] 셀렉트박스 -->
								<div class="selectbox" id="month" ng-init="monthSelection.close()" ng-class="{'is-active': monthSelection.isOpened()}">
									<a href="javascript:;" class="select ng-binding" ng-click="monthSelection.open()">월</a>
									<ul class="select_list ng-hide" style="display: block" ng-show="monthSelection.isOpened()">
										<!-- ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">1월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">2월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">3월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">4월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">5월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">6월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">7월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">8월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">9월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">10월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">11월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
										<li ng-repeat="month in fn.common.range(1, 12)" class="ng-scope">
											<a href="javascript:;" ng-click="monthSelection.select(month)" class="ng-binding">12월</a>
										</li>
										<!-- end ngRepeat: month in fn.common.range(1, 12) -->
									</ul>
								</div>
								<a href="javascript:;" class="btn btn_blank" ng-click="fn.search(1, 'MONTHLY')">조회</a>
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
							<thead>
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">티켓명</th>
									<th scope="col">관람일시</th>
									<th scope="col">매수</th>
									<th scope="col">취소가능일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<!-- ngRepeat: reserve in reserveList -->
								<tr ng-show="reserveList.length === 0">
									<td colspan="6" class="no_data">예매한 내역이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div>
						<div class="paging ng-isolate-scope" paging="paging" search="fn.search">
							<a href="javascript:;" class="first" ng-click="search(pagingService.initialPage)">맨앞</a>
							<a href="javascript:;" class="prev" ng-click="search(pagingService.getPreviousPage(paging))">이전</a>
							<!-- ngRepeat: index in pagingService.getPreIndexList(paging) -->
							<strong class="ng-binding">1</strong>
							<!-- ngRepeat: index in pagingService.getPostIndexList(paging) -->
							<a href="javascript:;" class="next" ng-click="search(pagingService.getNextPage(paging))">다음</a>
							<a href="javascript:;" class="end" ng-click="search(pagingService.getPageCount(paging))">맨뒤</a>
						</div>
					</div>

					<div class="mypage_banner">
						<script type="text/javascript" src="//ads.netinsight.co.kr/NetInsight/js/ticketlink/mypage/742@120"></script>
					</div>

					<!-- nottes -->
					<div class="notes2">
						<h6>
							<span></span>
							티켓취소 안내
						</h6>
						<ol>
							<li>
								예매한 티켓 전체 취소, 혹은 신용카드 결제 시 부분 취소가 가능합니다.
								<br>
								단, 일부 상품 및 스마트티켓 발권 시 부분취소가 불가합니다.
							</li>
							<li>티켓이 배송된 이후에는 인터넷이나 고객센터를 통한 취소가 불가하며, 받으신 티켓을 취소일 전까지 NHN LINK 본사로 반송을 해주셔야 취소 가능합니다. (등기우편을 이용해주세요!)</li>
							<li>예매 당일 자정까지 취소하실 경우는 예매수수료도 환불되며, 취소수수료가 부과되지 않습니다. 그 이후에 취소하실 경우는 예매수수료가 환불되지 않으며, 취소수수료는 정책에 따라 부과됩니다.</li>
							<li>일부 경기의 경우 상황에 따라 일괄 취소 건이 발생할 수있으며, 일괄 취소 시에는 취소 수수료가 부과되지 않습니다.</li>
							<li>티켓의 날짜/시간/좌석 등급/좌석 위치 변경은 불가합니다. 자세한 안내가 필요할 경우 고객센터를 이용해주세요.</li>
							<li>구단 홈페이지에서 예매한 내역은 구단 홈페이지에서만 확인이 가능합니다.</li>
						</ol>
					</div>
					<!-- //nottes -->
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/memberInfo/changePassword.js"></script>
</body>
</html>