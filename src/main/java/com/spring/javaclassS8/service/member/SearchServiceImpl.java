package com.spring.javaclassS8.service.member;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class SearchServiceImpl implements SearchService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private HttpSession session;

	@Autowired
	private CertificationEmailService certificationEmailService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 이름과 휴대폰 번호 조합으로 이메일 아이디 찾기
	@Override
	public Map<String, Object> findEmailByNameAndPhone(String name, String phone) {
	    List<MemberVO> members = memberDAO.findByNameAndPhone(name, phone);
	    Map<String, Object> result = new HashMap<>();
	    List<Map<String, Object>> memberDetails = new ArrayList<>();

	    for (MemberVO member : members) {
	        if (member.getStatus() == 1) {  // status가 1인 경우만 처리
	            String originalEmail = member.getEmail();
	            String maskedEmail = maskEmail(originalEmail);
	            Map<String, Object> memberDetail = new HashMap<>();
	            memberDetail.put("originalEmail", originalEmail);
	            memberDetail.put("maskedEmail", maskedEmail);
	            memberDetail.put("createdAt", formatCreatedAt(member.getCreatedAt()));
	            memberDetails.add(memberDetail);
	        }
	    }

	    if (memberDetails.isEmpty()) {
	        result.put("exists", false);
	    } else {
	        result.put("exists", true);
	        result.put("members", memberDetails);
	    }

	    session.setAttribute("searchResult", result);
	    return result;
	}

	// 이메일 아이디 마스킹 처리
	private String maskEmail(String email) {
		String[] parts = email.split("@");
		if (parts.length < 2) {
			return email;
		}
		String localPart = parts[0];
		String domainPart = parts[1];
		int maskLength = Math.max(3, localPart.length() - 3);
		String maskedEmail = localPart.substring(0, localPart.length() - maskLength) + "***@" + domainPart;
		return maskedEmail;
	}

	// 가입일자 포맷
	private String formatCreatedAt(Timestamp createdAt) {
		return createdAt.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
	}

	// 이름 + 이메일 조합으로 회원 정보 확인 후 인증번호 발송
	@Override
	public Map<String, Object> sendCertification(String name, String email) throws MessagingException {
		Map<String, Object> response = new HashMap<>();
		MemberVO member = memberDAO.findByNameAndEmail(name, email);

		if (member == null || member.getStatus() != 1) {
			response.put("success", false);
			response.put("message", "입력하신 정보와 일치하는 회원이 없습니다. 다시 확인해 주세요.");
		} else {
			String certificationNumber = certificationEmailService.sendCertificationEmail(email);

			// 인증번호를 세션에 저장(유효시간 10분)
			session.setAttribute("certificationNumber", certificationNumber);
			session.setAttribute("certificationTime", System.currentTimeMillis());
			session.setAttribute("certificationEmail", email);

			response.put("success", true);
			response.put("message", "인증번호가 발송되었습니다.");
		}
		return response;
	}

	// 비밀번호 찾기 - 발송된 인증번호와 입력한 인증번호 일치여부 확인
	@Override
	public Map<String, Object> verifyCertification(String name, String email, String certificationNumber) {
		Map<String, Object> response = new HashMap<>();
		MemberVO member = memberDAO.findByNameAndEmail(name, email);

		if (member == null || member.getStatus() != 1) {
			response.put("success", false);
			response.put("message", "입력하신 정보와 일치하는 회원이 없습니다.");
		} else {
			String storedCertificationNumber = (String) session.getAttribute("certificationNumber");
			Long certificationTime = (Long) session.getAttribute("certificationTime");
			String certificationEmail = (String) session.getAttribute("certificationEmail");

			if (storedCertificationNumber == null || certificationTime == null || certificationEmail == null) {
				response.put("success", false);
				response.put("message", "인증 정보가 없습니다. 인증번호를 다시 받아주세요.");
				return response;
			}

			// 10분(600000 밀리초) 이내인지 확인
			if (System.currentTimeMillis() - certificationTime > 600000) {
				response.put("success", false);
				response.put("message", "인증번호 유효시간이 초과되었습니다. 인증번호를 다시 받아주세요.");
				return response;
			}

			// 이메일과 인증번호가 일치하는지 확인
			if (email.equals(certificationEmail) && certificationNumber.equals(storedCertificationNumber)) {
				response.put("success", true);
				response.put("message", "인증이 완료되었습니다.");

				// 인증 완료 후 세션에서 인증 정보 제거
				session.removeAttribute("certificationNumber");
				session.removeAttribute("certificationTime");
				session.removeAttribute("certificationEmail");

				// 비밀번호 재설정을 위해 이메일을 세션에 저장
				session.setAttribute("resetPasswordEmail", email);
			} else {
				response.put("success", false);
				response.put("message", "인증번호가 일치하지 않아요. 다시 확인해 주세요.");
			}
		}
		return response;
	}

	// 비밀번호 찾기 - 비밀번호 재설정 처리
	@Override
	public Map<String, Object> resetPassword(String email, String newPassword) {
		Map<String, Object> result = new HashMap<>();
		MemberVO member = memberDAO.findByEmail(email);

		if (member == null || member.getStatus() != 1) {
			result.put("success", false);
			result.put("error", "USER_NOT_FOUND");
			return result;
		}

		if (passwordEncoder.matches(newPassword, member.getPassword())) {
			result.put("success", false);
			result.put("error", "SAME_PASSWORD");
			return result;
		}

		String econdedPassword = passwordEncoder.encode(newPassword);
		member.setPassword(econdedPassword);

		boolean updateSucess = memberDAO.resetPassword(member);

		if (updateSucess) {
			result.put("success", true);
		} else {
			result.put("success", false);
			result.put("error", "UPDATE_FAILED");
		}
		return result;
	}
}
