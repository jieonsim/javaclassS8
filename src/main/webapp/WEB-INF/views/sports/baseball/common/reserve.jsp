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
				<li class="step2 on">
					<span class="ng-binding ng-scope">등급/좌석선택</span>
				</li>
				<li class="step3">
					<span class="ng-binding ng-scope">권종/할인/매수선택</span>
				</li>
				<li class="step4">
					<span class="ng-binding ng-scope">배송선택/예매확인</span>
				</li>
				<li class="step5">
					<span class="ng-binding ng-scope">결제</span>
				</li>
			</ul>
			<h2 class="blind">좌석선택</h2>
		</div>
		<div id="container" class="ng-isolate-scope">
			<div class="reserve_content">
				<div class="reserve_left reserve_left_type1 ng-isolate-scope">
					<div class="reserve_prdt_info">
						<div class="tit tit_type1">
							<h4 class="prdt ng-binding">KIA 타이거즈 vs NC 다이노스</h4>
						</div>
						<p class="etc_info etc_info_type1">
							<span class="date ng-binding">2024.07.25(목) 18:30</span>
							<span class="place ng-binding">KIA 챔피언스필드</span>
						</p>
						<!-- [D] tit에 마우스 올라간 경우 tit_tooltip display:block 해주시고,
                 tit_tooltip이 block된 상태일땐 마우스나 tit_tooltip 영역을 벗어났을때 none처리 해주세요 -->
						<div class="tit_tooltip" style="display: none;">
							<h4 class="prdt ng-binding">KIA 타이거즈 vs NC 다이노스</h4>
							<p class="place ng-binding">- KIA 챔피언스필드</p>
						</div>
					</div>
					<div id="main_view_top" class="select_seat ng-isolate-scope">
						<a class="btn reserve_wait ng-hide" ng-show="showInSaleButton" ng-click="reservationWaitingPage()" style="z-index: 99;">
							<p class="btn_txt">원하는 좌석이 없다면?</p>
						</a>
						<a class="btn reserve_wait not_started ng-hide" ng-show="showReadyButton" ng-click="showNotSaleReservationWaiting()" style="display: block; z-index: 99;">
							<p class="btn_txt">취소표대기 언제 신청할 수 있어요?</p>
						</a>
						<div id="main_view" class="in" style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: default;">
							<!-- 미사용, 사용시 이미지 경로 수정 필요 -->
							<!--<img-->
							<!--ng-show="!view.viewState.isViewOn()"-->
							<!--src="{{view.global.imgUrl}}/reserve_tx2.jpg"-->
							<!--width="281"-->
							<!--height="46"-->
							<!--alt="자동배정으로 예매 진행이 가능합니다. 등급을 먼저 선택 후, 다음 단계를 선택해주세요."-->
							<!--class="rs_alert">-->
							<canvas width="680" height="604" style="position: absolute; z-index: 0; display: none;"></canvas>
							<canvas width="680" height="604" style="position: absolute; z-index: 4; display: block;"></canvas>
							<canvas width="200" height="100" style="position: absolute; z-index: 5; display: none;"></canvas>
							<canvas width="680" height="604" style="position: absolute; z-index: 5; display: block;"></canvas>
						</div>

						<div class="map_info" id="stage_direction" style="z-index: 5; display: none;">
							<p class="tx ng-binding">경기장/무대 방향</p>
						</div>

						<div id="seat_option" class="seat_option" style="z-index: 20;">
							<button type="button" id="btn_allview" class="btn_allview ng-scope" ng-click="view.allView()" ng-if="!view.isViewAllView" title="좌석도 뒤로가기(전체보기)">
								<span class="ng-binding">공연장 전체보기</span>
							</button>
							<button type="button" id="btn_zoom" class="btn_zoom" ng-click="view.zoom(1)" title="확대">
								<span class="ng-binding">확대보기</span>
							</button>
							<button type="button" id="btn_zoomout" class="btn_zoomout" ng-click="view.zoom(-1)" title="축소">
								<span class="ng-binding">축소보기</span>
							</button>
							<button type="button" id="btn_refresh" class="btn_refresh" ng-click="view.refresh()" title="좌석도 새로고침">
								<span class="ng-binding">좌석선태 초기화 및 도면 새로고침</span>
							</button>
						</div>

						<div class="ly_floorplan_noti ng-hide" ng-show="view.isWaitingReservation &amp;&amp; reservationType === 'SECTION' &amp;&amp; sectionDimmed[view.bgSingle]" style="z-index: 30;">
							<div class="bx_noti">
								<p class="txt ng-hide" ng-show="view.bgSingle === 'SEAT'">
									<strong>좌석 배치도에 보여지는 좌석은 참고용으로 선택하실 수 없습니다.<br>취소표를 신청할 구역은 우측에서 선택해 주세요.
									</strong>
								</p>
								<p class="txt ng-hide" ng-show="view.bgSingle === 'AREA'">
									<strong>원하는 구역을 좌석배치도<br>또는 우측에서 선택해 주세요.
									</strong>
								</p>
								<a href="javascript:;" class="btn btn_full_point2" ng-click="view.onDimmedClick()">좌석배치도 보기</a>
							</div>
						</div>

						<div class="select_seat_info ng-isolate-scope" ng-init="showSelectedSeatInfo = false" style="z-index: 20;; z-index: 20;">
							<a href="#" class="seat_header" ng-class="{open: showSelectedSeatInfo}" ng-click="showSelectedSeatInfo = !showSelectedSeatInfo">
								<div ng-show="!selected.isWaitingReservation">
									<strong class="tit ng-binding ng-scope" ng-if="selected.isAutoSelfShow()">등급을 먼저 선택 후, 좌석선택 유형을 선택해 주세요.</strong>
								</div>
								<div ng-show="selected.isWaitingReservation" class="ng-hide">
									<div ng-show="selected.reservationType === 'SEAT'" class="ng-hide">
										<strong class="tit ng-scope" ng-if="selected.selectedSeatsAndZones.length === 0"> 최대 <span class="txt_orange ng-binding">0석</span>까지 선택할 수 있어요!
										</strong>
									</div>
									<div ng-show="selected.reservationType === 'SECTION'" class="ng-hide">
										<strong class="tit ng-scope" ng-if="selected.selectedSectionMap.length !== 0" style="display: inline;">선택된 정보 ( <span class="number ng-binding"></span> 개)
										</strong>
									</div>
								</div>
							</a>
							<div class="scrollbar-vista seat" ng-style="{display: showSelectedSeatInfo? 'block': 'none'}" style="display: none;">
								<!-- [D]레이어창 열린 경우 display:block / 닫힌 경우 : display:none -->
								<ul class="lst" ng-show="selected.reservationType !== 'SECTION'">
									<!-- ngRepeat: seat in selected.selectedSeatsAndZones -->
								</ul>
								<ul class="lst ng-hide" ng-show="selected.reservationType === 'SECTION'">
									<!-- ngRepeat: section in selected.selectedSectionMap -->
								</ul>
							</div>
							<!-- ngIf: selected.selectedTotalCount !== 0 || (selected.selectedSectionMap && selected.selectedSectionMap.length !== 0) -->
						</div>
					</div>
				</div>
				<div class="reserve_right ng-isolate-scope">
					<div class="reserve_artbx ng-isolate-scope">
						<div>
							<div class="reload2" style="display: none;">
								<span class="ng-binding">로딩중</span>
							</div>
							<div class="bx_tit">
								<h4 class="reserve_tit seat_select ng-binding">등급 선택</h4>
								<a href="#" class="btn btn_blank ng-binding">새로고침</a>
							</div>
						</div>
						<!-- <ul id="select_seat_grade" class="seat_lst" style="height: 258px"> -->
						<ul id="select_seat_grade" class="seat_lst" style="height: 550px">
							<li>
								<a href="#" style="cursor: pointer" class="select">
									<span class="seat_color"></span>
									<div class="seat_detail_info">
										<span class="seat_level ng-binding">전체</span>
									</div>
								</a>
							</li>
							<li id="seat_grade_96023" depth="1" grade="grade" zones="grade.zones" selected="selected" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" class="zero">
									<span class="seat_color ng-scope" style="background: #d15050"></span>
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">챔피언석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
							<li id="seat_grade_96027" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #284786" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">중앙테이블석(2인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96028" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #284786" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">중앙테이블석(3인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96030" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #df7242" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 서프라이즈석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96029" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #df7242" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 서프라이즈석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96032" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5e964a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 타이거즈 가족석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96031" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5e964a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 타이거즈 가족석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96035" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5e964a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 타이거즈 가족석 (6인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96034" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5e964a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 타이거즈 가족석 (6인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96037" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #85c0dc" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 파티석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96036" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #85c0dc" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 파티석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96040" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #4d499a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 스카이피크닉석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96039" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #4d499a" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 스카이피크닉석 (4인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96041" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #6ebe88" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">에코다이나믹스 가족석 (6인)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96046" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #db59af" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 K9</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96042" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #db59af" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 K9</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96048" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #f0bc2e" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 K8</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96047" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #f0bc2e" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 K8</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">635</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96050" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #93cb3b" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 K5</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">6</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96049" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #93cb3b" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 K5</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">1412</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96052" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #9575c1" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 K3</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">1579</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96051" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #9575c1" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 K3</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">3014</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96053" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #cdad57" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">외야석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">1230</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96055" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5A0D9E" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">3루 휠체어석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">86</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96054" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #5A0D9E" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">1루 휠체어석</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">85</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96056" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #4a84d1" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">스카이박스(10인실)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96057" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #4a84d1" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">스카이박스(14인실)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
							<!-- ngIf: !grade.restriction -->
							<li id="seat_grade_96058" depth="1" grade="grade" zones="grade.zones" selected="selected" ng-if="!grade.restriction" ng-click="select.select($event, $index, grade)" ng-mouseover="select.showTooltipAction($event,grade)" ng-mouseleave="select.hideTooltipAction($event)" ng-init="select.selectedList[$index] = select.selectState.selectedGrade.gradeId === grade.gradeId|| false" ng-repeat="grade in select.grades" class="ng-scope ng-isolate-scope">
								<!-- [D] 좌석 선택된 경우 클래스명 select 추가, 구역이 선택된 경우엔 클래스명 select2로 변경 -->
								<a href="#" style="cursor: pointer" ng-class="{
           select: grade.selected === true,
           zero: grade.grade.remainCnt === 0
       }" class="zero">
									<!-- ngIf: grade.grade.color !== undefined -->
									<span class="seat_color ng-scope" style="background: #4a84d1" ng-style="{
            background:grade.grade.color
          }" ng-if="grade.grade.color !== undefined"></span>
									<!-- end ngIf: grade.grade.color !== undefined -->
									<div class="seat_detail_info">
										<!-- ngIf: grade.depth === 1 -->
										<span class="seat_grade ng-binding ng-scope" ng-if="grade.depth === 1">스카이박스(18인실)</span>
										<!-- end ngIf: grade.depth === 1 -->
										<!-- ngIf: grade.depth === 2 -->
										<!-- ngIf: grade.isPriceExposure && grade.grade.price !== undefined -->
										<!-- ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
										<span class="seat ng-scope" ng-if="grade.isRemainExposure &amp;&amp; grade.grade.remainCnt !== undefined">
											<span class="ng-binding">0</span>
											<span class="ng-binding">석</span>
										</span>
										<!-- end ngIf: grade.isRemainExposure && grade.grade.remainCnt !== undefined -->
									</div>
								</a>
								<!-- ngIf: grade.isShowBtn() -->
								<!-- ngIf: grade.isShowZones() -->
							</li>
							<!-- end ngIf: !grade.restriction -->
							<!-- end ngRepeat: grade in select.grades -->
						</ul>
						<!-- [D]툴팁 노출되는 위치에 따라 위치값 적용 부탁드립니다 -->
						<div class="layer rsv_info" ng-style="{
       top: select.tooltipTop + 'px',
       display: select.showTooltip? 'block':'none'
       }" style="top: 100px; display: none;">
							<strong class="ng-binding">예매안내</strong>
							<ul>
								<li class="ng-binding"></li>
							</ul>
						</div>
					</div>
					<div class="reserve_artbx ng-isolate-scope">
						<div class="bx_tit">
							<h4 class="reserve_tit ng-binding ng-hide" ng-show="select.isBtnShow()">좌석 선택</h4>
							<!-- ngIf: select.hasReserveCommissionContent -->
							<p class="reserve_notice_ly ng-binding ng-scope" ng-click="select.showNotice=!select.showNotice" ng-if="select.hasReserveCommissionContent">좌석선점 및 자동배정 안내</p>
							<!-- end ngIf: select.hasReserveCommissionContent -->
						</div>
						<div class="layer" style="right: 0px; bottom: 65px; width: 368px; display: none;" ng-style="{
              display: select.showNotice? 'block': 'none'
         }">
							<strong class="ng-binding">좌석선점 및 자동배정 안내</strong>
							<dl id="detail_info" class="detail_info">
								<div>
									<b>ⓘ 좌석 선점이란?</b>
									<br>
									좌석배치도에서 동일한 좌석이 동시에 선택된 경우 먼저 다음 단계로 넘어간 고객이 좌석을 선점하게 됩니다. 따라서 좌석선택 이후 다음단계로 넘어가는 시점에 따라 좌석 선점 여부가 결정됩니다.
									<br>
									<br>
									<b>① 좌석선택 시 주의사항</b>
									<br>
									좌석을 선택한 후 8분 이내에 결제를 완료해야 합니다. 해당 시간 내 결제가 이뤄지지 않을 경우 선택한 좌석의 예매가 취소됩니다. 또한 좌석 선택 시 잔여석은 표기되나 배치도에서 좌석이 보이지 않는 경우 해당 좌석이 선점되어 결제가 진행 중이므로 다른 좌석을 선택하여 주시기 바랍니다.
									<br>
									<br>
									<b>② 자동배정 시 주의사항</b>
									<br>
									자동배정은 결제시점에 잔여석 내 연속된 좌석이 있는 경우만 예매가 가능합니다. 잔여석이 적을 경우 직접 지정으로 예매가능 좌석을 확인한 후에 예매를 진행해 주세요.

















								</div>
							</dl>
							<a href="#" class="close ng-binding" ng-click="select.showNotice=false">레이어 닫기</a>
						</div>
						<div class="seat_allot ng-hide" ng-show="select.isBtnShow()">
							<span class="radio disabled" ng-class="{checked:select.selectState.selectedType==select.selectState.SELECTED_TYPE.AUTO_SELECT}" tkl-disabled="select.isAutoDisabled" ng-click="select.selectTypeClick(select.selectState.SELECTED_TYPE.AUTO_SELECT)" disabled="disabled">
								<input type="radio" id="seat_select_auto" name="seat_select" tkl-disabled="select.isAutoDisabled" ng-model="select.seatSelect" ng-value="0" class="ng-pristine ng-untouched ng-valid disabled ng-empty" value="0" disabled="disabled">
							</span>
							<!-- ngIf: !select.isOnlyAutoAssignment -->
							<label for="seat_select_auto" ng-if="!select.isOnlyAutoAssignment" class="ng-binding ng-scope">자동배정</label>
							<!-- end ngIf: !select.isOnlyAutoAssignment -->
							<!-- ngIf: select.isOnlyAutoAssignment -->
							<span class="radio disabled" ng-class="{checked:select.selectState.selectedType==select.selectState.SELECTED_TYPE.SELF_SELECT}" tkl-disabled="select.isSelfDisabled" ng-click="select.selectTypeClick(select.selectState.SELECTED_TYPE.SELF_SELECT)" disabled="disabled">
								<input type="radio" id="seat_select_passive" name="seat_select" tkl-disabled="select.isSelfDisabled" ng-model="select.seatSelect" ng-value="1" class="ng-pristine ng-untouched ng-valid disabled ng-empty" value="1" disabled="disabled">
							</span>
							<label for="seat_select_passive" class="ng-binding">직접선택</label>
						</div>
					</div>
					<!-- ngIf: right.isPrevShow -->
					<!-- ngIf: !right.isPrevShow -->
					<div class="reserve_btn ng-scope" ng-if="!right.isPrevShow">
						<a class="btn ng-binding btn_blank" href="#" ng-class="{
                btn_full : !right.isNextDisabled(),
                btn_blank : right.isNextDisabled()
           }" ng-click="right.next()" style="cursor: pointer; width: 208px;">다음단계</a>
					</div>
					<!-- end ngIf: !right.isPrevShow -->
					<div class="layer select_count_auto ng-isolate-scope" style="left: 29px; bottom: 20px; width: 210px; display: none;" ng-style="{
        display: popup.display? 'block':'none'
     }">
						<!-- ngIf: popup.display -->
						<div class="select_count_btn reserve_btn">
							<a href="#" class="btn btn_full ng-binding" ng-click="popup.next()">다음단계</a>
						</div>
					</div>
					<div class="layer select_count_auto ng-isolate-scope" style="left: 29px; bottom: 20px; width: 210px; display: none;" ng-style="{
        display: popup.display? 'block':'none'
     }">
						<div class="box_top">
							<a href="#" class="close ng-binding" ng-click="popup.close()">레이어 닫기</a>
							<div class="seat_box">
								<p class="seat_name ng-binding">
									<span class="seat_color" ng-style="{background:popup.grade.color}"></span>
								</p>
								<p class="seat_dsc">
									<span class="ng-binding"></span>
									<!-- ngIf: popup.isRemainExposure -->
									<span class="sheet ng-binding ng-scope" ng-if="popup.isRemainExposure">0석</span>
									<!-- end ngIf: popup.isRemainExposure -->
								</p>
							</div>

							<!-- ngIf: popup.display -->
						</div>
						<div class="select_count_btn reserve_btn">
							<a href="#" class="btn btn_full ng-binding" ng-click="popup.next()">다음단계</a>
						</div>
					</div>
				</div>
				<div class="layer select_count_large ng-isolate-scope" style="margin-top: -113px; z-index: 210; display: none;" ng-style="{
        display: popup.display? 'block':'none',
        'margin-top': popup.top +'px'
     }">
					<div class="area_top">
						<a href="#" class="close ng-binding" ng-click="popup.close()">레이어 닫기</a>
						<!-- ngIf: popup.isOnlyAutoAssignment -->
						<!--좌석등급 선택-->
						<!-- ngIf: !popup.isOnlyAutoAssignment -->
						<strong class="title ng-binding ng-scope" ng-if="!popup.isOnlyAutoAssignment">좌석선택유형</strong>
						<!-- end ngIf: !popup.isOnlyAutoAssignment -->
						<!--좌석유형 선택-->
						<ul class="title_dsc">
							<!--좌석선택 유형일 때만 노출-->
							<!-- ngIf: !popup.isOnlyAutoAssignment -->
							<li ng-if="!popup.isOnlyAutoAssignment" class="ng-binding ng-scope">
								<span class="txt_deco ng-binding">자동배정</span>
								: 선택된 영역과 상관없이 등급 내 연속된 좌석 선택
							</li>
							<!-- end ngIf: !popup.isOnlyAutoAssignment -->
							<!-- ngIf: !popup.isOnlyAutoAssignment -->
							<li ng-if="!popup.isOnlyAutoAssignment" class="ng-binding ng-scope">
								<span class="txt_deco ng-binding">직접선택</span>
								: 선택된 영역의 좌석 선택
							</li>
							<!-- end ngIf: !popup.isOnlyAutoAssignment -->
						</ul>
					</div>
					<div id="area_bottom" class="area_bottom">
						<form class="ng-pristine ng-valid">
							<fieldset>
								<legend class="ng-binding">매수선택</legend>
								<!-- ngRepeat: grade in popup.grades -->
							</fieldset>
						</form>
					</div>
				</div>
			</div>

			<!-- //배너영역 -->
			<div class="dimmed ng-isolate-scope" ng-style="{
        display:dimmed.display? 'block':'none'
     }" style="display: none;"></div>
			<div class="layer select_count ng-isolate-scope" style="display: none; top: 259px; left: 305px; width: 168px; z-index: 210;" ng-style="{
        display: popup.display? 'block':'none'
     }">
				<a href="#" class="close ng-binding" ng-click="popup.close()">레이어 닫기</a>
				<strong class="ng-binding">매수선택</strong>
				<div class="seat_box">
					<!-- [D] seat_name, seat_dsc 둘 다 길어질 경우 2줄 말줄임 처리 -->
					<p class="seat_name ng-binding">
						<span class="seat_color" ng-style="{background:popup.grade.color}"></span>
					</p>
					<p class="seat_dsc">
						<span class="ng-binding"></span>
						<!-- ngIf: popup.isRemainExposure -->
						<span class="sheet ng-binding ng-scope" ng-if="popup.isRemainExposure">0석</span>
						<!-- end ngIf: popup.isRemainExposure -->
					</p>
				</div>
				<!-- ngIf: popup.display -->
			</div>
		</div>
		<!-- [D] 레이어팝업 -->
		<!-- <div class="ly_pop_wrap ly_captcha ng-isolate-scope ng-hide" ng-show="popupCaptcha.isDisplayed">
			<div class="dimmed" style="display: block"></div>
			<div class="layer">
				<div class="area_captcha">
					<h3 class="tit">클린예매 서비스</h3>
					<p class="tit_dsc">
						<em class="color">부정예매를 방지</em>하기 위해 <em class="color">보안문자</em> 입력 후 예매가 가능합니다.
					</p>
					<form class="captcha_info ng-valid-maxlength ng-dirty ng-valid ng-valid-required ng-submitted">
						<fieldset>
							<legend>보안문자 입력 폼</legend>
							<span class="bx_img">
								<img alt="" width="390" height="150" id="captcha_img" ng-src="/captcha/image?captchaKey=fc0ee17f-a5f3-48de-a3d8-e08b7fb3b362&amp;time=1721649110386" src="/captcha/image?captchaKey=fc0ee17f-a5f3-48de-a3d8-e08b7fb3b362&amp;time=1721649110386">
							</span>
							[D] 에러케이스 : .bx_input_txt에 error 클래스 추가
							<span class="bx_input_txt" ng-class="popupCaptcha.isInvalidInputData() ? 'error' : ''" ng-click="popupCaptcha.focusCaptchaInputAndHideAuthInvalid()">
								[D] 인풋 포커스 시 value값 초기화 필요
								<input type="text" required="" id="ipt_captcha" maxlength="5" autocomplete="off" ng-model="popupCaptcha.inputData" ng-change="popupCaptcha.changeInputDataToUpperCase()" class="ng-valid-maxlength ng-not-empty ng-dirty ng-valid ng-valid-required ng-touched">
								<span class="txt_error ng-hide" ng-show="popupCaptcha.isInvalidInputData()"> 정확하게 입력해주세요. </span>
							</span>
							<p class="dsc">
								- 위 문자를 순서대로 입력해주세요.
								<br>
								- 3분 이내 미입력시, 보안문자가 자동 새로고침됩니다.
							</p>
							<button type="button" class="btn btn_refresh" ng-click="popupCaptcha.refresh(true)">
								<span class="blind"> 새로고침 </span>
							</button>
							<div class="bx_btn">
								ngIf: popupCaptcha.isPrevStepBtnNeeded()
								<a href="#" class="btn btn_blank ng-scope" ng-if="popupCaptcha.isPrevStepBtnNeeded()" ng-click="popupCaptcha.goToPrevStep()"> 날짜 다시 선택 </a>
								end ngIf: popupCaptcha.isPrevStepBtnNeeded()
								<button type="submit" class="btn btn_full" ng-click="popupCaptcha.auth()">입력완료</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div> -->
		<!-- //[D] 레이어팝업 -->

		<!-- //회차선택 -->
		<div id="tkl-schedule-picker"></div>
	</div>
	<div id="lottie-loading" class="loading_wrap" style="z-index: 9999; display: none;">
		<div class="loading">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80" width="80" height="80" preserveAspectRatio="xMidYMid meet" style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px);">
				<defs>
				<clipPath id="__lottie_element_2">
				<rect width="80" height="80" x="0" y="0"></rect></clipPath></defs>
				<g clip-path="url(#__lottie_element_2)">
				<g transform="matrix(1,0,0,1,21.5,40.5)" opacity="1" style="display: block;">
				<g opacity="1" transform="matrix(1,0,0,1,0,0)">
				<path fill="rgb(255,255,255)" fill-opacity="1" d=" M0,-2.5 C1.3797500133514404,-2.5 2.5,-1.3797500133514404 2.5,0 C2.5,1.3797500133514404 1.3797500133514404,2.5 0,2.5 C-1.3797500133514404,2.5 -2.5,1.3797500133514404 -2.5,0 C-2.5,-1.3797500133514404 -1.3797500133514404,-2.5 0,-2.5z"></path></g></g>
				<g transform="matrix(1,0,0,1,33.5,40.5)" opacity="1" style="display: block;">
				<g opacity="1" transform="matrix(1,0,0,1,0,0)">
				<path fill="rgb(255,255,255)" fill-opacity="1" d=" M0,-2.5 C1.3797500133514404,-2.5 2.5,-1.3797500133514404 2.5,0 C2.5,1.3797500133514404 1.3797500133514404,2.5 0,2.5 C-1.3797500133514404,2.5 -2.5,1.3797500133514404 -2.5,0 C-2.5,-1.3797500133514404 -1.3797500133514404,-2.5 0,-2.5z"></path></g></g>
				<g transform="matrix(1,0,0,1,45.5,40.5)" opacity="1" style="display: block;">
				<g opacity="1" transform="matrix(1,0,0,1,0,0)">
				<path fill="rgb(255,255,255)" fill-opacity="1" d=" M0,-2.5 C1.3797500133514404,-2.5 2.5,-1.3797500133514404 2.5,0 C2.5,1.3797500133514404 1.3797500133514404,2.5 0,2.5 C-1.3797500133514404,2.5 -2.5,1.3797500133514404 -2.5,0 C-2.5,-1.3797500133514404 -1.3797500133514404,-2.5 0,-2.5z"></path></g></g>
				<g transform="matrix(1,0,0,1,57.5,37.75374221801758)" opacity="1" style="display: block;">
				<g opacity="1" transform="matrix(1,0,0,1,0,0)">
				<path fill="rgb(255,255,255)" fill-opacity="1" d=" M0,-2.5 C1.3797500133514404,-2.5 2.5,-1.3797500133514404 2.5,0 C2.5,1.3797500133514404 1.3797500133514404,2.5 0,2.5 C-1.3797500133514404,2.5 -2.5,1.3797500133514404 -2.5,0 C-2.5,-1.3797500133514404 -1.3797500133514404,-2.5 0,-2.5z"></path></g></g></g></svg>
		</div>
	</div>
</body>
</html>