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
<link rel="stylesheet" href="${ctp}/css/my/memberInfo/matchPassword.css">
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
					<h3 class="blind">회원정보관리</h3>
					<div class="h3">
						<h4 class="tit_mber02">비밀번호 확인</h4>
					</div>
					<div class="mtmwrite_tbl mgt30">
						<div id="container" class="my-4 py-3">
							<h1 class="blind">회원 정보</h1>
							<div class="content">
								<div class="tit_area">
									<h2 class="h_tit">
										개인 정보를 안전하게 보호하기 위하여
										<br>
										비밀번호를 한번 더 입력해 주세요.
									</h2>
								</div>
								<form id="matchPasswordForm" method="post">
									<fieldset>
										<legend>비밀번호 확인</legend>
										<span class="inp_bx">
											<span class="inp_txt">
												<input type="password" class="inp" id="inputPassword" name="password" maxlength="15" value="" autocomplete="off" title="비밀번호" placeholder="비밀번호">
											</span>
											<p class="error_txt" id="errorBox" role="alert" style="display: none;"></p>
										</span>
										<div class="btn_area">
											<button type="submit" class="btn btn_full btn_point">확인</button>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/my/memberInfo/matchPassword.js"></script>
</body>
</html>