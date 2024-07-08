<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/member/search/header.css">
<div class="intCommonHeader" id="commonHeaderDom">
	<div class="empty"></div>
	<div class="headerInner">
		<div class="inner">
			<a class="header_title_link" href="${ctp}/">
				<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
				<span class="logo-text">ticket</span>
				<span class="logo-text champ">champ</span>
			</a>
			<ul class="myMenu">
				<li class="">
					<a href="${ctp}/login" class="loginSignupBtn">로그인</a>
				</li>
				<li class="">
					<a href="${ctp}/signup/agreement" class="loginSignupBtn">회원가입</a>
				</li>
			</ul>
		</div>
	</div>
</div>