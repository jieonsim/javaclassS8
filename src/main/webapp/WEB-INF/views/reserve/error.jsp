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
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<div class="m_wrap">
		<header class="m_header">
			<div class="header_inner">
				<h1 class="header_title type_logo_black">
					<a href="/" class="header_logo_link">
						<span class="blind">티켓링크</span>
					</a>
				</h1>
				<div class="header_util_left">
					<button type="button" class="header_button button_back" onclick="onClickBackBtn();">
						<span class="blind">이전 페이지</span>
					</button>
				</div>
			</div>
		</header>
		<main id="m_content" class="m_container page_error" role="main">
			<section class="m_section section_error">
				<div class="common_error" style="display: block;">
					<span class="error_icon">
						<span class="blind">ERROR</span>
					</span>
					<div class="error_info">
						<p class="error_desc">다수의 브라우저로 접근하셨거나, 좌석 선점 시간이 초과하여 다음 단계 진행이 불가합니다. 예매 창을 닫고, 예매를 다시 시도해 주시기 바랍니다.</p>
					</div>

					<div class="common_btn_box">
						<button type="button" class="common_btn btn_secondary btn_medium" onclick="onClickCloseBtn();">닫기</button>
					</div>

				</div>
			</section>
		</main>
	</div>
</body>
</html>