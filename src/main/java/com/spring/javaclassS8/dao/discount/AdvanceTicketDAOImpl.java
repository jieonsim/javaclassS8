package com.spring.javaclassS8.dao.discount;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdvanceTicketDAOImpl implements AdvanceTicketDAO {

	@Autowired
	private SqlSession sqlSession;

	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	@Override
	public boolean isValidTicket(String advanceTicketNumber) {
		return sqlSession.getMapper(AdvanceTicketDAO.class).isValidTicket(advanceTicketNumber);
	}

	// 마이페이지 > 할인혜택 > 예매권 등록 시 이미 등록된 예매권번호인지 확인
	@Override
	public boolean isTicketRegistered(String advanceTicketNumber) {
		return sqlSession.getMapper(AdvanceTicketDAO.class).isTicketRegistered(advanceTicketNumber);
	}

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	@Override
	public boolean registerTicket(String advanceTicketNumber, int memberId) {
		return sqlSession.getMapper(AdvanceTicketDAO.class).registerTicket(advanceTicketNumber, memberId);
	}

	// memberId로 해당 유저에 등록된 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getAdvanceTicketsByMemberId(int memberId) {
		return sqlSession.getMapper(AdvanceTicketDAO.class).getAdvanceTicketsByMemberId(memberId);
	}
}
