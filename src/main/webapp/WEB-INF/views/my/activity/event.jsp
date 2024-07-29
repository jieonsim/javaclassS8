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
					<h3 class="blind">활동관리</h3>
					<div class="h3_line">
						<h4 class="tit_actv01">참여 이벤트</h4>
					</div>
					<p class="guide_txt">이벤트에 응모하신 내역을 확인하실 수 있습니다.</p>
					<div class="basic_tbl">
						<table>
							<caption>
								<span class="blind">참여 이벤트</span>
							</caption>
							<colgroup>
								<col style="width: 190px">
								<col style="width: 140px">
								<col style="width: 110px">
							</colgroup>
							<thead class="text-center">
								<tr>
									<th scope="col">이벤트명</th>
									<th scope="col">이벤트 기간</th>
									<th scope="col">응모일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${paritipations}" var="paritipation">
									<tr>
										<td class="tl">
											<span class="elp">${paritipation.eventTitle}</span>
										</td>
										<td class="fs12 number">${paritipation.startDate}&nbsp;~&nbsp;${paritipation.endDate}</td>
										<td class="fs12 number">
											<fmt:formatDate value="${paritipation.participatedAt}" pattern="yyyy.MM.dd HH:mm" />
										</td>
									</tr>
								</c:forEach>
								<tr><td colspan="3" class="m-0 p-0"></td></tr>
							</tbody>
						</table>
					</div>
					<jsp:include page="/WEB-INF/views/layout/paginate.jsp" />
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/moveTop.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>