<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/member/signup/이용약관.css">
<div class="modal" id="개인정보수집동의서_선택">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h1 class="modal-title">개인정보 수집동의서 (선택)</h1>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="article">
					<h3 class="article_title">티켓챔프는 서비스 제공을 위하여 아래와 같이 회원의
						개인정보를 수집, 활용합니다.</h3>
					<p class="article_text">* 개인정보 수집∙이용에 대한 동의를 거부할 수 있으며, 거부할 경우
						서비스 이용이 제한됩니다.</p>
					<!-- <table class="termsTable"> -->
					<table class="table table-bordered">
						<colgroup>
							<col style="width: 40%">
							<col style="width: 30%">
							<col style="width: 30%">
						</colgroup>
						<tbody>
							<tr>
								<th class="emphasisTarget">수집 및 이용 목적</th>
								<th class="emphasisTarget">수집 항목</th>
								<th class="emphasisTarget">보유기간</th>
							</tr>
							<tr>
								<td class="emphasisTarget emphasis">
									<span>계약이행에 대한 연락 및 안내 등의 고지를 위한 목적, 서비스 판매 정보제공 홍보
										가입권유활동 (할인쿠폰, 특가상품정보, I-Point 혜택, 판촉광고 포함) 안내 등의 고지를 위한 목적</span>
								</td>
								<td class="emphasisTarget">연락처, SMS수신여부, 이메일, 이메일 수신여부,
									DM수신여부, 유선안내(TM) 수신여부, 성명, 생년월일, 성별, CI</td>
								<td rowspan="3" class="emphasisTarget emphasis">
									<span>수집 및 이용목적의 달성 시 파기. 단, 관계법령에 의해 보존할 경우 그 의무기간 동안
										보관(내부 지침에 의해 부정거래 방지 및 대응 목적으로 7일간 보관)</span>
								</td>
							</tr>
							<tr>
								<td class="emphasisTarget emphasis">
									<span>회원님의 편의를 위한 맞춤광고 및 서비스제공, 기념일 행사쿠폰 발송 및 서비스 품질 향상을
										위한 제휴서비스를 제공하기 위한 목적</span>
								</td>
								<td class="emphasisTarget">생년월일, 성별</td>
							</tr>
							<tr>
								<td class="emphasisTarget emphasis">
									<span>인터파크의 상품/서비스 추천</span>
								</td>
								<td class="emphasisTarget">성별, 생년월일, 휴대전화번호, 전화번호, 이메일</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>