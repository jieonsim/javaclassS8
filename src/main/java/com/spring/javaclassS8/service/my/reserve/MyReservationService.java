package com.spring.javaclassS8.service.my.reserve;

import java.util.Map;

public interface MyReservationService {

	// 마이페이지 > 예매확인 뷰
	Map<String, Object> getReservationListByMemberId(int memberId, int page);
	
	// 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	int getAvailableReservationCount(int memberId);
	
	// 마이페이지 > 예매확인 > 예매상세내역 뷰
	Map<String, Object> getReservationDetail(int reservationId);
}
