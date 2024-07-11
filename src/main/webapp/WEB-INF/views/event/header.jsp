<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="page_heading">
	<h1 class="page_title">이벤트</h1>
	<div class="common_tab type_underline">
		<div class="common_tab_area">
			<ul role="tablist" class="common_tab_list">
				<li role="none" class="common_tab_item">
					<button type="button" role="tab" onclick="location.href='${ctp}/event/main';" class="common_tab_btn" <c:if test="${currentSelected == 'eventMain'}">aria-selected="true"</c:if>>진행중인 이벤트</button>
				</li>
				<li role="none" class="common_tab_item">
					<button type="button" role="tab" onclick="location.href='${ctp}/event/winner';" class="common_tab_btn" <c:if test="${currentSelected == 'eventWinner'}">aria-selected="true"</c:if>>당첨자 발표</button>
				</li>
				<li role="none" class="common_tab_item">
					<button type="button" role="tab" onclick="location.href='${ctp}/my/activity/event');" class="common_tab_btn">참여 이벤트</button>
				</li>
				<c:if test="${isAdmin}">
					<li role="none" class="common_tab_item">
						<button type="button" role="tab" onclick="location.href='${ctp}/event/upload';" class="common_tab_btn" <c:if test="${currentSelected == 'eventUpload'}">aria-selected="true"</c:if>>이벤트 업로드</button>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>