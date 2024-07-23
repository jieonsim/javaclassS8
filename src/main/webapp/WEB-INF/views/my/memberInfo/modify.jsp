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
<link rel="stylesheet" href="${ctp}/css/my/memberInfo/modify.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<main id="content" class="common_container mypage" role="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/my/layout/quickMenuWrap.jsp" />
			<div class="help_cont">
				<jsp:include page="/WEB-INF/views/my/layout/mySidebar.jsp" />
				<div class="help_rcont">
					<form id="memberInfoModifyForm" method="post">
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
									<tr class="table-border-bottom">
										<th scope="row">아이디</th>
										<td>${member.email}</td>
									</tr>
									<tr class="table-border-bottom">
										<th scope="row">비밀번호</th>
										<td>
											<a href="${ctp}/my/memberInfo/changePassword" id="pwBtn" class="btn btn_blank">비밀번호 변경</a>
										</td>
									</tr>
									<tr class="table-border-bottom">
										<th scope="row">이름</th>
										<td>
											<span class="inp_bx">
												<!-- <span class="inp_bx is_focus"> -->
												<!-- <span class="inp_bx is_value"> -->
												<!-- <span class="inp_bx is_focus error"> -->
												<span class="inp_txt">
													<input type="text" class="inp" id="inputName" name="name" title="이름" value="${member.name}">
												</span>
											</span>
											<p class="error_txt" id="errorBox1" role="alert" style="display: none;"></p>
										</td>
									</tr>
									<tr>
										<th scope="row">휴대폰 번호</th>
										<td>
											<span class="inp_bx">
												<span class="inp_txt">
													<input type="text" class="inp" id="inputPhone" name="phone" title="휴대폰번호" value="${member.phone}" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
												</span>
											</span>
											<p class="error_txt" id="errorBox2" role="alert" style="display: block;"></p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="list_btn">
							<button type="submit" id="pwBtn2" class="btn btn_full">회원정보 수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/memberInfo/modify.js"></script>
</body>
</html>