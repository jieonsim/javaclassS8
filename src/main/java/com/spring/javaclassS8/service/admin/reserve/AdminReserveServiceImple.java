package com.spring.javaclassS8.service.admin.reserve;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaclassS8.dao.admin.reserve.AdminReserveDAO;
import com.spring.javaclassS8.vo.member.MemberVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class AdminReserveServiceImple implements AdminReserveService {

	@Autowired
	private AdminReserveDAO adminReserveDAO;

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

			// 현재 날짜로부터 30일 이후의 자정(23:59:59)으로 만료 시간 설정
			LocalDateTime expirationDate = LocalDate.now().plusDays(30).atTime(23, 59, 59);
			ticket.setExpiresAt(Timestamp.valueOf(expirationDate));

			ticket.setIssuedAt(Timestamp.valueOf(LocalDateTime.now()));
			ticket.setUsed(false);
			ticket.setAdminId(adminId);

			adminReserveDAO.insertAdvanceTicket(ticket);
			// 여기서 ticket 객체의 id가 자동으로 설정
			if (ticket.getId() == 0) {
				throw new RuntimeException("예매권 ID 생성 실패");
			}
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

	// 예매 리스트
	@Override
	public List<ReservationVO> getAllReservations(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return adminReserveDAO.getAllReservations(offset, pageSize);
	}

	// 예매권 발행 리스트
	@Override
	public List<AdvanceTicketInfoVO> getAdvanceTicketList(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return adminReserveDAO.getAdvanceTicketList(offset, pageSize);
	}

	// 전체 예매 건 수 가져오기 (페이징)
	@Override
	public int getTotalReservationCount() {
		return adminReserveDAO.getTotalReservationCount();
	}

	// 전체 예매권 발행 수 가져오기 (페이징)
	@Override
	public int getTotalAdvanceTicketsCount() {
		return adminReserveDAO.getTotalAdvanceTicketsCount();
	}
}
