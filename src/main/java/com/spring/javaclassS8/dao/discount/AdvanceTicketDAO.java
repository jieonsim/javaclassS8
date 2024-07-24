package com.spring.javaclassS8.dao.discount;

import org.apache.ibatis.annotations.Param;

public interface AdvanceTicketDAO {

	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	boolean isValidTicket(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 시 이미 등록된 예매권번호인지 확인
	boolean isTicketRegistered(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	boolean registerTicket(@Param("advanceTicketNumber") String advanceTicketNumber, @Param("memberId") int memberId);

}
