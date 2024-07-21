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
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/my/contents.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
<style>
.btn_full:hover {
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
		<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
			<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont">
					<h3 class="blind">회원정보관리</h3>
					<div class="h3">
						<h4 class="tit_mber02">회원정보수정</h4>
					</div>
					<div class="mtmwrite_tbl mgt30">
						<table>
							<caption>회원 정보 수정 내용</caption>
							<colgroup>
								<col style="width: 160px">
								<col>
							</colgroup>
							<tbody>
								<tr style="border-bottom: 1px solid #ecedf2;">
									<th scope="row">아이디</th>
									<td>
										wld******@naver.com
									</td>
								</tr>
								<tr style="border-bottom: 1px solid #ecedf2;">
									<th scope="row">비밀번호</th>
									<td>
										<a href="javascript:;" id="pwBtn" class="btn btn_blank">비밀번호 변경</a>
									</td>
								</tr>
								<tr style="border-bottom: 1px solid #ecedf2;">
									<th scope="row">연락처</th>
									<td class="number">010******09</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>충청북도 청주시 상당구 상당로 195 (북문로3가, 한화생명빌딩) ***</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="list_btn">
						<a href="#" id="pwBtn2" class="btn btn_full">회원정보 수정</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>