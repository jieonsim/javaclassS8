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
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/sports/common.css">
<link rel="stylesheet" href="${ctp}/css/sports/layout.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/baseball/common/sports_cont_top.jsp" />
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/baseball/common/cont_left.jsp" />
					<div class="cont_right">
						<div class='rightcont_inner'>
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_top_area.jsp" />
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_notice.jsp" />
							<jsp:include page="/WEB-INF/views/sports/baseball/common/team_tab.jsp">
								<jsp:param value="reservation" name="activeTab" />
							</jsp:include>
							<div class="tab_content" data-team="${currentTeam}">
								<!-- tab 클릭 시 schedule, seat, price, info 내용이 이 곳에 로드 -->
							</div>
							<div id="reservationContent">
								<div id="scheduleListDiv" class="reserve_lst_bx"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/sports/baseball/team_tab.js"></script>
</body>
</html>