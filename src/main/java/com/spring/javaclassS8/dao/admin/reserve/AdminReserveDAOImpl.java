package com.spring.javaclassS8.dao.admin.reserve;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Repository
public class AdminReserveDAOImpl implements AdminReserveDAO {

	@Autowired
	private SqlSession sqlSession;

	// 예매권 발행하기 처리
	@Override
	public void insertAdvanceTicket(AdvanceTicketVO ticket) {
		sqlSession.getMapper(AdminReserveDAO.class).insertAdvanceTicket(ticket);
	}

	// 예매 리스트
	@Override
	public List<ReservationVO> getAllReservations(int offset, int pageSize) {
		return sqlSession.getMapper(AdminReserveDAO.class).getAllReservations(offset, pageSize);
	}

	// 예매권 발행 정보 가져오기
	@Override
	public List<AdvanceTicketInfoVO> getAdvanceTicketList(int offset, int pageSize) {
		return sqlSession.getMapper(AdminReserveDAO.class).getAdvanceTicketList(offset, pageSize);
	}
	
	// 전체 예매 건 수 가져오기(페이징)
	@Override
	public int getTotalReservationCount() {
		return sqlSession.getMapper(AdminReserveDAO.class).getTotalReservationCount();
	}
	
	// 전체 예매권 발행 가져오기(페이징)
	@Override
	public int getTotalAdvanceTicketsCount() {
		return sqlSession.getMapper(AdminReserveDAO.class).getTotalAdvanceTicketsCount();
	}
}
