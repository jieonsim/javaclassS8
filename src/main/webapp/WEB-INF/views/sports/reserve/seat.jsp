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
<jsp:include page="/WEB-INF/views/sports/reserve/utility.jsp" />
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
					<span class="ng-binding ng-scope">예매확인</span>
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
							<h4 class="prdt ng-binding">${game.homeTeamName}&nbsp;vs&nbsp;${game.awayTeamName}</h4>
						</div>
						<p class="etc_info etc_info_type1">
							${game.gameDate} ${game.gameTime}
							<span class="place ng-binding">${game.venueName}</span>
						</p>
					</div>
					<div id="main_view_top" class="select_seat ng-isolate-scope">
						<div id="main_view">
							<img src="${ctp}/images/sports/seat/${game.homeTeamShortName}.png" alt="${game.homeTeamName} 좌석도">
							<p>위 좌석배치도에서는 좌석을 선택할 수 없습니다. 우측 등급 선택에서 좌석 선점 후, 다음 단계를 선택해주세요.</p>
						</div>
					</div>
				</div>
				<div class="reserve_right ng-isolate-scope">
					<div class="reserve_artbx ng-isolate-scope">
						<div>
							<div class="reload2" style="display: none;">
								<span class="ng-binding">로딩중</span>
							</div>
							<div class="bx_tit" style="padding-bottom: 20px;">
								<h4 class="reserve_tit seat_select ng-binding">등급 선택</h4>
								<a href="#" class="btn btn_blank ng-binding" id="seatRefreshBtn">새로고침</a>
							</div>
						</div>
						<ul id="select_seat_grade" class="seat_lst" style="height: 258px">
							<c:forEach var="seatInventory" items="${seatInventories}">
								<li id="seat_grade_${seatInventory.seatId}" class="ng-scope ng-isolate-scope">
									<a href="#" style="cursor: pointer" class="${seatInventory.availableCapacity == 0 ? 'zero' : ''}">
										<span class="seat_color ng-scope" style="background: ${seatInventory.seatColor};"></span>
										<div class="seat_detail_info">
											<span class="seat_grade ng-binding ng-scope">${seatInventory.seatName}</span>
											<span class="seat ng-scope">
												<span class="ng-binding">${seatInventory.availableCapacity}</span>
												<span class="ng-binding">석</span>
											</span>
										</div>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="reserve_artbx ng-isolate-scope">
						<div class="bx_tit">
							<p class="reserve_notice_ly ng-binding ng-scope">좌석선점 및 자동배정 안내</p>
						</div>
						<div class="layer" style="right: 0px; bottom: 35px; width: 368px; display: none;" id="reserveNoticePopup">
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
									본 경기는 자동배정으로 예매됩니다. 자동배정은 결제시점에 잔여석 내 연속된 좌석이 있는 경우만 예매가 가능합니다.
								</div>
							</dl>
							<a href="#" class="close ng-binding">레이어 닫기</a>
						</div>
					</div>
					<form class="ng-pristine ng-valid ng-scope" id="seatAndQuantityForm" action="${ctp}/sports/reserve/saveTempReservation" method="post">
						<div class="layer select_count_auto ng-isolate-scope" style="left: 29px; bottom: 20px; width: 210px; display: none;">
							<div class="box_top ng-scope">
								<a href="#" class="close ng-binding">${seatName}</a>
								<div class="seat_box">
									<p class="seat_name">${seatName}</p>
									<p class="seat_dsc">
										<span class="sheet ng-binding ng-scope">${availableCapacity}석</span>
									</p>
								</div>
								<fieldset>
									<legend class="ng-binding">매수선택</legend>
									<div class="select_count_input type2">
										<a href="#" class="selt zero ng-binding ng-scope" id="quantityDisplay">0</a>
										<ul class="selt_lst ng-scope" style="display: none;">
											<li class="vs-repeat-before-content" style="width: 100%; min-height: 0px;"></li>
											<c:forEach begin="0" end="${maxTicketsPerBooking}" var="i">
												<li class="vs-repeat-repeated-element ng-scope">
													<a href="#" class="ng-binding">${i}</a>
												</li>
											</c:forEach>
										</ul>
										<button type="button" class="btn_minus">
											<span class="blind ng-binding">매수 감소</span>
										</button>
										<button type="button" class="btn_plus">
											<span class="blind ng-binding">매수 증가</span>
										</button>
									</div>
								</fieldset>
							</div>
							<div class="select_count_btn reserve_btn">
								<button type="submit" class="btn btn_full ng-binding">다음단계</button>
							</div>
						</div>
						<input type="hidden" name="gameId" value="${game.id}">
						<input type="hidden" name="seatName" value="">
						<input type="hidden" name="quantity" id="selectedQuantity" value="0">
					</form>
				</div>
			</div>
			<!-- 매수 선택 시 dimmed 처리 -->
			<div class="dimmed ng-isolate-scope" id="seat_quantity_dimmed" style="display: none;"></div>
		</div>
		<!-- 캡챠 레이어 -->
		<div class="ly_pop_wrap ly_captcha ng-isolate-scope" id="captcha_layer" style="display: none;">
        <div class="dimmed" id="captcha_dimmed" style="display: none;"></div>
        <div class="layer">
            <div class="area_captcha">
                <h3 class="tit">클린예매 서비스</h3>
                <p class="tit_dsc">
                    <em class="color">부정예매를 방지</em>하기 위해 <em class="color">보안문자</em> 입력 후 예매가 가능합니다.
                </p>
                <form class="captcha_info" id="captcha_form" method="post">
                    <fieldset>
                        <legend>보안문자 입력 폼</legend>
                        <span class="bx_img">
                            <img alt="캡챠이미지" width="390" height="150" id="captcha_img">
                        </span>
                        <span class="bx_input_txt" id="bx_input_txt">
                            <input type="text" name="captcha" required id="ipt_captcha" maxlength="5" autocomplete="off">
                            <span class="txt_error ng-hide" id="captcha_error"> 정확하게 입력해주세요. </span>
                        </span>
                        <p class="dsc">
                            - 위 문자를 순서대로 입력해주세요.
                            <br>
                            - 3분 이내 미입력시, 보안문자가 자동 새로고침됩니다.
                        </p>
                        <button type="button" class="btn btn_refresh" id="captchaRefreshBtn">
                            <span class="blind"> 새로고침 </span>
                        </button>
                        <div class="bx_btn">
                            <a href="#" class="btn btn_blank" onclick="window.close();"> 날짜 다시 선택 </a>
                            <button type="submit" class="btn btn_full">입력완료</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
		<!-- 클린예매 캡챠 레이어팝업 -->
		<%-- <div class="ly_pop_wrap ly_captcha ng-isolate-scope ng-hide" style="display: none">
			<div class="dimmed" style="display: none"></div>
			<div class="layer">
				<div class="area_captcha">
					<h3 class="tit">클린예매 서비스</h3>
					<p class="tit_dsc">
						<em class="color">부정예매를 방지</em>하기 위해 <em class="color">보안문자</em> 입력 후 예매가 가능합니다.
					</p>
					<form class="captcha_info ng-valid-maxlength ng-dirty ng-valid ng-valid-required ng-submitted" method="post" id="captcha_form" onsubmit="return verifyCaptcha(event)">
						<fieldset>
							<legend>보안문자 입력 폼</legend>
							<span class="bx_img">
								<img alt="캡챠이미지" width="390" height="150" id="captcha_img" src="${ctp}/data/sports/captcha.jpg">
							</span>
							<!-- 에러케이스 : .bx_input_txt에 error 클래스 추가 / .txt_error에 ng-hide 클래스 제거-->
							<span class="bx_input_txt">
								<!-- 인풋 포커스 시 value값 초기화 필요 -->
								<input type="text" required id="ipt_captcha" maxlength="5" autocomplete="off" class="ng-valid-maxlength ng-not-empty ng-dirty ng-valid ng-valid-required ng-touched">
								<span class="txt_error ng-hide"> 정확하게 입력해주세요. </span>
							</span>
							<p class="dsc">
								- 위 문자를 순서대로 입력해주세요.
								<br>
								- 3분 이내 미입력시, 보안문자가 자동 새로고침됩니다.
							</p>
							<button type="button" class="btn btn_refresh" onclick="refreshCaptcha()">
								<span class="blind"> 새로고침 </span>
							</button>
							<div class="bx_btn">
								<a href="#" class="btn btn_blank ng-scope" onclick="history.back(); return false;"> 날짜 다시 선택 </a>
								<button type="submit" class="btn btn_full">입력완료</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div> --%>
	</div>
	<script src="${ctp}/js/sports/reserve/seat.js"></script>
</body>
</html>