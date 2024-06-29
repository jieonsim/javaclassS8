<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프이용약관(필수)</title>
<jsp:include page="/WEB-INF/views/include/common/utility.jsp" />
<link rel="icon" href="${ctp}/images/common/favicon.png">
</head>
<div class="winPopWrapper">
	<div class="titleWrap">
		<h1>티켓챔프 이용약관</h1>
		<a class="btnPopClose" href="javascript:window.close();">닫기</a>
	</div>
	<div class="popContent">
		<iframe src="//incorp.interpark.com/member/2016/family_agreement.html"
			id="family_agreement"></iframe>
	</div>
</div>
</html>