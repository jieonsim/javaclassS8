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
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/my/contents.css">
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
					<h3 class="blind">할인혜택</h3>
					<div class="h3_line">
						<h4>예매권</h4>
					</div>
					<p class="guide_txt">
						스포츠 티켓을 무료로 예매할 수 있는 결제수단입니다.
						<br>
						보유한 예매권번호를 아래에 입력하여 미리 등록하거나, 예매 시 결제창에서 입력하여 사용할 수 있습니다.
					</p>
					<div class="my_register_box">
						<form id="advanceTicketRegisterForm">
							<fieldset>
								<legend>예매권 등록</legend>
								<label for="ticketNoInput" class="register_txt mb-0">예매권 등록</label>
								<input type="text" id="advanceTicketNoInput" name="advanceTicketNumber" placeholder="예매권 번호를 입력하세요." class="register_input" autocomplete="off">
								<button type="submit" id="submitBtn" class="btn btn_full">등록</button>
							</fieldset>
						</form>
					</div>
					<div class="fr">
						<ul class="mysort">
							<li class="on">
								<a href="#" data-statetype="">전체</a>
							</li>
							<li>
								<a href="#" data-statetype="AVAIL">사용가능 예매권</a>
							</li>
							<li>
								<a href="#" data-statetype="COMPLETED">사용완료 예매권</a>
							</li>
							<li>
								<a href="#" data-statetype="EXPIRATE">유효기간 만료</a>
							</li>
						</ul>
					</div>
					<div class="basic_tbl">
						<table>
							<caption>예매권 리스트</caption>
							<colgroup>
								<col style="width: 175px">
								<col style="width: 145px">
								<col style="width: 120px">
								<col>
								<col style="width: 155px">
							</colgroup>
							<thead class="text-center">
								<tr>
									<th scope="col">예매권 번호</th>
									<th scope="col">예매 가능한 티켓</th>
									<th scope="col">사용 가능 매수</th>
									<th scope="col">유효기간</th>
									<th scope="col">예매권 상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="number">1234567890101234</td>
									<td>스포츠</td>
									<td>1매</td>
									<td class="color_black">2024.08.12 까지</td>
									<!-- used : false일 때 -->
									<td class="color_point">사용가능</td>
									<!-- used : true일 때 -->
									<!-- <td class="color_black">사용완료</td> -->
									<!-- expiresAt 지났을 때 -->
									<!-- <td class="color_black">사용불가</td> -->
								</tr>
								<%-- <tr>
									<td class="number">${advanceTicketNumber}</td>
									<td>스포츠</td>
									<td>1매</td>
									<td class="color_black">${expiresAt}까지</td>
									<td class="color_black">${used}</td>
								</tr> --%>
								<!-- <tr>
									<td class="no_data" colspan="5">
										<div class="td">등록된 예매권이 없습니다.</div>
									</td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<jsp:include page="/WEB-INF/views/layout/paginate.jsp" />
					<div class="notes2">
						<h6>
							<span></span>
							예매권 관련 안내
						</h6>
						<ol>
							<li>예매권은 유효기간 내에 티켓챔프 웹 사이트를 통해서 사용 가능합니다. (예매일 기준)</li>
							<li>예매권을 이용하여 예매하실 경우, 별도의 예매수수료가 부과되지 않습니다.</li>
							<li>예매권을 이용하여 스포츠 경기 예매를 하실 경우, 구단의 매 수 제한 정책에 따라 예매가 가능합니다.</li>
							<li>스포츠 예매권 사용 가능 좌석은 시즌마다 차이가 있을 수 있습니다.</li>
							<li>예매권 등록은 예매권 사용 가능 기간에만 등록 가능합니다.</li>
							<li>스포츠 예매권을 등록한 후에는 취소/변경이 불가합니다.</li>
							<li>
								예매권으로 예매한 경기가 우천취소(일괄취소)된 경우, 해당 예매권이 복구됩니다.
								<br>
								복구된 시점에 이미 유효기간이 만료되었을 경우, 우천취소일로부터 1주일의 유효기간이 연장됩니다. (직접 예매취소하신 경우 기간연장 불가)
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/discount/advanceTicket.js"></script>
</body>
</html>