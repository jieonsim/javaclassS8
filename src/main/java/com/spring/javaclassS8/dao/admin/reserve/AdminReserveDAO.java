package com.spring.javaclassS8.dao.admin.reserve;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;

public interface AdminReserveDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);
}
