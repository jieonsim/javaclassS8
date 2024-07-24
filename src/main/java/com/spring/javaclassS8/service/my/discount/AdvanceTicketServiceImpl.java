package com.spring.javaclassS8.service.my.discount;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.discount.AdvanceTicketDAO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class AdvanceTicketServiceImpl implements AdvanceTicketService {

	@Autowired
	private AdvanceTicketDAO advanceTicketDAO;

	@Autowired
	private HttpSession session;

	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	@Override
	public Map<String, Object> validateAdvanceTicket(String advanceTicketNumber) {
		Map<String, Object> result = new HashMap<>();

		if (advanceTicketDAO.isValidTicket(advanceTicketNumber)) {
			result.put("valid", true);
		} else {
			result.put("valid", false);
			result.put("message", "유효하지 않은 예매권 번호입니다.");
		}
		return result;
	}

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	@Override
	public Map<String, Object> registerAdvanceTicket(String advanceTicketNumber) {
		Map<String, Object> result = new HashMap<>();

		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			result.put("success", false);
			result.put("message", "로그인이 필요합니다.");
			return result;
		}

		if (advanceTicketDAO.isTicketRegistered(advanceTicketNumber)) {
			result.put("success", false);
			result.put("message", "이미 등록된 예매권 번호입니다.");
			return result;
		}

		if (advanceTicketDAO.registerTicket(advanceTicketNumber, member.getId())) {
			result.put("success", true);
			result.put("message", "예매권이 성공적으로 등록되었습니다.");
		} else {
			result.put("success", false);
			result.put("message", "예매권 등록에 실패했습니다.");
		}

		return result;
	}
}
