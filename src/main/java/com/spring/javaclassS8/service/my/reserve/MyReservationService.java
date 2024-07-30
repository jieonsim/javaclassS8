package com.spring.javaclassS8.service.my.reserve;

import java.util.Map;

public interface MyReservationService {

	// memberId로 해당 유저의 예매완료 리스트 가져오기
	Map<String, Object> getReservationListByMemberId(int memberId, int page);
	
	// 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	int getAvailableReservationCount(int memberId);
}
