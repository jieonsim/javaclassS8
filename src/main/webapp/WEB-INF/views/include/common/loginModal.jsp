<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="modal fade" id="loginModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body">
				<h1 class="header_title mb-0">
					<i class="ph ph-person-simple-throw" id="header_title_logo"></i>
					<a class="header_title_link" href="${ctp}/">
						<span class="logo-text">ticket</span>
						<span class="logo-text champ">champ</span>
					</a>
				</h1>
				<form name="loginForm" class="login-form" method="post"
					onsubmit="return validateForm();">
					<div class="form-group row">
						<div class="col">
							<input type="text" class="form-control" name="email" id="email"
								placeholder="이메일 아이디를 입력해주세요." value="${id}" autofocus />
						</div>
					</div>
					<div class="form-group row">
						<div class="col">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="비밀번호를 입력해주세요." />
						</div>
						<div class="col-sm-10 offset-sm-2 text-right mt-2 mb-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="true"
									name="rememberId" checked>
								<label class="form-check-label" for="rememberId" id="rememberId">아이디
									저장</label>
							</div>
						</div>
					</div>
					<div class="form-group text-center">
						<button type="submit"
							class="btn btn-custom btn-lg form-control mb-3" id="logInBtn">로그인</button>
					</div>
				</form>
				<div class="text-center">
					<a href="${ctp}/member/findid" class="link-small">아이디 찾기</a>
					<span id="divisionLine">I</span>
					<a href="${ctp}/member/findpwd" class="link-small">비밀번호 찾기</a>
					<span id="divisionLine">I</span>
					<a href="${ctp}/member/signup" class="link-small">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</div>