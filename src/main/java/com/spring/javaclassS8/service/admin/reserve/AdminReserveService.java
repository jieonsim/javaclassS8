package com.spring.javaclassS8.service.admin.reserve;

import java.util.List;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

public interface AdminReserveService {

	// 예매권 발행하기 처리
	List<AdvanceTicketVO> issueAdvanceTickets(int quantity);

	// 예매 리스트
	List<ReservationVO> getAllReservations();

	// 예매권 발행 리스트
	List<AdvanceTicketInfoVO> getAdvanceTicketList();

}
