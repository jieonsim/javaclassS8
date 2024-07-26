<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/sports/reserve/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/sports/advanceTicket.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<!-- 703 * 644 -->
<body id="body" class="payinfo_v2" marginwidth="0" marginheight="0">
	<div class="dialog-layer" style="display: block; left: 156.5px; top: 107px; z-index: 32001;">
		<div id="base_72A" style="display: block;">
			<div class="ly_pop ly_pop_full" id="base_72A_normal" style="left: -95px; top: -35px;">
				<span class="bg_top"></span>
				<span class="bg_btm"></span>
				<div class="ly_pop_con ly_pop_con3">
					<div class="tit_area">
						<h1 class="tit">티켓링크 예매권</h1>
						<span class="tit_dsc" id="txtUseCnt">사용매수: 1매</span>
					</div>
					<div class="gift_cont">
						<div class="tbl_ly_hd">
							<table class="tbl_ly tbl_hd">
								<caption>
									<span>티켓링크 예매권 목록 제목</span>
								</caption>
								<colgroup>
									<col style="width: 46px">
									<col style="width: 347px">
									<col style="">
								</colgroup>
								<tbody>
									<tr>
										<th>NO.</th>
										<th>예매권 번호</th>
										<th>상태</th>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tbl_ly_cont">
							<div class="inner">
								<table class="tbl_ly">
									<caption>
										<span>티켓링크 예매권 목록 내용</span>
									</caption>
									<colgroup>
										<col style="width: 46px">
										<col style="width: 347px">
										<col style="">
									</colgroup>
									<thead>
										<tr>
											<!-- [D] 헤더는 있어야 하므로 -->
											<th scope="col" class="blind">NO.</th>
											<th scope="col" class="blind">상품권 번호</th>
											<th scope="col" class="blind">상태</th>
										</tr>
									</thead>
									<tbody id="giftArea">
										<tr id="giftTr1">
											<td>
												1
												<input type="hidden" value="" id="giftNo1">
											</td>
											<td class="gift_num">
												<span class="inp_bx">
													<input type="text" id="gift1_num1" maxlength="4" title="예매권 첫째자리" onkeyup="pc.payment.util.removeNotNum(event); pc.payment.util.moveElementMaxLength(this, $('gift1_num2'));" autocomplete="off">
												</span>
												<!-- <span class="bar">-</span>
												<span class="inp_bx">
													<input type="text" id="gift1_num2" maxlength="4" title="예매권 둘째자리" onkeyup="pc.payment.util.removeNotNum(event); pc.payment.util.moveElementMaxLength(this, $('gift1_num3'));" autocomplete="off">
												</span>
												<span class="bar">-</span>
												<span class="inp_bx">
													<input type="text" id="gift1_num3" maxlength="4" title="예매권 셋째자리" onkeyup="pc.payment.util.removeNotNum(event); pc.payment.util.moveElementMaxLength(this, $('gift1_num4'));" autocomplete="off">
												</span>
												<span class="bar">-</span>
												<span class="inp_bx">
													<input type="text" id="gift1_num4" maxlength="4" title="예매권 마지막자리" onkeyup="pc.payment.util.removeNotNum(event);" autocomplete="off">
												</span> -->
												<a href="javascript:;" onclick="pc.payment.pg_72A.register(1);" class="btn_query">등록</a>
											</td>
											<td>
												<span class="txt_use" style="display: block;">
													<span class="checkbox-applied checkbox2">
														<span class="checkbox-mark" id="chkGiftUseYn1"></span>
														<input type="checkbox" id="giftUseYn1">
													</span>
													<label for="agree_save" id="giftStatus1"></label>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<div class="gift_cont ly_result">
						<dl class="result_col">
							<dt class="result_tit">총 주문금액</dt>
							<dd class="result_cont">
								<span class="result_txt">
									<em>8,000</em>
									<span>원</span>
								</span>
							</dd>
						</dl>
						<dl class="result_col">
							<dt class="result_tit">총 할인금액</dt>
							<dd class="result_cont">
								<span class="ico_minus sp"></span>
								<span class="result_txt">
									<em>8,000</em>
									<span>원</span>
								</span>
							</dd>
						</dl>
					</div>

					<div class="ly_btn">
						<a href="javascript:pc.payment.pg_72A.apply();" class="btn btn_ok">적용</a>
						<a href="javascript:pc.payment.pg_72A.cancel();" class="btn btn_cancel">취소</a>
					</div>
					<a href="javascript:pc.payment.pg_72A.cancel();" class="ly_close">레이어 닫기</a>
				</div>
				<div class="dimmed_inner" style="display: none; height: 450px; top: 10px;" id="dimmed_72A"></div>
			</div>
		</div>
	</div>
</body>
</html>