package com.spring.javaclassS8.service.my.discount;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
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
			
			// 새로 등록된 티켓 정보를 포함 - 예매화면에서 예매권번호 신규 등록 후 바로 사용할 수 있도록 하기위함
			Map<String, Object> ticketInfo = getAdvanceTicketInfo(advanceTicketNumber);
			result.put("ticket", ticketInfo);
		} else {
			result.put("success", false);
			result.put("message", "예매권 등록에 실패했습니다.");
		}

		return result;
	}

	// memberId로 해당 유저에 등록된 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getAdvanceTicketsByMemberId(int memberId) {
		List<Map<String, Object>> tickets = advanceTicketDAO.getAdvanceTicketsByMemberId(memberId);

		for (Map<String, Object> ticket : tickets) {
			// 유효기간 형식 변경
			Timestamp expiresAt = (Timestamp) ticket.get("expiresAt");
			String formattedDate = new SimpleDateFormat("yyyy.MM.dd").format(expiresAt) + "까지";
			ticket.put("formattedExpiresAt", formattedDate);

			// 예매권 상태 설정
			boolean used = (boolean) ticket.get("used");
			if (used) {
				ticket.put("status", "사용완료");
				ticket.put("statusClass", "color_black");
			} else if (expiresAt.before(new Timestamp(System.currentTimeMillis()))) {
				ticket.put("status", "사용불가");
				ticket.put("statusClass", "color_black");
			} else {
				ticket.put("status", "사용가능");
				ticket.put("statusClass", "color_point");
			}
		}
		return tickets;
	}

	// 마이페이지 > 할인혜택 > 예매권 > 사용가능/사용완료/유효기간만료 필터링
	@Override
	public List<Map<String, Object>> getFilteredAdvanceTickets(int memberId, String stateType) {
		List<Map<String, Object>> tickets = advanceTicketDAO.getAdvanceTicketsByMemberIdAndState(memberId, stateType);

		for (Map<String, Object> ticket : tickets) {
			// 유효기간 형식 변경
			Timestamp expiresAt = (Timestamp) ticket.get("expiresAt");
			String formattedDate = new SimpleDateFormat("yyyy.MM.dd").format(expiresAt) + "까지";
			ticket.put("formattedExpiresAt", formattedDate);

			// 예매권 상태 설정
			boolean used = (boolean) ticket.get("used");
			if (used) {
				ticket.put("status", "사용완료");
				ticket.put("statusClass", "color_black");
			} else if (expiresAt.before(new Timestamp(System.currentTimeMillis()))) {
				ticket.put("status", "사용불가");
				ticket.put("statusClass", "color_black");
			} else {
				ticket.put("status", "사용가능");
				ticket.put("statusClass", "color_point");
			}
		}
		return tickets;
	}

	// 마이페이지 > quickMenuWrap > 현재 이용 가능한 예매권 갯수 보여주기
	@Override
	public int getAvailableAdvanceTicketCount(int memberId) {
		return advanceTicketDAO.getAvailableAdvanceTicketCount(memberId);
	}

	// 예매권번호로 예매권 정보 가져오기
	@Override
	public Map<String, Object> getAdvanceTicketInfo(String advanceTicketNumber) {
		Map<String, Object> ticket = advanceTicketDAO.findByAdvanceTicketNumber(advanceTicketNumber);
		if (ticket != null) {
			return ticket;
		}
		return null;
	}
}
