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
			<h3 class="evt_tit evt_tit4">진행 중인 이벤트</h3>
			<div class="event_cont_box event_cont_box_v2">
				<dl class="evt_detail">
					<dt>이벤트 제목</dt>
					<dd class="evt_title" id="eventTitle">
						<span>[${event.eventCategory}]</span>
						${event.title}
					</dd>
					<dt>이벤트 기간</dt>
					<dd class="evt_date">${event.startDate} ~ ${event.endDate}</dd>
					<dt>이벤트 내용</dt>
					<dd class="evt_cont">${event.content}</dd>
				</dl>
			</div>
			<div class="list_btn">
				<a href="${ctp}/event/main" class="btn btn_blank">목록보기</a>
			</div>
			<div id="comment_container" class="event_cont_box" style="display: block;">
				<div class="star_review inquire">
					<fieldset>
						<legend>이벤트 댓글 작성</legend>
						<div class="write_review">
							<textarea title="이벤트 댓글 작성하기" id="commentContent" onclick="memberCommonCheckWithPage();" placeholder="이메일, 전화번호 등 개인정보 노출 시, 타인이 이를 악용할 수 있으니 삼가 바랍니다." maxlength="3000" style="resize: none"></textarea>
							<a href="javascript:;" id="insertEventCommentBtn" onclick="insertEventComment();" class="btn btn_full">댓글입력</a>
						</div>
					</fieldset>
					<div id="comment_validation"></div>
				</div>
				<div class="list_btn">
					<div class="fl mgt7">
						총
						<span class="color_point fbold" id="comment_total_num">8</span>
						개의 의견이 있습니다.
					</div>
					<div class="fr">
						<a href="#" onclick="event.preventDefault(); popupwindow('/rule/board/popup', '티켓링크', 500, 642);" class="btn_text2">
							게시판 운영규정<em></em>
						</a>
					</div>
				</div>
				<div class="review_list">
					<ul id="event_comment_list" style="word-break: break-all;">
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">su***@na</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.09 15:32</dd>
								</dl>
							</div>
							<pre>무더운 8월에 아이스쇼를 즐길 수 있다니!! 뮤지컬 아이스쇼라 더욱 기대되고, 한여름의 더위를 싸~악 잊게 해줄 멋진 공연 기대합니다.</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">rk***@na</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.09 12:57</dd>
								</dl>
							</div>
							<pre>아이스쇼는 처음인데 실제로보면 얼마나 멋질까요 ㅎㅎ</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">bs***@ha</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.09 11:34</dd>
								</dl>
							</div>
							<pre>너무 보고 싶습니다.</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">do***@na</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.09 01:09</dd>
								</dl>
							</div>
							<pre>신세계를 경험해 보고 싶군요~</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">91***@na</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.08 19:23</dd>
								</dl>
							</div>
							<pre>이색 공연같아요~ 보고 싶습니다</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">qa***@gm</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.07 17:27</dd>
								</dl>
							</div>
							<pre>어떤 공연인지 궁금합니다. 무더운 여름에 시원한 공연 보고 싶어요~</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">ir***@na</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.07.05 23:05</dd>
								</dl>
							</div>
							<pre>너무나 기대되요.</pre>
						</li>
						<li>
							<div class="review_info">
								<dl class="star_average">
									<dt>아이디</dt>
									<dd class="review_user">li***@ha</dd>
									<dt>날짜</dt>
									<dd class="review_date">2024.06.28 16:47</dd>
								</dl>
							</div>
							<pre>기대하고 꼭 보고싶습니다</pre>
						</li>
					</ul>
				</div>
				<div class="paging" id="pagination">
					<a href="javascript:goPage('1')" class="first">맨앞</a>
					<a href="javascript:goPage('1')" class="prev">이전</a>
					<strong>1</strong>
					<a href="javascript:goPage('1')" class="next">다음</a>
					<a href="javascript:goPage('1')" class="end">맨뒤</a>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>