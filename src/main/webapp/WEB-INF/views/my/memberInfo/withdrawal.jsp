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
					<h3 class="blind">회원정보관리</h3>
					<div class="h3_line">
						<h4>회원탈퇴</h4>
					</div>

					<div id="detail" style="display: block;">
						<p class="mberdsc leave_members">
							서비스 탈퇴 전 유의사항을 반드시 확인해주세요.
							<br>
							<em>회원 탈퇴 시 혜택이 소멸되고, 정보가 복귀되지 않습니다.</em>
						</p>
						<dl class="mberoutbx">
							<dd style="height: 245px;">
								<ul class="outbxcon">
									<li>
										서비스 탈퇴 시 즉시 탈퇴 처리되나, 개인정보 도용 등으로 인한
										<br>
										원치 않은 철회, 부정 이용 방지 등에 대비하기 위하여 회원님의 아이디를 포함한 개인 정보가 보존됩니다.
									</li>
									<li>서비스 탈퇴 후 동일한 회원 이메일로 재가입이 불가능합니다.</li>
									<li>서비스 탈퇴 시 등록된 예매권은 삭제되며 재 이용이 불가합니다.</li>
									<li>
										진행중인 전자상거래 이용내역(관람일이 경과되지 않은 예매내역)이
										<br>
										있는 경우 서비스 탈퇴를 하실 수 없습니다.
									</li>
									<li>
										작성된 게시물은 탈퇴 시 자동 삭제되지 않으며,
										<br>
										삭제가 필요한 경우 게시물 직접 삭제 후 서비스 탈퇴 하셔야 합니다.
									</li>
								</ul>
							</dd>
						</dl>
						<c:if test="${not empty reservations}">
							<dl class="mberguide">
								<dd>
									<ul class="mberlst">
										<c:forEach items="${reservations}" var="reservation">
											<li>${reservation.gameDate}&nbsp;${reservation.gameTime}&nbsp;${reservation.homeTeamName}&nbsp;vs&nbsp;${reservation.awayTeamName}</li>
										</c:forEach>
									</ul>
									<p>티켓은 마이페이지 예매확인/취소 메뉴에서 취소하실 수 있습니다.</p>
								</dd>
							</dl>
						</c:if>
						<form id="widthdrawalForm" method="post">
							<div class="mberck">
								<span class="checkbox" id="agree_Withdrawal">
									<input type="checkbox" id="agree" name="agreeWithdrawal">
								</span>
								<label for="agree" style="margin-bottom: 0">위 내용을 모두 확인하였으며 동의합니다.</label>
							</div>
							<div class="tc mgt60">
								<button type="submit" class="btn btn_full">티켓챔프 서비스 탈퇴</button>
							</div>
							<input type="hidden" id="canWithdraw" value="${empty reservations}">
						</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/memberInfo/withdrawal.js"></script>
</body>
</html>