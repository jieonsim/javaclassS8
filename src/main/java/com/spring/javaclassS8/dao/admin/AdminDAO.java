package com.spring.javaclassS8.dao.admin;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;

public interface AdminDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

}
