package com.spring.javaclassS8.utils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class ReservationCompletedEmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendReservationCompletedEmail(String email) throws MessagingException {
		String htmlContent = getHtmlTemplate();

		sendHtmlEmail(email, "[티켓챔프] 예매가 완료되었습니다", htmlContent);
	}
	
	private String getHtmlTemplate() {
		return "";
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