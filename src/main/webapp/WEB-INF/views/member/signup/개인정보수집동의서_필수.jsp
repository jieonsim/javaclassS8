<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/member/signup/이용약관.css">
<div class="modal" id="개인정보수집동의서_필수">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h1 class="modal-title">개인정보 수집동의서 (필수)</h1>
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
							<col style="width: 35%">
							<col style="width: 35%">
							<col style="width: 30%">
						</colgroup>
						<tbody>
							<tr>
								<th class="emphasisTarget">수집 및 이용 목적</th>
								<th class="emphasisTarget">수집 항목</th>
								<th class="emphasisTarget">보유기간</th>
							</tr>
							<tr>
								<td class="emphasisTarget">서비스 가입, 이용자 식별, 서비스 이용 및 제공,
									상담∙불만∙민원처리, 고지∙안내사항 전달</td>
								<td class="emphasisTarget">이름, 휴대전화번호, 이메일, 아이디, 비밀번호
									(SNS가입 시)생년월일, 성별</td>
								<td rowspan="3" class="emphasisTarget emphasis">
									<span>수집 및 이용목적의 달성 시 파기. 단, 관계법령에 의해 보존할 경우 그 의무기간 동안
										보관(내부 지침에 의해 부정거래 방지 및 대응 목적으로 7일간 보관)</span>
								</td>
							</tr>
							<tr>
								<td class="emphasisTarget">만 14세 미만 아동에 대한 법정대리인 동의 확인(단,
									SNS회원가입 시 해당 내용 제외)</td>
								<td class="emphasisTarget">법정대리인의 이름, 이메일, 휴대전화번호, 통신사</td>
							</tr>
							<tr>
								<td class="emphasisTarget">불법∙부정이용방지, 비인가 사용 방지, 분쟁조정 해결을
									위한 기록보존, 상품∙서비스 이용실적 정보를 활용한 통계∙분석, 상품∙서비스 개선</td>
								<td class="emphasisTarget">휴대전화번호, 가상카드번호, 아이디, 이름, 생년월일,
									성별, CI, DI, IP Address, 방문일시, 서비스 이용기록(자동으로 생성되는 개인정보), 주소</td>
							</tr>
						</tbody>
					</table>
					<p class="article_text">서비스 이용 과정에서 부정이용방지, 비인가 사용 방지, 통계 및 서비스
						품질 향상 목적으로 단말기정보(OS, 모델명 등), IP주소, 쿠키, 서비스 이용 기록(방문일시, 접속기록) 정보가
						자동으로 생성되어 수집될 수 있습니다. 자동으로 생성되어 수집된 정보는 서비스 제공 기간동안 보유 및 이용하며, 수집
						및 이용목적의 달성 시 파기됩니다.</p>
				</div>
			</div>
		</div>
	</div>
</div>