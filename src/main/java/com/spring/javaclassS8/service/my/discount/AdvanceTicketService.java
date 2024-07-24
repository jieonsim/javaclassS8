package com.spring.javaclassS8.service.my.discount;

import java.util.List;
import java.util.Map;

public interface AdvanceTicketService {
	
	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	Map<String, Object> validateAdvanceTicket(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	Map<String, Object>  registerAdvanceTicket(String advanceTicketNumber);

	// memberId로 해당 유저에 등록된 예매권 정보 가져오기
	List<Map<String, Object>> getAdvanceTicketsByMemberId(int memberId);

	// 마이페이지 > 할인혜택 > 예매권 > 사용가능/사용완료/유효기간만료 필터링
	List<Map<String, Object>> getFilteredAdvanceTickets(int memberId, String stateType);

}
