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
			<ul class="event_top_list">
				<li>
					<a href="${ctp}/event/contentDetail">
						<img src="${ctp}/images/event_dummy/sanrio/sanrio_thumbnail1.gif" alt="K리그X산리오" width="356" height="420">
						<div class="event_top_info">
							<dl>
								<dt>제목</dt>
								<dd class="event_title">
									<span class="point">[예매권]</span>
									'산리오캐릭터즈 X K리그' 콜라보 출시 이벤트
								</dd>
								<dt>기간</dt>
								<dd class="event_date">2024.07.10 ~ 2024.07.17</dd>
							</dl>
						</div>
					</a>
				</li>
				<li>
					<a href="${ctp}/event/contentDetail">
						<img src="${ctp}/images/event_dummy/lessey/thumbnail.jpg" alt="KBOX최강레시" width="356" height="420">
						<div class="event_top_info">
							<dl>
								<dt>제목</dt>
								<dd class="event_title">
									<span class="point">[예매권]</span>
									'레시앤프렌즈 X KBO' 콜라보 출시 이벤트
								</dd>
								<dt>기간</dt>
								<dd class="event_date">2024.07.01 ~ 2024.07.26</dd>
							</dl>
						</div>
					</a>
				</li>
				<li>
					<a href="${ctp}/event/contentDetail">
						<img src="${ctp}/images/event_dummy/kakao/emoticon_thumbnail.png" alt="KBOX카카오이모티콘" width="356" height="420">
						<div class="event_top_info">
							<dl>
								<dt>제목</dt>
								<dd class="event_title">
									<span class="point">[예매권]</span>
									'슈야와 토야 X KBO' 이모티콘 출시 이벤트
								</dd>
								<dt>기간</dt>
								<dd class="event_date">2024.06.18 ~ 2024.08.04</dd>
							</dl>
						</div>
					</a>
				</li>
			</ul>
			<p class="nodata_txt" style="display: none;">등록된 이벤트가 없습니다.</p>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>