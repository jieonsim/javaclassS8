package com.spring.javaclassS8.dao.admin.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

public interface AdminReserveDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

	// 예매리스트
	List<ReservationVO> getAllReservations(@Param("offset") int offset, @Param("pageSize") int pageSize);

	// 예매권 발행 정보 가져오기
	List<AdvanceTicketInfoVO> getAdvanceTicketList(@Param("offset") int offset, @Param("pageSize") int pageSize);
	
	// 전체 예매 건 수 가져오기(페이징)
	int getTotalReservationCount();
	
	// 전체 예매권 발행 수 가져오기(페이징)
	int getTotalAdvanceTicketsCount();

}
