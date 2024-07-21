package com.spring.javaclassS8.dao.admin.reserve;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;

@Repository
public class AdminReserveDAOImpl implements AdminReserveDAO {

	@Autowired
	private SqlSession sqlSession;

	// 예매권 발행하기 처리
	@Override
	public void insertAdvanceTicket(AdvanceTicketVO ticket) {
		sqlSession.getMapper(AdminReserveDAO.class).insertAdvanceTicket(ticket);
	}
}
