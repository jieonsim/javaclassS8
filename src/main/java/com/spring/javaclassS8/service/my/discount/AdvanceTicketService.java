package com.spring.javaclassS8.service.my.discount;

import java.util.Map;

public interface AdvanceTicketService {
	
	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	Map<String, Object> validateAdvanceTicket(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	Map<String, Object>  registerAdvanceTicket(String advanceTicketNumber);

}
