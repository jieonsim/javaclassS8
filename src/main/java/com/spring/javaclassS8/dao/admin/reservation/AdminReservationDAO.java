package com.spring.javaclassS8.dao.admin.reservation;

import com.spring.javaclassS8.vo.reservation.AdvanceTicketVO;

public interface AdminReservationDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);
}
