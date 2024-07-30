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
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
				<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont ng-scope">
					<h3 class="blind">예매관리</h3>

					<div class="h3_line">
						<h4>예매확인/취소</h4>
					</div>
					<p class="guide_txt">
						예매 취소가 완료되었습니다. 취소가 정상적으로 이루어졌는지 아래 내용을 다시 확인하시기 바랍니다.
						<br>
						확인하기 버튼을 누르면, 예매확인/취소 페이지로 이동합니다.
					</p>

					<h5 class="text_tit">예매정보</h5>
					<div class="basic_tbl_v4">
						<table>
							<caption>예매한 티켓정보</caption>
							<colgroup>
								<col style="width: 116px">
								<col style="width: 255px">
								<col style="width: 116px">
								<col>
							</colgroup>
							<tbody>
								<tr class="line">
									<th scope="row">예매번호</th>
									<td class="ng-binding">1468853619</td>
									<th scope="row">티켓명</th>
									<td class="ng-scope">
										<span class="ng-binding ng-scope">
										</span>
										<span class="ng-binding ng-scope"> SSG 랜더스 vs 롯데자이언츠 </span>
									</td>
								</tr>
								<tr>
									<th scope="row">관람일시</th>
									<td class="ng-binding">2024.07.30(화) 18:30</td>
									<th scope="row">관람장소</th>
									<td class="ng-binding">인천 SSG 랜더스 필드</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="list_btn">
						<a class="btn btn_full">확인하기</a>
					</div>

					<h5 class="mgt40 text_tit">환불내역</h5>
					<div class="basic_tbl_v4">
						<table>
							<caption>환불내역</caption>
							<colgroup>
								<col style="width: 105px">
								<col>
							</colgroup>
							<tbody>
								<tr class="line">
									<th scope="row">환불금액</th>
									<td class="fbold">
										<span class="color_point ng-binding">36,000원</span>
									</td>
								</tr>
								<tr>
									<th scope="row">환불방법</th>
									<td>
										<p class="ng-binding ng-scope">신용카드(간편결제) 환불</p>
									</td>
								</tr>
								<tr>
									<th scope="row">환불 일정</th>
									<td>
										<p class="ng-binding ng-scope">일반적으로 당사자의 취소 처리가 완료된 3 ~ 6일 후 카드사의 취소가 확인됩니다.</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>