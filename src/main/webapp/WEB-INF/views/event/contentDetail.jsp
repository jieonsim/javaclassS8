<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://localhost/customFunctions" %>
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
			<h3 class="evt_tit evt_tit4">진행 중인 이벤트</h3>
			<div class="event_cont_box event_cont_box_v2">
				<dl class="evt_detail">
					<dt>이벤트 제목</dt>
					<dd class="evt_title" id="eventTitle">
						<span>[${event.eventCategory}]</span>
						${event.title}
					</dd>
					<dt>이벤트 기간</dt>
					<dd class="evt_date">${event.startDate}~${event.endDate}</dd>
					<dt>이벤트 내용</dt>
					<dd class="evt_cont">${event.content}</dd>
				</dl>
			</div>
			<div class="list_btn d-flex justify-content-center">
				<a href="${ctp}/event/main" class="btn btn_blank">목록보기</a>
			</div>
			<div id="comment_container" class="event_cont_box">
				<div class="star_review inquire">
					<fieldset>
						<legend>이벤트 댓글 작성</legend>
						<form id="eventCommentForm" method="post" action="${ctp}/event/insertEventComment">
							<div class="write_review">
								<input type="hidden" id="eventId" name="eventId" value="${event.id}">
								<textarea title="이벤트 댓글 작성하기" id="inputEventComment" name="comment" placeholder="이메일, 전화번호 등 개인정보 노출 시, 타인이 이를 악용할 수 있으니 삼가 바랍니다." maxlength="3000" style="resize: none"></textarea>
								<a href="#" id="insertEventCommentBtn" class="btn btn_full">댓글입력</a>
							</div>
						</form>
					</fieldset>
					<div id="comment_validation"></div>
				</div>
				<div class="list_btn">
					<div class="fl mgt7">
						총
						<span class="color_point fbold" id="comment_total_num">${commentCount}</span>
						명이 응모했어요.
					</div>
					<div class="fr">
						<a href="#" class="btn_text2" data-toggle="modal" data-target="#eventCommentRule">
							이벤트 참여 운영규정<em></em>
						</a>
					</div>
				</div>
				<div class="review_list">
					<ul id="event_comment_list">
						<c:forEach items="${eventComments}" var="comment">
							<li>
								<div class="review_info">
									<dl class="star_average d-flex justify-content-start">
										<dt>아이디</dt>
										<dd class="review_user mr-2">${fn:maskEmail(comment.email)}</dd>
										<dt>날짜</dt>
										<dd class="review_date">
											<fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm" />
										</dd>
									</dl>
								</div>
								<pre>${comment.comment}</pre>
							</li>
						</c:forEach>
 					</ul>
				</div>
				<!-- <div class="paging" id="pagination">
					<a href="javascript:goPage('1')" class="first">맨앞</a>
					<a href="javascript:goPage('1')" class="prev">이전</a>
					<strong>1</strong>
					<a href="javascript:goPage('1')" class="next">다음</a>
					<a href="javascript:goPage('1')" class="end">맨뒤</a>
				</div> -->
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/event/contentDetail.js"></script>
</body>
</html>