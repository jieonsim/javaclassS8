<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/my/contents.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container etc_cont" role="main">
		<div class="inner">
			<div class="wrap_error">
				<div class="error_box">
					<strong>서버 접속이 지연되고 있습니다.</strong>
					<p>
						서비스 이용에 불편을 드려 죄송합니다.
						<br>
						일시적인 서버 장애로 인하여 요청하신 페이지에 접속이 지연되고 있습니다.
						<br>
						접속 지연이 지속될 경우
						<a href="#">고객센터</a>
						에 문의 부탁 드립니다.
					</p>
					<a href="#" class="btn btn_blank" id="history_back">이전 페이지</a>
					<a href="#" class="btn btn_full" id="ticketlink_home">티켓링크 홈</a>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>