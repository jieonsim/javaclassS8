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
			<c:forEach items="${events}" var="event" varStatus="status">
				<c:if test="${status.index % 3 == 0}">
					<ul class="event_top_list">
				</c:if>
				<li>
					<a href="${ctp}/event/detail?eventId=${event.id}">
						<img src="${ctp}/event/thumbnails/${event.thumbnail}" alt="이벤트썸네일" width="356" height="420">
						<div class="event_top_info">
							<dl>
								<dt>제목</dt>
								<dd class="event_title">
									<span class="point">[${event.eventCategory}]</span>
									${event.title}
								</dd>
								<dt>기간</dt>
								<dd class="event_date">${event.startDate}~${event.endDate}</dd>
							</dl>
						</div>
					</a>
				</li>
				<c:if test="${status.index % 3 == 2 || status.last}">
					</ul>
				</c:if>
			</c:forEach>
			<p class="nodata_txt" style="display: none;">등록된 이벤트가 없습니다.</p>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>