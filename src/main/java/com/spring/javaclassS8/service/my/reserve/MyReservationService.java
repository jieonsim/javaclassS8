package com.spring.javaclassS8.service.my.reserve;

import java.util.List;

import com.spring.javaclassS8.vo.reserve.ReservationVO;

public interface MyReservationService {

	// memberId로 해당 유저의 예매완료 건 가져오기
	List<ReservationVO> getReservationListByMemberId(int memberId);

}
