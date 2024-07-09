package com.spring.javaclassS8.service.member;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.member.MemberDAO;
import com.spring.javaclassS8.utils.CertificationEmailService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class SignupServiceImpl implements SignupService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private CertificationEmailService certificationEmailService;

	@Autowired
	private HttpSession session;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 이메일 아이디 유무 및 탈퇴여부 확인
	@Override
	public Map<String, Object> checkEmail(String email) {
		Map<String, Object> result = new HashMap<>();
		MemberVO member = memberDAO.findByEmail(email);
		if (member != null) {
			result.put("exists", true);
			result.put("isWithdrawn", member.getStatus() == 3);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedDate = member.getCreatedAt() != null ? member.getCreatedAt().toLocalDateTime().format(formatter) : "Unknown";
			result.put("registrationDate", formattedDate);
		} else {
			result.put("exists", false);
		}
		return result;
	}

	// 인증번호 메일 발송
	@Override
	public String sendCertification(String email) throws MessagingException {
		String certificationNumber = certificationEmailService.sendCertificationEmail(email);

		// 인증번호 세션에 저장 (유효시간 10분)
		session.setAttribute("certificationNumber", certificationNumber);
		session.setAttribute("certificationTime", System.currentTimeMillis());
		session.setAttribute("certificationEmail", email);

		return certificationNumber;
	}

	// 인증번호 일치여부 확인
	@Override
	public boolean verifyCertification(String email, String inputCertificationNumber) {
		String storedCertificationNumber = (String) session.getAttribute("certificationNumber");
		Long certificationTime = (Long) session.getAttribute("certificationTime");
		String certificationEmail = (String) session.getAttribute("certificationEmail");

		if (storedCertificationNumber == null || certificationTime == null || certificationEmail == null) {
			return false;
		}

		// 10분(6000000 밀리초) 이내인지 확인
		if (System.currentTimeMillis() - certificationTime > 6000000) {
			return false;
		}

		// 이메일과 인증번호가 일치하는지 확인
		return email.equals(certificationEmail) && inputCertificationNumber.equals(storedCertificationNumber);
	}

	// 회원가입 처리
	@Override
	public boolean registerMember(MemberVO member) {
		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);

		// 데이터베이스 회원 정보 저장
		try {
			memberDAO.insertMember(member);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
