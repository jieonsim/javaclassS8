package com.spring.javaclassS8.service.my.reserve;

import java.util.Map;

public interface MyReservationService {

	// 마이페이지 > 예매확인 뷰
	Map<String, Object> getReservationListByMemberId(int memberId, int page);
	
	// 마이페이지 > 예매취소 뷰
	Map<String, Object> getReservationCancelListByMemberId(int memberId, int page);

	// 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	int getAvailableReservationCount(int memberId);

	// 마이페이지 > 예매확인 > 예매상세내역, 프린트, 취소컨펌 뷰를 위해 예매내역 가져오기
	Map<String, Object> getReservationDetail(int reservationId);

	// 취소 시 취소수수료, 환불금액 등 정보 조회
	Map<String, Object> getCancelInfo(int reservationId);

	// 예매 취소 처리
	void cancelReservation(int reservationId) throws Exception;
}
