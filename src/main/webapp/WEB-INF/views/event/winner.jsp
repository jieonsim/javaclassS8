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
				<div class="basic_tbl mgt10">
					<table>
						<caption>당첨자 리스트</caption>
						<colgroup>
							<col style="width: 80px">
							<col style="width: 110px">
							<col>
							<col style="width: 180px">
						</colgroup>
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">카테고리</th>
								<th scope="col">이벤트명</th>
								<th scope="col">기간</th>
							</tr>
						</thead>
						<tbody id="winnerList">
							<c:forEach items="${winnerEvents}" var="event" varStatus="status">
								<tr>
									<td class="ff_tahoma fs11">${status.count}</td>
									<td>${event.eventCategory}</td>
									<td class="tl">
										<a href="${ctp}/event/winnerDetail?winnerPostId=${event.winnerPostId}" class="elp">${event.title}</a>
									</td>
									<td class="ff_tahoma fs11">${event.startDate}&nbsp;~&nbsp;${event.endDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>