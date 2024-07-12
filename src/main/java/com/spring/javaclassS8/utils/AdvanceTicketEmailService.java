package com.spring.javaclassS8.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class AdvanceTicketEmailService {

	@Autowired
	private JavaMailSender mailSender;

	public String sendAdvanceTicketEmail(String email) throws MessagingException {
		String advanceTicketNumber = generateAdvanceTicketNumber();
		String expiresDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		String htmlContent = getHtmlTemplate(advanceTicketNumber, expiresDate);

		sendHtmlEmail(email, "[티켓챔프] 스포츠 예매권 전달드립니다.", htmlContent);

		return advanceTicketNumber;
	}

	private String generateAdvanceTicketNumber() {
		return "??";
	}

	// 프로젝트 제출 전 'localhost:9090' 을 '49.142.157.251:9090' 으로 수정하기 !!!
	private String getHtmlTemplate(String advanceTicketNumber, String expiresDate) {
		return "<div>\n"
				+ "	<div style=\"Margin: 0; padding: 0; border: 0; background-color: #f4f4f4\">\n"
				+ "		<table style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\n"
				+ "			<tbody>\n"
				+ "				<tr>\n"
				+ "					<td align=\"center\" style=\"Margin: 0; padding: 0; border: 0; border-spacing: 0\">\n"
				+ "						<div style=\"max-width: 600px; Margin: 0 auto\">\n"
				+ "							<table style=\"width: 100%; max-width: 600px; Margin: 0 auto; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif; text-align: left\">\n"
				+ "								<thead style=\"background-color: #fff\">\n"
				+ "									<tr>\n"
				+ "										<th colspan=\"1\" rowspan=\"1\" style=\"width: 100%; height: 40px\" height=\"40\">&nbsp;</th>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<th colspan=\"1\" rowspan=\"1\" style=\"width: 560px; height: 22px; padding: 0 3.3%; font-size: 0; text-align: left\">\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/home\" target=\"_blank\" style=\"display: block; text-decoration: none; color: #fff\" rel=\"noreferrer noopener\">\n"
				+ "												<img src=\"http://localhost:9090/javaclassS8/images/common/logo40.svg\" alt=\"티켓챔프로고\" style=\"width: 40px; height: 40px; border: 0\">\n"
				+ "												<span class=\"logo-text\" style=\"color: #000000; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">ticket</span>\n"
				+ "												<span class=\"logo-text champ\" style=\"color: #fa2828; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">champ</span>\n"
				+ "											</a>\n"
				+ "										</th>\n"
				+ "									</tr>\n"
				+ "								</thead>\n"
				+ "								<tbody style=\"width: 100%; background-color: #fff\">\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-weight: 400; font-size: 32px; line-height: 38px; color: #202020; font-family: Pretendard-Regular, sans-serif;\">\n"
				+ "											<span style=\"color: #fa2828\">스포츠 예매권</span>\n"
				+ "											전달드립니다.\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px\">안녕하세요.</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px; line-height: 20px\">\n"
				+ "											스포츠 예매권은 티켓을 무료로 예매할 수 있는 결제수단입니다.\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px; line-height: 20px\">\n"
				+ "											아래의 예매권번호를 마이페이지에서 입력하여 미리 등록하거나,\n"
				+ "											<br>\n"
				+ "											예매 시 결제창에서 입력하여 사용할 수 있습니다.\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 93.3%; Margin: 0; padding: 0 3.3%\">\n"
				+ "											<table style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\n"
				+ "												<tbody>\n"
				+ "													<tr>\n"
				+ "														<td style=\"width: 25%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\" height=\"54\">예매권 번호</td>\n"
				+ "														<td style=\"width: 75%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; font-weight: bold; font-size: 15px; text-align: left; color: #202020\" height=\"54\">\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + advanceTicketNumber + "</p>\n"
				+ "														</td>\n"
				+ "													</tr>\n"
				+ "													<tr>\n"
				+ "														<td style=\"width: 25%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\" height=\"54\">유효기간</td>\n"
				+ "														<td style=\"width: 75%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; font-weight: bold; font-size: 15px; text-align: left; color: #202020\" height=\"54\">\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + expiresDate + "</p>\n"
				+ "														</td>\n"
				+ "													</tr>\n"
				+ "												</tbody>\n"
				+ "											</table>\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 45px; Margin: 0; padding: 0; background-color: #fff\" height=\"45\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "								</tbody>\n"
				+ "								<tfoot style=\"Margin: 0; padding: 0; text-align: center; font-size: 11px; color: #707070\">\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; Margin: 0; padding: 0 3.3%; overflow: hidden; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070\">\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"이용약관\" rel=\"noreferrer noopener\">이용약관</a>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"개인정보처리방침\" rel=\"noreferrer noopener\">개인정보처리방침</a>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"전자금융거래약관\" rel=\"noreferrer noopener\">전자금융거래약관</a>\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; Margin: 0; padding: 0 3.3%; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070; line-height: 18px;\">\n"
				+ "											본 메일은 발신전용입니다. 궁금한 사항은 티켓챔프 고객센터를 이용해 주십시오.\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/home\" title=\"고객센터 연결하기\" style=\"text-decoration: none; color: #707070\" rel=\"noreferrer noopener\" target=\"_blank\">고객센터 : 1234-1234</a>\n"
				+ "											<br>\n"
				+ "											Copyright ⓒ TicketChamp Corporation. All Rights Reserved.\n"
				+ "										</td>\n"
				+ "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n"
				+ "								</tfoot>\n"
				+ "							</table>\n"
				+ "						</div>\n"
				+ "					</td>\n"
				+ "				</tr>\n"
				+ "				<tr>\n"
				+ "					<td style=\"width: 100%; height: 45px; Margin: 0; padding: 0; border: 0; border-spacing: 0; background-color: #fff\">&nbsp;</td>\n"
				+ "				</tr>\n"
				+ "			</tbody>\n"
				+ "		</table>\n"
				+ "	</div>\n"
				+ "</div>";
	}

	private void sendHtmlEmail(String to, String subject, String htmlContent) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(htmlContent, true);

		mailSender.send(message);
	}
}