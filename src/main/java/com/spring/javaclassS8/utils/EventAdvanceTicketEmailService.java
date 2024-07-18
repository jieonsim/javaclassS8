package com.spring.javaclassS8.utils;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EventAdvanceTicketEmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendAdvanceTicketEmail(String email, String eventTitle, String advanceTicketNumber, Timestamp expiresAt) throws MessagingException {
		// Timestamp를 LocalDateTime으로 변환
		LocalDateTime localDateTime = expiresAt.toLocalDateTime();

		// 날짜 형식 지정
		String expiresDate = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		// 예매권 번호 포맷팅
        String formattedTicketNumber = formatTicketNumber(advanceTicketNumber);
        
		String htmlContent = getHtmlTemplate(eventTitle, formattedTicketNumber, expiresDate);

		sendHtmlEmail(email, "[티켓챔프] 이벤트 당첨을 축하드립니다.", htmlContent);

	}
	
	private String formatTicketNumber(String ticketNumber) {
        if (ticketNumber == null || ticketNumber.length() != 16) {
            return ticketNumber; // 유효하지 않은 번호는 그대로 반환
        }

        StringBuilder formatted = new StringBuilder();
        for (int i = 0; i < ticketNumber.length(); i++) {
            if (i > 0 && i % 4 == 0) {
                formatted.append('-');
            }
            formatted.append(ticketNumber.charAt(i));
        }
        return formatted.toString();
    }

	private String getHtmlTemplate(String eventTitle, String advanceTicketNumber, String expiresDate) {
		return "<div>\n" + "	<div style=\"Margin: 0; padding: 0; border: 0; background-color: #f4f4f4\">\n"
				+ "		<table style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\n"
				+ "			<tbody>\n" + "				<tr>\n" + "					<td align=\"center\" style=\"Margin: 0; padding: 0; border: 0; border-spacing: 0\">\n"
				+ "						<div style=\"max-width: 600px; Margin: 0 auto\">\n"
				+ "							<table style=\"width: 100%; max-width: 600px; Margin: 0 auto; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif; text-align: left\">\n"
				+ "								<thead style=\"background-color: #fff\">\n" + "									<tr>\n"
				+ "										<th colspan=\"1\" rowspan=\"1\" style=\"width: 100%; height: 40px\" height=\"40\">&nbsp;</th>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<th colspan=\"1\" rowspan=\"1\" style=\"width: 560px; height: 22px; padding: 0 3.3%; font-size: 0; text-align: left\">\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/home\" target=\"_blank\" style=\"display: block; text-decoration: none; color: #fff\" rel=\"noreferrer noopener\">\n"
				+ "												<span style=\"display: inline-block;\">\n"
				+ "													<svg aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"40\" fill=\"#fa2828\" viewBox=\"0 0 256 256\">\n"
				+ "														<path d=\"M128,92A36,36,0,1,0,92,56,36,36,0,0,0,128,92Zm0-48a12,12,0,1,1-12,12A12,12,0,0,1,128,44ZM44,96a20,20,0,1,1,20,20A20,20,0,0,1,44,96Zm184,17.6A12,12,0,0,1,208.49,123s-21-15.48-53.34.28c-.34,4.75-1,10.94-2.13,18l30.66,25.55a12,12,0,0,1,3.7,13l-16,48a12,12,0,1,1-22.76-7.59L162,180l-15.44-12.86a136.39,136.39,0,0,1-5.72,14.23c-14.64,31-39.34,51.93-73.42,62.15A11.82,11.82,0,0,1,64,244a12,12,0,0,1-3.45-23.5c37.84-11.35,60.77-38.71,68.41-81.44-24,13.54-43.11,17-56.46,17A65.87,65.87,0,0,1,51,152.31a12,12,0,0,1,9.72-21.93c.43.17,25.42,9.53,68.5-19.76,54.71-37.18,94.26-6.38,94.26-6.38A12,12,0,0,1,228,113.6Z\"></path>\n"
				+ "													</svg>\n"
				+ "													<span style=\"position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); white-space: nowrap; border: 0;\">티켓챔프 로고</span>\n"
				+ "												</span>\n"
				+ "												<span class=\"logo-text\" style=\"color: #000000; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">ticket</span>\n"
				+ "												<span class=\"logo-text champ\" style=\"color: #fa2828; font-size: 30px; font-family: LINESeedKR-Bd, sans-serif;\">champ</span>\n"
				+ "											</a>\n" + "										</th>\n" + "									</tr>\n"
				+ "								</thead>\n" + "								<tbody style=\"width: 100%; background-color: #fff\">\n"
				+ "									<tr>\n" + "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-weight: 400; font-size: 32px; line-height: 38px; color: #202020; font-family: Pretendard-Regular, sans-serif;\">\n"
				+ "											응모하신 이벤트에 당첨되어,<br>\n" + "											<span style=\"color: #fa2828\">스포츠 예매권</span>\n"
				+ "											전달드립니다.\n" + "										</td>\n" + "									</tr>\n"
				+ "									<tr>\n" + "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px\">안녕하세요.</td>\n" + "									</tr>\n"
				+ "									<tr>\n" + "										<td style=\"width: 100%; height: 20px\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px; line-height: 20px\">\n"
				+ "											스포츠 예매권은 티켓을 무료로 예매할 수 있는 결제수단입니다.\n" + "										</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px\" height=\"20\">&nbsp;</td>\n" + "									</tr>\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 560px; padding: 0 3.3%; font-size: 14px; line-height: 20px\">\n"
				+ "											아래의 예매권번호를 마이페이지에서 입력하여 미리 등록하거나,\n" + "											<br>\n"
				+ "											예매 시 결제창에서 입력하여 사용할 수 있습니다.\n" + "										</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 30px\" height=\"30\">&nbsp;</td>\n" + "									</tr>\n"
				+ "									<tr>\n" + "										<td style=\"width: 93.3%; Margin: 0; padding: 0 3.3%\">\n"
				+ "											<table style=\"width: 100%; Margin: 0; padding: 0; table-layout: fixed; border-collapse: collapse; border-spacing: 0; border: 0; background-color: #fff; word-break: break-all; font-weight: normal; font-family: '나눔고딕', 'Nanum Gothic', '맑은고딕', 'Malgun Gothic', '돋움', 'Dotum', '굴림', 'gulim', arial, verdana, Helvetica, 'Apple SD Gothic Neo', sans-serif\">\n"
				+ "												<tbody>\n" + "													<tr>\n"
				+ "														<td style=\"width: 25%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\" height=\"54\">이벤트명</td>\n"
				+ "														<td style=\"width: 75%; height: 54px; border-top: 2px solid #707070; border-bottom: 1px solid #ccc; font-weight: bold; font-size: 15px; text-align: left; color: #202020\" height=\"54\">\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + eventTitle + "</p>\n"
				+ "														</td>\n" + "													</tr>\n"
				+ "													<tr>\n"
				+ "														<td style=\"width: 25%; height: 54px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\" height=\"54\">예매권 번호</td>\n"
				+ "														<td style=\"width: 75%; height: 54px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; font-weight: bold; font-size: 15px; text-align: left; color: #202020\" height=\"54\">\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + advanceTicketNumber + "</p>\n"
				+ "														</td>\n" + "													</tr>\n"
				+ "													<tr>\n"
				+ "														<td style=\"width: 25%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; background-color: #f4f4f4; font-size: 15px; text-align: center; color: #707070\" height=\"54\">유효기간</td>\n"
				+ "														<td style=\"width: 75%; height: 54px; border-top: 1px solid #ccc; border-bottom: 2px solid #707070; font-weight: bold; font-size: 15px; text-align: left; color: #202020\" height=\"54\">\n"
				+ "															<p style=\"Margin: 0; Margin-left: 20px; padding: 0\">" + expiresDate + "</p>\n"
				+ "														</td>\n" + "													</tr>\n"
				+ "												</tbody>\n" + "											</table>\n" + "										</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 45px; Margin: 0; padding: 0; background-color: #fff\" height=\"45\">&nbsp;</td>\n"
				+ "									</tr>\n" + "								</tbody>\n"
				+ "								<tfoot style=\"Margin: 0; padding: 0; text-align: center; font-size: 11px; color: #707070\">\n"
				+ "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; Margin: 0; padding: 0 3.3%; overflow: hidden; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070\">\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"이용약관\" rel=\"noreferrer noopener\">이용약관</a>\n"
				+ "											&nbsp;&nbsp;\n" + "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"개인정보처리방침\" rel=\"noreferrer noopener\">개인정보처리방침</a>\n"
				+ "											&nbsp;&nbsp;\n" + "											<span style=\"font-size: 11px; color: #afafaf\">l</span>\n"
				+ "											&nbsp;&nbsp;\n"
				+ "											<a href=\"#\" target=\"_blank\" style=\"text-decoration: none; color: #707070\" title=\"전자금융거래약관\" rel=\"noreferrer noopener\">전자금융거래약관</a>\n"
				+ "										</td>\n" + "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; Margin: 0; padding: 0 3.3%; background-color: #f4f4f4; text-align: center; font-size: 11px; color: #707070; line-height: 18px;\">\n"
				+ "											본 메일은 발신전용입니다. 궁금한 사항은 티켓챔프 고객센터를 이용해 주십시오.\n"
				+ "											<a href=\"http://localhost:9090/javaclassS8/home\" title=\"고객센터 연결하기\" style=\"text-decoration: none; color: #707070\" rel=\"noreferrer noopener\" target=\"_blank\">고객센터 : 1234-1234</a>\n"
				+ "											<br>\n" + "											Copyright ⓒ TicketChamp Corporation. All Rights Reserved.\n"
				+ "										</td>\n" + "									</tr>\n" + "									<tr>\n"
				+ "										<td style=\"width: 100%; height: 20px; background-color: #f4f4f4\" height=\"20\">&nbsp;</td>\n"
				+ "									</tr>\n" + "								</tfoot>\n" + "							</table>\n"
				+ "						</div>\n" + "					</td>\n" + "				</tr>\n" + "				<tr>\n"
				+ "					<td style=\"width: 100%; height: 45px; Margin: 0; padding: 0; border: 0; border-spacing: 0; background-color: #fff\">&nbsp;</td>\n"
				+ "				</tr>\n" + "			</tbody>\n" + "		</table>\n" + "	</div>\n" + "</div>";
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