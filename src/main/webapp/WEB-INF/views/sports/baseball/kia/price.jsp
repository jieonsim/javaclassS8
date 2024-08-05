<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<h5 class="mgt20" style="font-size: 24px">요금안내</h5>
	<div class="basic_tbl cost">
		<table>
			<caption>
				<span class="blind">요금안내</span>
			</caption>
			<colgroup>
				<col style="width: 150px;">
				<col style="width: 110px;">
				<col style="width: 140px;">
			</colgroup>
			<thead class="text-center">
				<tr>
					<th>등급</th>
					<th>권종</th>
					<th>요금</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:set var="currentSeatId" value="" />
				<c:forEach var="price" items="${seatPrices}" varStatus="status">
					<c:if test="${price.seatId ne currentSeatId}">
						<c:if test="${not empty currentSeatId}">
							</tr>
						</c:if>
						<c:set var="currentSeatId" value="${price.seatId}" />
						<tr>
							<th rowspan="${price.rowspan}" scope="row">${price.seatName}</th>
					</c:if>
					<td class="sort">${price.ticketTypeName}</td>
					<td class="cost">
						<fmt:formatNumber value="${price.price}" type="number" />
						원
					</td>
					<c:if test="${price.seatId eq currentSeatId && status.index < seatPrices.size() - 1 && seatPrices[status.index + 1].seatId eq currentSeatId}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>