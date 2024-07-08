package com.spring.javaclassS8.service.member;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.member.MemberDAO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private HttpSession session;

	// 이름과 휴대폰 번호 조합으로 이메일 아이디 찾기
	@Override
	public Map<String, Object> findEmailByNameAndPhone(String name, String phone) {
		List<MemberVO> members = memberDAO.findByNameAndPhone(name, phone);
		Map<String, Object> result = new HashMap<>();

		if (members.isEmpty()) {
			result.put("exists", false);
		} else {
			List<Map<String, Object>> memberDetails = new ArrayList<>();
			for (MemberVO member : members) {
				String originalEmail = member.getEmail();
				String maskedEmail = maskEmail(originalEmail);
				Map<String, Object> memberDetail = new HashMap<>();
				memberDetail.put("originalEmail", originalEmail);
				memberDetail.put("maskedEmail", maskedEmail);
				memberDetail.put("createdAt", formatCreatedAt(member.getCreatedAt()));
				memberDetails.add(memberDetail);
			}
			result.put("exists", true);
			result.put("members", memberDetails);
			session.setAttribute("searchResult", result);
		}

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
}
