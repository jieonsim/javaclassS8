package com.spring.javaclassS8.dao.admin;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

	// 이벤트 업로드
	void insertEvent(EventVO event);

}
