<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/admin/vertical-layout-light/navbar_title.css">
<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
	<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
		<div class="me-3">
			<button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
				<span class="icon-menu"></span>
			</button>
		</div>
		<div>
			<a class="navbar-brand brand-logo" href="${ctp}/admin/dashboard">
				<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
				<span class="logo-text">ticketchamp</span>
			</a>
			<a class="navbar-brand brand-logo-mini" href="${ctp}/admin/dashboard">
				<i class="ph-bold ph-person-simple-throw" id="header_title_logo"></i>
			</a>
		</div>
	</div>
	<div class="navbar-menu-wrapper d-flex align-items-top">
		<ul class="navbar-nav">
			<li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
				<h1 class="welcome-text" id="current-datetime"></h1>
			</li>
		</ul>
		<ul class="navbar-nav ms-auto">
			<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
				<span class="mdi mdi-menu"></span>
			</button>
		</ul>
	</div>
</nav>
<script src="${ctp}/js/admin/common/navbar.js"></script>