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
						<li class="on">
							<a href="#">예매확인</a>
						</li>
						<li>
							<a href="#">예매취소</a>
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
								<tr class="ng-scope">
									<td class="fs12 number">
										<a class="point_number ng-binding"> 1469024617 </a>
									</td>
									<td class="tl ng-scope">
										<span class="elp ng-scope">
											<span class="ng-binding ng-scope">LG트윈스 vs 삼성 라이온즈</span>
										</span>
									</td>
									<td class="fs12 number ng-binding">2024.07.30(화) 18:30</td>
									<td class="ng-binding">1장</td>
									<td class="fs12 number color_point ng-binding">2024.07.30 16:00</td>
									<td>
										<div class="reserve_condition1 ng-binding">
											예매완료
											<span class="ng-binding ng-hide"> () </span>
										</div>
										<div class="reserve_condition2 ng-binding ng-hide" ng-show="reserve.cancelDatetime != null"></div>
										<div class="reserve_condition2" ng-show="reserve.cancelDatetime == null">
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'WAIT'" ng-click="fn.common.openAccount(reserve.reserveNo)">입금안내</a>
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'RAIN_CANCEL'">환불계좌</a>
										</div>
									</td>
								</tr>
								<!-- end ngRepeat: reserve in reserveList -->
								<tr ng-repeat="reserve in reserveList" ng-show="reserveList.length > 0" class="ng-scope">
									<td class="fs12 number">
										<a href="/my/reserve/1469014738" class="point_number ng-binding"> 1469014738 </a>
									</td>
									<td class="tl ng-scope" ng-if="reserve.productDetailInfoExposureYn == 'N'">
										<span class="elp ng-scope" style="text-align: center;" ng-if="reserve.displayProductType === 'SPORTS_TEAM_MATCH'">
											<span ng-if="reserve.teamMatchUseYn === 'Y'" class="ng-binding ng-scope">LG트윈스 vs 삼성 라이온즈</span>
										</span>
									</td>
									<td class="fs12 number ng-binding">2024.07.30(화) 18:30</td>
									<td class="ng-binding">1장</td>
									<td class="fs12 number color_point ng-binding">2024.07.30 16:00</td>
									<td>
										<div class="reserve_condition1 ng-binding">
											예매완료
											<span ng-show="reserve.cancelReason != null &amp;&amp; reserve.cancelReason.isFrontExposable" class="ng-binding ng-hide"> () </span>
										</div>
										<div class="reserve_condition2 ng-binding ng-hide" ng-show="reserve.cancelDatetime != null"></div>
										<div class="reserve_condition2" ng-show="reserve.cancelDatetime == null">
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'WAIT'" ng-click="fn.common.openAccount(reserve.reserveNo)">입금안내</a>
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'RAIN_CANCEL'">환불계좌</a>
										</div>
									</td>
								</tr>
								<tr ng-repeat="reserve in reserveList" ng-show="reserveList.length > 0" class="ng-scope">
									<td class="fs12 number">
										<a href="/my/reserve/1468953432" class="point_number ng-binding"> 1468953432 </a>
									</td>
									<td class="tl ng-scope" ng-if="reserve.productDetailInfoExposureYn == 'N'">
										<span class="elp ng-scope" ng-if="reserve.displayProductType === 'SPORTS_TEAM_MATCH'">
											<span ng-if="reserve.teamMatchUseYn === 'Y'" class="ng-binding ng-scope">SSG 랜더스 vs 롯데자이언츠</span>
										</span>
									</td>
									<td class="fs12 number ng-binding">2024.08.01(목) 18:30</td>
									<td class="ng-binding">2장</td>
									<td class="fs12 number color_point ng-binding">2024.08.01 14:30</td>
									<td>
										<div class="reserve_condition1 ng-binding">
											예매완료
											<span ng-show="reserve.cancelReason != null &amp;&amp; reserve.cancelReason.isFrontExposable" class="ng-binding ng-hide"> () </span>
										</div>
										<div class="reserve_condition2 ng-binding ng-hide" ng-show="reserve.cancelDatetime != null"></div>
										<div class="reserve_condition2" ng-show="reserve.cancelDatetime == null">
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'WAIT'" ng-click="fn.common.openAccount(reserve.reserveNo)">입금안내</a>
											<a href="javascript:;" class="btn btn_blank ng-hide" ng-show="reserve.reserveStateCode.name == 'RAIN_CANCEL'">환불계좌</a>
										</div>
									</td>
								</tr>
								<!-- 예매내역 없을 때 -->
								<tr ng-show="reserveList.length === 0" class="ng-hide">
									<td colspan="6" class="no_data">예매한 내역이 없습니다.</td>
								</tr>
								<tr><td colspan="6" class="m-0 p-0"></td></tr>
							</tbody>
						</table>
					</div>
					<jsp:include page="/WEB-INF/views/layout/paginate.jsp" />
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
</body>
</html>