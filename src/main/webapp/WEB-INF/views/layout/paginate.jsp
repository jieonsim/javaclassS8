<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!-- <div class="paginate" style="">
	<a href="javascript:;" class="page_arrow pre_more">맨앞</a>
	<a href="javascript:;" class="page_arrow pre">이전</a>
	<span class="page_num_area">
		<strong class="page_num">1</strong>
	</span>
	<a href="javascript:;" class="page_arrow next">다음</a>
	<a href="javascript:;" class="page_arrow next_more">맨뒤</a>
</div> -->
<!-- <div class="paging" id="pagination">
		<a href="javascript:goPage('1')" class="first">맨앞</a>
		<a href="javascript:goPage('1')" class="prev">이전</a>
		<strong>1</strong>
		<a href="javascript:goPage('2')"> 2</a>
		<a href="javascript:goPage('2')" class="next">다음</a>
		<a href="javascript:goPage('2')" class="end">맨뒤</a>
</div> -->
<div class="paging">
	<a href="#" class="first">맨앞</a>
	<a href="#" class="prev">이전</a>
	<strong>1</strong>
	<a href="#" class="next">다음</a>
	<a href="#" class="end">맨뒤</a>
</div>
<link rel="stylesheet" href="${ctp}/css/layout/paginate.css">