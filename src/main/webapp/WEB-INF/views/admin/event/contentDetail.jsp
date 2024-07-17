<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드민-티켓챔프</title>
<jsp:include page="/WEB-INF/views/admin/common/utility.jsp" />
<jsp:include page="/WEB-INF/views/admin/event/draw.jsp" />
<link rel="stylesheet" href="${ctp}/vendors/feather/feather.css">
<link rel="stylesheet" href="${ctp}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${ctp}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/typicons/typicons.css">
<link rel="stylesheet" href="${ctp}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${ctp}/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/style.css">
<link rel="stylesheet" href="${ctp}/css/event/common.css">
<link rel="stylesheet" href="${ctp}/css/event/event.css">
<link rel="icon" href="${ctp}/images/admin/favicon.ico">
</head>
<body>
	<div class="container-controller">
		<jsp:include page="/WEB-INF/views/admin/layout/navbar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/WEB-INF/views/admin/layout/settings-panel.jsp" />
			<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h4 class="card-title">이벤트 컨텐츠</h4>
										</div>
									</div>
									<p class="card-description">
										등록한 이벤트의 내용과 해당 이벤트에 작성된 댓글을 확인할 수 있습니다.
										<br>
										하단의 버튼을 통해 이벤트 추첨 / 컨텐츠 수정 / 이벤트 삭제를 처리할 수 있습니다.
									</p>
									<div class="event_cont_box event_cont_box_v2" style="border: 1px solid gray">
										<dl class="evt_detail">
											<dt>이벤트 제목</dt>
											<dd class="evt_title" id="eventTitle">
												<span>[${event.eventCategory}]</span>
												${event.title}
											</dd>
											<dt>이벤트 기간</dt>
											<dd class="evt_date">${event.startDate}&nbsp;~&nbsp;${event.endDate}</dd>
											<dt>이벤트 내용</dt>
											<dd class="evt_cont">${event.content}</dd>
										</dl>
									</div>
									<div class="list_btn d-flex justify-content-center" style="font-family: 'Pretendard-Regular'; height: 45px;">
										<div class="px-2">
											<a href="${ctp}/admin/event/list" class="btn btn-inverse-dark btn-fw">목록보기</a>
										</div>
										<div class="px-2">
											<a href="#" class="btn btn-inverse-success btn-fw" id="drawBtn" data-toggle="modal" data-target="#draw">추첨하기</a>
										</div>
										<div class="px-2">
											<a href="${ctp}/admin/event/update?eventId=${event.id}" class="btn btn-inverse-warning btn-fw" id="editBtn">수정하기</a>
										</div>
									</div>
									<div id="comment_container" class="event_cont_box" style="border: 1px solid gray">
										<div class="list_btn" style="margin: 0 0 10px">
											<div class="fl mgt7" style="font-family: 'Pretendard-Regular'; font-size: 14px;">
												총
												<span class="color_point fbold" id="comment_total_num">
													<b>${commentCount}</b>
												</span>
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
															<dl class="star_average d-flex">
																<dt>아이디</dt>
																<dd class="review_user mr-2">${comment.email}</dd>
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
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp" />
			</div>
		</div>
	</div>
	<script src="${ctp}/js/member/login/autoLogin.js"></script>
	<script src="${ctp}/js/admin/common/off-canvas.js"></script>
	<script src="${ctp}/js/admin/common/hoverable-collapse.js"></script>
	<script src="${ctp}/js/admin/common/template.js"></script>
	<script src="${ctp}/js/admin/common/settings.js"></script>
</body>
</html>