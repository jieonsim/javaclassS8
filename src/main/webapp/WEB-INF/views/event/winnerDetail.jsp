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
<link rel="stylesheet" href="${ctp}/css/event/common.css">
<link rel="stylesheet" href="${ctp}/css/event/event.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="container" role="main" class="common_container event_cont">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/event/header.jsp" />
			<h2 class="blind">이벤트</h2>
			<h3 class="evt_tit evt_tit4">당첨자 발표</h3>
			<div class="event_cont_box">
				<dl class="list_view list_view_v2 mgt10">
					<dt class="th" id="category">예매권</dt>
					<dd class="list_title">'산리오캐릭터즈 X K리그' 콜라보 출시 이벤트</dd>
					<dd class="list_cont">
						<p style="text-align: center;" align="center">
							<span style="color: rgb(47, 48, 51); font-family: arial; letter-spacing: -1px; font-size: 10pt;">
								<b>'산리오캐릭터즈 X K리그' 콜라보 출시 이벤트</b>
							</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="font-size: 10pt; font-family: arial;">​</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="font-size: 10pt; font-family: arial;">당첨자발표</span>
						</p>
						<p style="text-align: center;" align="center">&nbsp;</p>
						<p style="text-align: center;" align="center">&nbsp;</p>
						<p style="text-align: center;" align="center">
							<span style="background-color: rgb(255, 255, 255); font-family: arial; font-size: 10pt; white-space-collapse: preserve;">임*혜</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="background-color: rgb(255, 255, 255); font-family: arial; font-size: 10pt; white-space-collapse: preserve;">임*혜</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="background-color: rgb(255, 255, 255); font-family: arial; font-size: 10pt; white-space-collapse: preserve;">임*혜</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="font-family: docs-Calibri; font-size: 15px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);">&nbsp;</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="font-family: docs-Calibri; font-size: 15px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);">&nbsp;</span>
						</p>
						<p style="text-align: center;" align="center">
							<span style="font-family: arial; font-size: 10pt; white-space-collapse: preserve; background-color: rgb(255, 255, 255);">당첨자께는 개별 안내 예정입니다</span>
						</p>
						<p style="text-align: center;" align="center">
							<font face="docs-Calibri"><span style="font-size: 10pt; white-space-collapse: preserve; background-color: rgb(255, 255, 255); font-family: arial;">감사합니다.</span></font>
						</p>
						<p style="text-align: center;">
							<font face="docs-Calibri"><span style="font-size: 15px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);">
									<br>
								</span></font>
						</p>
					</dd>
				</dl>
				<div class="list_btn">
					<div class="fr">
						<a href="${ctp}/event/winner" class="btn btn_blank">목록보기</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>