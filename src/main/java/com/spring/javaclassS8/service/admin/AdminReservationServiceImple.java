package com.spring.javaclassS8.service.admin;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class AdminReservationServiceImple implements AdminReservationService {

	@Autowired
	private AdminDAO adminDAO;

	// 예매권 발행하기 처리
	@Override
	public List<AdvanceTicketVO> issueAdvanceTickets(int quantity) {
		List<AdvanceTicketVO> newTickets = new ArrayList<>();
		int adminId = getCurrentAdminId();
		if (adminId == -1) {
			throw new RuntimeException("관리자 로그인이 필요합니다.");
		}

		for (int i = 0; i < quantity; i++) {
			AdvanceTicketVO ticket = new AdvanceTicketVO();
			ticket.setAdvanceTicketNumber(generateTicketNumber());
			ticket.setExpiresAt(Timestamp.valueOf(LocalDateTime.now().plusDays(30)));
			ticket.setIssuedAt(Timestamp.valueOf(LocalDateTime.now()));
			ticket.setUsed(false);
			/* ticket.setUsed(0); */
			ticket.setAdminId(adminId);

			adminDAO.insertAdvanceTicket(ticket);
			newTickets.add(ticket);
		}
		return newTickets;
	}

	// 예매권 번호 생성하기
	private String generateTicketNumber() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder(16);
		for (int i = 0; i < 16; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}

	// 현재 로그인한 관리자의 고유번호 가져오기
	private int getCurrentAdminId() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession(false);
		if (session != null) {
			MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
			if (loginMember != null && loginMember.getRole() == MemberVO.Role.ADMIN) {
				return loginMember.getId();
			}
		}
		return -1; // 로그인한 관리자가 없는 경우
	}
}
