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
<!-- <div class="paging">
	<a href="#" class="first">맨앞</a>
	<a href="#" class="prev">이전</a>
	<strong>1</strong>
	<a href="#" class="next">다음</a>
	<a href="#" class="end">맨뒤</a>
</div> -->
<div class="paging" id="pagination">
	<a href="#" class="first">맨앞</a>
	<a href="#" class="prev">이전</a>
	<strong>1</strong>
	<a href="#">2</a>
	<a href="#">3</a>
	<a href="#" class="next">다음</a>
	<a href="#" class="end">맨뒤</a>
</div>
<div class="paging" id="pagination">
	<a href="javascript:goPage('1')" class="first">맨앞</a>
	<a href="javascript:goPage('1')" class="prev">이전</a>
	<a href="javascript:goPage('1')"> 1</a>
	<strong>2</strong>
	<a href="javascript:goPage('2')" class="next">다음</a>
	<a href="javascript:goPage('2')" class="end">맨뒤</a>
</div>

<div class="paging">
	<a class="first">맨앞</a>
	<a class="prev">이전</a>
	<a>1</a>
	<a>2</a>
	<a>3</a>
	<strong>4</strong>
	<a class="next">다음</a>
	<a class="end">맨뒤</a>
</div>

<div class="paging">
	<a class="first">맨앞</a>
	<a class="prev">이전</a>
	<strong>1</strong>
	<a>2</a>
	<a>3</a>
	<a>4</a>
	<a>5</a>
	<a>6</a>
	<a>7</a>
	<a>8</a>
	<a>9</a>
	<a>10</a>
	<a class="next">다음</a>
	<a class="end">맨뒤</a>
</div>
<div class="paging">
	<a class="first">맨앞</a>
	<a class="prev">이전</a>
	<strong>11</strong>
	<a>12</a>
	<a>13</a>
	<a>14</a>
	<a>15</a>
	<a>16</a>
	<a>17</a>
	<a>18</a>
	<a>19</a>
	<a>20</a>
	<a class="next">다음</a>
	<a class="end">맨뒤</a>
</div>
<link rel="stylesheet" href="${ctp}/css/layout/paginate.css">