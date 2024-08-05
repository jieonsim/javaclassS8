package com.spring.javaclassS8.service.admin.reserve;

import java.util.List;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

public interface AdminReserveService {

	// 예매권 발행하기 처리
	List<AdvanceTicketVO> issueAdvanceTickets(int quantity);

	// 예매 리스트
	List<ReservationVO> getAllReservations(int page, int pageSize);

	// 예매권 발행 리스트
	List<AdvanceTicketInfoVO> getAdvanceTicketList(int page, int pageSize);
	
	// 전체 예매 건 수 가져오기 (페이징)
	int getTotalReservationCount();
	
	// 전체 예매권 발행 수 가져오기 (페이징)
	int getTotalAdvanceTicketsCount();

}
