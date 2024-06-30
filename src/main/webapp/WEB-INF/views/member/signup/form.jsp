<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${ctp}/images/common/favicon.png"
	type="image/png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입-티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/member/signup/common.css">
<link rel="stylesheet" href="${ctp}/css/member/signup/agreement.css">
</head>
<body>
	<div class="memberContainer">
		<div class="header">
			<div class="headerInner">
				<a class="header_title_link" href="${ctp}/">
					<i class="ph ph-person-simple-throw" id="header_title_logo"></i>
					<span class="logo-text">ticket</span>
					<span class="logo-text champ">champ</span>
				</a>
				<div class="headerTitle">정보입력</div>
			</div>
		</div>
		<div class="contents">
			<div class="contentWrapper registContent">
				<div class="uBlock">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputId">아이디</label>
								<div class="inputBox">
									<input type="text" id="inputId" class="inputText"
										placeholder="6~20자 영문, 숫자" tabindex="1" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputPw">비밀번호</label>
								<div class="inputBox">
									<input type="password" id="inputPw" class="inputText"
										placeholder="8~12자 영문, 숫자, 특수문자" tabindex="2" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="uBtnArea">
								<button type="button" class="uBtn">보기</button>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputPwConfirm">비밀번호 확인</label>
								<div class="inputBox">
									<input type="password" id="inputPwConfirm" class="inputText"
										placeholder="8~12자 영문, 숫자, 특수문자" tabindex="3" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="uBtnArea">
								<button type="button" class="uBtn">보기</button>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputName">이름</label>
								<div class="inputBox">
									<input type="text" id="inputName" class="inputText"
										tabindex="4" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock">
					<div class="uInputArea emailType">
						<div class="col">
							<div class="uInput">
								<label for="inputEmail">이메일</label>
								<div class="inputBox">
									<input type="text" id="inputEmail" class="inputText"
										tabindex="5" value="">
								</div>
							</div>
						</div>
						<div class="col selectCol">
							<div class="uSelectBox">
								<label>
									<select tabindex="6"><option value="direct">직접입력</option>
										<option value="naver.com">@naver.com</option>
										<option value="hanmail.net">@hanmail.net</option>
										<option value="gmail.com">@gmail.com</option>
										<option value="nate.com">@nate.com</option>
										<option value="hotmail.com">@hotmail.com</option></select>
								</label>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
					<div class="accountValiBlock" style="display: none;">
						<div class="accountGuide"></div>
						<p class="blockText">동일 정보로 가입된 계정으로 로그인 하시겠습니까?</p>
						<a href="#" class="btn btnArrow">로그인하기</a>
					</div>
				</div>
				<div class="uBlock">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputCellphone">휴대폰</label>
								<div class="inputBox">
									<input type="text" id="inputCellphone" class="inputText"
										placeholder="010 1234 5678" tabindex="7" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="uBtnArea">
								<button type="button" class="uBtn borderType">인증번호받기</button>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: none;">점유인증을 하여 휴대폰
						번호를 등록해주세요. 등록한 번호는 로그인 이후 변경 가능합니다.</div>
					<div class="accountValiBlock" style="display: none;">
						<div class="accountGuide"></div>
						<p class="blockText">동일 정보로 가입된 계정으로 로그인 하시겠습니까?</p>
						<a href="#" class="btn btnArrow">로그인하기</a>
					</div>
				</div>
				<div class="uBlock" style="display: none;">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputCertifyNum">인증번호</label>
								<div class="inputBox">
									<input type="text" id="inputCertifyNum" class="inputText"
										tabindex="8" value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="uBtnArea">
								<button type="button" class="uBtn borderType">재발송</button>
								<button type="button" class="uBtn borderType">확인</button>
							</div>
						</div>
					</div>
					<div class="certifyTime" style="display: none;">
						인증유효시간
						<span class="time">00:00</span>
					</div>
				</div>
				<div class="uBlock checkBlock">
					<div class="uCheckbox">
						<label>
							<input type="checkbox">
							<span class="text">SMS, 이메일로 상품 및 이벤트 정보를 받겠습니다.(선택)</span>
						</label>
					</div>
					<div class="uCheckbox">
						<label>
							<input type="checkbox">
							<span class="text">14세 미만입니다.</span>
						</label>
					</div>
					<div class="uErrorText" style="display: none;">14세 미만 가입시
						법정대리인 동의 필수 입니다.</div>
				</div>
				<div class="uBlock">
					<p class="blockText">만 14세 미만 회원은 법정대리인(부모님) 동의를 받은 경우만 회원가입이
						가능합니다.</p>
				</div>
				<div class="uBlock" style="display: none;">
					<div class="uInputArea">
						<div class="col">
							<div class="uInput">
								<label for="inputAgreeName">이름</label>
								<div class="inputBox">
									<input type="text" id="inputAgreeName" class="inputText"
										value="">
									<button type="button" class="btnDel" aria-label="삭제"></button>
								</div>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock" style="display: none;">
					<div class="uInputArea emailType">
						<div class="col">
							<div class="uInput">
								<label for="inputAgreeEmail">이메일</label>
								<div class="inputBox">
									<input type="text" id="inputAgreeEmail" class="inputText"
										value="">
								</div>
							</div>
						</div>
						<div class="col selectCol">
							<div class="uSelectBox">
								<label>
									<select><option value="direct">직접입력</option>
										<option value="naver.com">@naver.com</option>
										<option value="hanmail.net">@hanmail.net</option>
										<option value="gmail.com">@gmail.com</option>
										<option value="nate.com">@nate.com</option>
										<option value="hotmail.com">@hotmail.com</option></select>
								</label>
							</div>
						</div>
					</div>
					<div class="uErrorText" style="display: block;"></div>
				</div>
				<div class="uBlock agreeBlock" style="display: none;">
					<div class="uInputArea">
						<div class="col">
							<span class="label">가입동의받기</span>
						</div>
						<div class="col">
							<div class="uBtnArea">
								<button type="button" class="uBtn borderType sType">법정대리인
									본인 인증</button>
							</div>
						</div>
					</div>
				</div>
				<div class="ubtnArea">
					<div class="col">
						<button type="button" class="uBtn point" disabled>가입완료</button>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">Copyright © TicketChamp Corp. All rights
				reserved.</div>
		</div>
	</div>
</body>
</html>