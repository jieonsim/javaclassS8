package com.spring.javaclassS8.service.admin.reservation;

import java.util.List;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;

public interface AdminReservationService {

	// 예매권 발행하기 처리
	List<AdvanceTicketVO> issueAdvanceTickets(int quantity);

}
