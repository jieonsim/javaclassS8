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
					<div class="d-flex justify-content-start list_title">
						<dd class="m-0" id="cateogory">${winnerPostDetail.eventCategory}</dd>
						<dd class="ml-5" id="title">${winnerPostDetail.title}</dd>
					</div>
					<dd class="list_cont text-center">${winnerPostDetail.content}</dd>
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