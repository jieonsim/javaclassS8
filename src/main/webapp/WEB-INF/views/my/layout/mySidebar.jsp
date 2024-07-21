<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<ul class="help_lmenu">
	<li class="has_sub">
		<span class="help_submenu_tit">예매관리</span>
		<ul class="help_submenu">
			<!-- [D] 활성상태일 때 .on 추가입니다. -->
			<li>
				<a href="/my/reserve/list">예매확인/취소</a>
			</li>
		</ul>
	</li>
	<li class="has_sub">
		<span class="help_submenu_tit">할인혜택</span>
		<ul class="help_submenu">
			<li>
				<a href="/my/discount/advanceticket-new">예매권</a>
			</li>
		</ul>
	</li>
	<li class="has_sub">
		<span class="help_submenu_tit">활동관리</span>
		<ul class="help_submenu">
			<li>
				<a href="/my/activity/event" class="my_lmenu31">참여 이벤트</a>
			</li>
		</ul>
	</li>
	<li class="has_sub">
		<span class="help_submenu_tit">회원정보관리</span>
		<ul class="help_submenu">
			<li class="on">
				<a href="/my/memberInfo/info" class="my_lmenu52">회원정보수정</a>
			</li>
			<li>
				<a href="/my/memberInfo/withdrawal" class="my_lmenu53">회원탈퇴</a>
			</li>
		</ul>
	</li>
</ul>