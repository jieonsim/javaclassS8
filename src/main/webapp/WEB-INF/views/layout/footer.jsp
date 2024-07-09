<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctp}/css/layout/footer.css">
<script src="${ctp}/js/layout/footer.js"></script>

<!-- 데스트톱 푸터 -->
<footer class="common_footer">
	<div class="footer_menu">
		<div class="container">
			<ul class="footer_menu_list list-inline text-left">
				<li class="footer_menu_item list-inline-item">
					<a href="#" id="introductionCompany" class="footer_menu_link">회사소개</a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link"> 개인정보 처리방침 </a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link">청소년 보호정책</a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link">이용약관</a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link">고객센터</a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link">티켓판매안내</a>
				</li>
				<li class="footer_menu_item list-inline-item">
					<a href="#" class="footer_menu_link">광고안내</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer_inner container p-4">
		<span class="footer_corp_title font-weight-bold">티켓챔프 주식회사</span>
		<address class="footer_address mt-2">
			<p style="margin-bottom: 0px;">
				<span class="footer_address_item d-inline-block">주소: 28575 충북
					청주시 서원구 사직대로 109 4층</span>
				<span class="footer_address_item d-inline-block">대표이사: 심지언</span>
				<span class="footer_address_item d-inline-block">사업자등록번호:
					123-45-67890</span>
			</p>
			<p>
				<span class="footer_address_item d-inline-block">1234-1234</span>
				<span class="footer_address_item d-inline-block">membership@ticketchamp.co.kr</span>
				<span class="footer_address_item d-inline-block">통신판매업 신고번호:
					제 2024-충북청주-77777호</span>
				<span class="footer_address_item d-inline-block"> 사업자정보확인</span>
				<span class="footer_address_item d-inline-block">개인정보보호 책임자:
					심지언</span>
			</p>
		</address>
		<span class="footer_copyright d-block mt-3">Copyright © Ticket
			Champ Corporation. All rights reserved.</span>
		<div class="footer_etc mt-3">
			<ul class="footer_sns list-inline">
				<li class="footer_sns_item list-inline-item">
					<a href="#" class="footer_sns_link">
						<span class="common_icon icon_naverblog_gray">
							<img alt="네이버블로그" src="${ctp}/images/layout/footer/naverblog.svg">
						</span>
					</a>
				</li>
				<li class="footer_sns_item list-inline-item">
					<a href="#" class="footer_sns_link">
						<span class="common_icon icon_youtube_gray">
							<img alt="유튜브" src="${ctp}/images/layout/footer/youtube.svg">
						</span>
					</a>
				</li>
				<li class="footer_sns_item list-inline-item">
					<a href="#" class="footer_sns_link">
						<span class="common_icon icon_facebook_gray">
							<img alt="페이스북" src="${ctp}/images/layout/footer/facebook.svg">
						</span>
					</a>
				</li>
				<li class="footer_sns_item list-inline-item">
					<a href="#" class="footer_sns_link">
						<span class="common_icon icon_instagram_gray">
							<img alt="인스타그램" src="${ctp}/images/layout/footer/instagram.svg">
						</span>
					</a>
				</li>
				<li class="footer_sns_item list-inline-item">
					<a href="#" class="footer_sns_link">
						<span class="common_icon icon_twitter_gray">
							<img alt="트위터" src="${ctp}/images/layout/footer/twitter.svg">
						</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
</footer>

<!-- 모바일 푸터 -->
<footer class="m_footer">
	<div class="footer_inner">
		<div class="footer_toggle">
			<button type="button" class="btn footer_toggle_btn"
				aria-expanded="false">
				<span class="text">티켓챔프 주식회사</span>
				<span class="blind">사업자 정보 자세히 보기</span>
			</button>
			<div class="footer_toggle_cont">
				<address>
					대표이사 : 심지언
					<br>
					28575, 충북 청주시 서원구 사직대로 109 4층
					<br>
					사업자등록번호 : 123 45 67890
					<br>
					통신판매업 신고번호 : 제 2024 충북청주 77777 호
					<br>
					고객센터 : 1234 5678 membership@ticketchamp.co.kr
				</address>
			</div>
		</div>
		<ul class="footer_term_list">
			<li class="footer_term_item">
				<a href="#" class="footer_term_link">이용약관</a>
			</li>
			<li class="footer_term_item">
				<a href="#" class="footer_term_link"> 개인정보 처리방침 </a>
			</li>
			<li class="footer_term_item">
				<a href="#" class="footer_term_link">청소년 보호정책</a>
			</li>
			<li class="footer_term_item">
				<a href="#" class="footer_term_link">사업자정보</a>
			</li>
		</ul>
		<span class="footer_copyright">Copyright © Ticket Champ Corp.
			All rights reserved.</span>
	</div>
</footer>