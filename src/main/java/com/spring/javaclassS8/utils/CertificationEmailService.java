package com.spring.javaclassS8.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class CertificationEmailService {

	@Autowired
	private JavaMailSender mailSender;

	public String sendCertificationEmail(String email) throws MessagingException {
		String certificationNumber = generateCertificationNumber();
		String certificationTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

		String htmlContent = getHtmlTemplate(certificationNumber, certificationTime);

		sendHtmlEmail(email, "[티켓챔프] 요청하신 인증번호 안내드립니다.", htmlContent);

		return certificationNumber;
	}

	private String generateCertificationNumber() {
		return String.format("%08d", new Random().nextInt(100000000));
	}

	// 프로젝트 제출 전 'localhost:9090' 을 '49.142.157.251:9090' 으로 수정하기 !!!
	private String getHtmlTemplate(String certificationNumber, String certificationTime) {
		return "<div>\r\n"
				+ "	<div\r\n"
				+ "		style=\"Margin: 0; padding: 0; border: 0; background-color: #f4f4f4\">\r\n"
				+ "		<table\r\n"
				+ "			style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\r\n"
				+ "			<tbody>\r\n"
				+ "				<tr>\r\n"
				+ "					<td align=\"center\"\r\n"
				+ "						style=\"Margin: 0; padding: 0; border: 0; border-spacing: 0\">\r\n"
				+ "						<div style=\"max-width: 600px; Margin: 0 auto\">\r\n"
				+ "							<table\r\n"
				+ "								style=\"width: 100%; max-width: 600px; Margin: 0 auto; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif; text-align: left\">\r\n"
				+ "								<thead style=\"background-color: #fff\">\r\n"
				+ "									<tr>\r\n"
				+ "										<th colspan=\"1\" rowspan=\"1\" style=\"width: 100%; height: 40px\"\r\n"
				+ "											height=\"40\">&nbsp;</th>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<th colspan=\"1\" rowspan=\"1\"\r\n"
				+ "											style=\"width: 560px; height: 22px; padding: 0 3.3%; font-size: 0; text-align: left\">\r\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/\"\r\n"
				+ "												target=\"_blank\"\r\n"
				+ "												style=\"display: block; text-decoration: none; color: #fff\"\r\n"
				+ "												rel=\"noreferrer noopener\">\r\n"
				+ "												<span class=\"logo-text\"\r\n"
				+ "													style=\"color: #000000; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">ticket</span>\r\n"
				+ "												<span class=\"logo-text champ\"\r\n"
				+ "													style=\"color: #fa2828; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">champ</span>\r\n"
				+ "											</a>\r\n"
				+ "										</th>\r\n"
				+ "									</tr>\r\n"
				+ "								</thead>\r\n"
				+ "								<tbody style=\"width: 100%; background-color: #fff\">\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 560px; padding: 0 3.3%; font-weight: 400; font-size: 32px; line-height: 38px; color: #202020; font-family: Pretendard-Regular, sans-serif;\">\r\n"
				+ "											요청하신\r\n"
				+ "											<span style=\"color: #fa2828\">인증번호</span>\r\n"
				+ "											안내드립니다.\r\n"
				+ "										</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px\">\r\n"
				+ "											안녕하세요.</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 100%; height: 20px\" height=\"20\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 560px; padding: 0 3.3%; font-size: 14px; line-height: 20px\">\r\n"
				+ "											아래의 인증번호 8자리를 입력창에 입력해주세요.\r\n"
				+ "											<br>\r\n"
				+ "											인증번호는 메일이 발송되는 시점부터\r\n"
				+ "											<span style=\"font-weight: 700\">10분간만 유효</span>\r\n"
				+ "											합니다.\r\n"
				+ "										</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td style=\"width: 93.3%; Margin: 0; padding: 0 3.3%\">\r\n"
				+ "											<table\r\n"
				+ "												style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\r\n"
				+ "												<tbody>\r\n"
				+ "													<tr>\r\n"
				+ "														<td\r\n"
				+ "															style=\"width: 25%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\"\r\n"
				+ "															height=\"54\">인증번호</td>\r\n"
				+ "														<td\r\n"
				+ "															style=\"width: 75%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; font-weight: bold; font-size: 15px; text-align: left; color: #202020\"\r\n"
				+ "															height=\"54\">\r\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + certificationNumber + "</p>\r\n"
				+ "														</td>\r\n"
				+ "													</tr>\r\n"
				+ "													<tr>\r\n"
				+ "														<td\r\n"
				+ "															style=\"width: 25%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\"\r\n"
				+ "															height=\"54\">발송시간</td>\r\n"
				+ "														<td\r\n"
				+ "															style=\"width: 75%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; font-weight: bold; font-size: 15px; text-align: left; color: #202020\"\r\n"
				+ "															height=\"54\">\r\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + certificationTime + "</p>\r\n"
				+ "														</td>\r\n"
				+ "													</tr>\r\n"
				+ "												</tbody>\r\n"
				+ "											</table>\r\n"
				+ "										</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; height: 45px; Margin: 0; padding: 0; background-color: #fff\"\r\n"
				+ "											height=\"45\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "								</tbody>\r\n"
				+ "								<tfoot\r\n"
				+ "									style=\"Margin: 0; padding: 0; text-align: center; font-size: 11px; color: #707070\">\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; height: 20px; background-color: #f4f4f4\"\r\n"
				+ "											height=\"20\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; Margin: 0; padding: 0 3.3%; overflow: hidden; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070\">\r\n"
				+ "											<a href=\"#\" target=\"_blank\"\r\n"
				+ "												style=\"text-decoration: none; color: #707070\" title=\"이용약관\"\r\n"
				+ "												rel=\"noreferrer noopener\">이용약관</a>\r\n"
				+ "											&nbsp;&nbsp;\r\n"
				+ "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\r\n"
				+ "											&nbsp;&nbsp;\r\n"
				+ "											<a href=\"#\" target=\"_blank\"\r\n"
				+ "												style=\"text-decoration: none; color: #707070\"\r\n"
				+ "												title=\"개인정보처리방침\" rel=\"noreferrer noopener\">개인정보처리방침</a>\r\n"
				+ "											&nbsp;&nbsp;\r\n"
				+ "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\r\n"
				+ "											&nbsp;&nbsp;\r\n"
				+ "											<a href=\"#\" target=\"_blank\"\r\n"
				+ "												style=\"text-decoration: none; color: #707070\"\r\n"
				+ "												title=\"전자금융거래약관\" rel=\"noreferrer noopener\">전자금융거래약관</a>\r\n"
				+ "										</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; height: 20px; background-color: #f4f4f4\"\r\n"
				+ "											height=\"20\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; Margin: 0; padding: 0 3.3%; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070; line-height: 18px;\">\r\n"
				+ "											본 메일은 발신전용입니다. 궁금한 사항은 티켓챔프 고객센터를 이용해 주십시오.\r\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/\" title=\"고객센터 연결하기\"\r\n"
				+ "												style=\"text-decoration: none; color: #707070\"\r\n"
				+ "												rel=\"noreferrer noopener\" target=\"_blank\">고객센터 :\r\n"
				+ "												1234-1234</a>\r\n"
				+ "											<br>\r\n"
				+ "											Copyright ⓒ TicketChamp Corporation. All Rights Reserved.\r\n"
				+ "										</td>\r\n"
				+ "									</tr>\r\n"
				+ "									<tr>\r\n"
				+ "										<td\r\n"
				+ "											style=\"width: 100%; height: 20px; background-color: #f4f4f4\"\r\n"
				+ "											height=\"20\">&nbsp;</td>\r\n"
				+ "									</tr>\r\n"
				+ "								</tfoot>\r\n"
				+ "							</table>\r\n"
				+ "						</div>\r\n"
				+ "					</td>\r\n"
				+ "				</tr>\r\n"
				+ "				<tr>\r\n"
				+ "					<td\r\n"
				+ "						style=\"width: 100%; height: 45px; Margin: 0; padding: 0; border: 0; border-spacing: 0; background-color: #fff\">&nbsp;</td>\r\n"
				+ "				</tr>\r\n"
				+ "			</tbody>\r\n"
				+ "		</table>\r\n"
				+ "	</div>\r\n"
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