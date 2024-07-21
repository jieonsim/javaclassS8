package com.spring.javaclassS8.service.admin.reserve;

import java.util.List;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;

public interface AdminReserveService {

	// 예매권 발행하기 처리
	List<AdvanceTicketVO> issueAdvanceTickets(int quantity);

}
