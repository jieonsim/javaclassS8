package com.spring.javaclassS8.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.event.EventVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	// 예매권 발행하기 처리
	@Override
	public void insertAdvanceTicket(AdvanceTicketVO ticket) {
		sqlSession.getMapper(AdminDAO.class).insertAdvanceTicket(ticket);
	}

	@Override
	public int insertEvent(EventVO event) {
		return sqlSession.getMapper(AdminDAO.class).insertEvent(event);
	}
}
