package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
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
	public EventVO getEventById(int eventId) {
		return sqlSession.getMapper(EventDAO.class).getEventById(eventId);
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

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	@Override
	public List<EventCommentVO> getAllEventComments(int eventId) {
		return sqlSession.getMapper(EventDAO.class).getAllEventComments(eventId);
	}
	
	// 이벤트 컨텐츠 디테일에 작성된 댓글 중 status가 active인것만 가져오기
	@Override
	public List<EventCommentVO> getActiveEventComments(int eventId) {
		return sqlSession.getMapper(EventDAO.class).getActiveEventComments(eventId);
	}

	// 이벤트 컨텐츠의 댓글 내용 수정
	@Override
	public boolean updateEventComment(int commentId, String comment) {
		return sqlSession.getMapper(EventDAO.class).updateEventComment(commentId, comment);
	}

	// 이벤트 컨텐츠의 댓글 삭제 -> event_comments 테이블의 status 필드 데이터 업데이트
	@Override
	public boolean updateEventCommentStatus(int commentId, EventCommentVO.Status status) {
		return sqlSession.getMapper(EventDAO.class).updateEventCommentStatus(commentId, status);
	}

	// 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
	@Override
	public boolean updateEventParticipationStatus(int commentId, EventParticipantVO.Status status) {
		return sqlSession.getMapper(EventDAO.class).updateEventParticipationStatus(commentId, status);
	}
}
