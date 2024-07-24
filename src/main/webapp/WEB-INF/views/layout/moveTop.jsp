<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<button type="button" id="back_to_top" class="btn_move_top is-active is-stuck">
	<span class="blind">맨 위로 이동하기</span>
</button>
<link rel="stylesheet" href="${ctp}/css/common/button.css">