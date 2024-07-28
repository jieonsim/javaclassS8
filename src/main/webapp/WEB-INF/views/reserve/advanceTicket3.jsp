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
<link rel="stylesheet" href="${ctp}/css/sports/reserve.css">
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	width: 663px;
	height: 604px;
	box-sizing: border-box;
	background-color: #f0f0f0;
}

.container {
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

h1 {
	margin: 0;
	font-size: 18px;
}

.close-btn {
	font-size: 20px;
	background: none;
	border: none;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

input[type="text"] {
	width: calc(100% - 70px);
	padding: 5px;
}

.register-btn {
	width: 60px;
	background-color: #6c757d;
	color: white;
	border: none;
	padding: 5px;
	cursor: pointer;
}

.summary {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	padding: 10px 0;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.footer {
	margin-top: 20px;
	text-align: right;
}

.footer button {
	padding: 10px 20px;
	margin-left: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.apply-btn {
	background-color: #007bff;
	color: white;
}

.cancel-btn {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="d-flex justify-content-center start">
				<h1>티켓챔프 예매권</h1>
				<span>사용매수 : 1매</span>
			</div>
			<button class="close-btn">&times;</button>
		</div>
		<table>
			<colgroup>
				<col style="width: 46px">
				<col style="width: 347px">
				<col style="">
			</colgroup>
			<thead>
				<tr>
					<th>NO.</th>
					<th>예매건 번호</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>
						<input type="text" placeholder="예매건 번호를 입력하세요">
						<button class="register-btn">등록</button>
					</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="summary">
			<div>총 주문금액</div>
			<div>총 할인금액</div>
		</div>
		<div class="summary">
			<div>
				<strong>8,000원</strong>
			</div>
			<div>
				<strong>8,000원</strong>
			</div>
		</div>
		<div class="footer">
			<button class="apply-btn">적용</button>
			<button class="cancel-btn">취소</button>
		</div>
	</div>
</body>
</html>