package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession sqlSession;

	// 이벤트 전체 목록 가져오기
	@Override
	public List<EventVO> getAllEvents() {
		return sqlSession.getMapper(EventDAO.class).getAllEvents();
	}

	// 진행 중인 이벤트만 가져오기
	@Override
	public List<EventVO> getOngoingEvents() {
		return sqlSession.getMapper(EventDAO.class).getOngoingEvents();
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventById(int id) {
		return sqlSession.getMapper(EventDAO.class).getEventById(id);
	}

	// 이벤트 응모 여부 확인
	@Override
	public boolean hasParticipated(int eventId, int memberId) {
		return sqlSession.getMapper(EventDAO.class).hasParticipated(eventId, memberId);
	}

	// 이벤트 컨텐츠 디테일에 댓글 달기
	@Override
	public void insertEventComment(int eventId, int memberId, String comment) {
		sqlSession.getMapper(EventDAO.class).insertEventComment(eventId, memberId, comment);

	}

	// 이벤트 응모 처리하기
	@Override
	public void insertEventParticipant(int eventId, int memberId) {
		sqlSession.getMapper(EventDAO.class).insertEventParticipant(eventId, memberId);
	}

	@Override
	public List<EventCommentVO> getEventComments(int eventId) {
		return sqlSession.getMapper(EventDAO.class).getEventComments(eventId);
	}

}
