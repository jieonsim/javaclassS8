package com.spring.javaclassS8.dao.admin.reserve;

import java.util.List;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

public interface AdminReserveDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

	// 예매리스트
	List<ReservationVO> getAllReservations();

	// 예매권 발행 정보 가져오기
	List<AdvanceTicketInfoVO> getAdvanceTicketList();

}
