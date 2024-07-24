package com.spring.javaclassS8.dao.discount;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AdvanceTicketDAO {

	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	boolean isValidTicket(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 시 이미 등록된 예매권번호인지 확인
	boolean isTicketRegistered(String advanceTicketNumber);

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	boolean registerTicket(@Param("advanceTicketNumber") String advanceTicketNumber, @Param("memberId") int memberId);

	// memberId로 해당 유저에 등록된 예매권 정보 가져오기
	List<Map<String, Object>> getAdvanceTicketsByMemberId(int memberId);

	// 마이페이지 > 할인혜택 > 예매권 > 사용가능/사용완료/유효기간만료 필터링
	List<Map<String, Object>> getAdvanceTicketsByMemberIdAndState(@Param("memberId") int memberId, @Param("stateType") String stateType);

	// 마이페이지 > quickMenuWrap > 현재 이용 가능한 예매권 갯수 보여주기
	int getAvailableAdvanceTicketCount(int memberId);

}
