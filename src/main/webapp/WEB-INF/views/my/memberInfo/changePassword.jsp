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
						<h4 class="tit_mber02">비밀번호 변경</h4>
					</div>
					<div class="mtmwrite_tbl mgt30">
						<div id="container" class="my-4 py-3">
							<h1 class="blind">회원 정보</h1>
							<div class="content">
								<div class="tit_area">
									<h2 class="h_tit">
										비밀번호는 8~12자의 영문, 숫자, 특수문자 중
										<br>
										2가지 이상 조합으로 만들어 주세요.
									</h2>
								</div>
								<form id="changePasswordForm" method="post">
									<fieldset>
										<legend>비밀번호 변경</legend>
										<span class="inp_bx">
											<!-- <span class="inp_bx is_focus"> -->
											<!-- <span class="inp_bx is_value"> -->
											<!-- <span class="inp_bx is_focus error"> -->
											<span class="inp_txt">
												<input type="password" class="inp" id="old_password" name="old_password" value="" maxlength="15" autocomplete="off" autocapitalize="none" title="비밀번호" placeholder="사용 중인 비밀번호">
											</span>
											<p class="error_txt" id="old_pw_msg" role="alert"></p>
										</span>
										<span class="inp_bx inp_bx2">
											<span class="inp_txt">
												<input type="password" class="inp" id="new_password" name="new_password" value="" maxlength="15" autocomplete="off" autocapitalize="none" title="신규 비밀번호" placeholder="신규 비밀번호">
											</span>
											<p class="error_txt" id="pw_msg" role="alert"></p>
										</span>
										<span class="inp_bx">
											<span class="inp_txt">
												<input type="password" class="inp" id="confirm_password" name="confirm_password" value="" maxlength="15" onkeypress="showLayerByEnter(event);" autocomplete="off" autocapitalize="none" title="신규 비밀번호 재입력" placeholder="신규 비밀번호 재입력">
											</span>
											<p class="error_txt" id="pw_re_msg" role="alert"></p>
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
</body>
</html>