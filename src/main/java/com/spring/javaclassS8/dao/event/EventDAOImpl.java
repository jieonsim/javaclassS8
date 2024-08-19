package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
import com.spring.javaclassS8.vo.event.EventParticipationVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerEventVO;
import com.spring.javaclassS8.vo.event.WinnerPostDetailVO;

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
	public List<EventVO> getOngoingEvents(int offset, int limit) {
		return sqlSession.getMapper(EventDAO.class).getOngoingEvents(offset, limit);
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return sqlSession.getMapper(EventDAO.class).getEventById(eventId);
	}

	// 이벤트 응모 여부 확인
	@Override
	public String getParticipationStatus(int eventId, int memberId) {
	    return sqlSession.getMapper(EventDAO.class).getParticipationStatus(eventId, memberId);
	}

	// 이벤트 컨텐츠 디테일에 댓글 달기
	@Override
	public void insertEventComment(int eventId, int memberId, String comment) {
		sqlSession.getMapper(EventDAO.class).insertEventComment(eventId, memberId, comment);
	}

	// 이벤트 응모 처리하기
	@Override
	public void insertOrUpdateEventParticipant(int eventId, int memberId) {
	    sqlSession.getMapper(EventDAO.class).insertOrUpdateEventParticipant(eventId, memberId);
	}
	
	// 이벤트 댓글 정보 가져오기
	@Override
	public EventCommentVO getEventCommentById(int commentId) {
	    return sqlSession.getMapper(EventDAO.class).getEventCommentById(commentId);
	}
	
	// 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
	@Override
	public boolean updateEventParticipationToCancelled(int eventId, int memberId) {
	    return sqlSession.getMapper(EventDAO.class).updateEventParticipationToCancelled(eventId, memberId);
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

	// 이벤트 당첨자 발표 리스트
	@Override
	public List<WinnerEventVO> getWinnerEvents(int offset, int limit) {
		return sqlSession.getMapper(EventDAO.class).getWinnerEvents(offset, limit);
	}

	// 이벤트 당첨자 발표 디테일
	@Override
	public WinnerPostDetailVO getWinnerPostDetail(int winnerPostId) {
		return sqlSession.getMapper(EventDAO.class).getWinnerPostDetail(winnerPostId);
	}

	// 본인이 응모한 이벤트 리스트 가져오기
	@Override
	public List<EventParticipationVO> getEventParticipations(int memberId, int offset, int limit) {
		return sqlSession.getMapper(EventDAO.class).getEventParticipations(memberId, offset, limit);
	}

	// memberId로 해당 member가 응모한 이벤트 중 현재 진행중인 이벤트 갯수 가져오기
	@Override
	public int getActiveEventCount(int memberId) {
		return sqlSession.getMapper(EventDAO.class).getActiveEventCount(memberId);
	}

	// memberId로 해당 member가 응모한 이벤트 전체 갯수 가져오기 
	@Override
	public int getEventParticipationsCount(int memberId) {
		return sqlSession.getMapper(EventDAO.class).getEventParticipationsCount(memberId);
	}
	
	// 이벤트 당첨자 발표 게시글 갯수 가져오기
	@Override
	public int getWinnerEventsCount() {
	    return sqlSession.getMapper(EventDAO.class).getWinnerEventsCount();
	}
		
	// 진행 중인 이벤트 카운트 가져오기
	@Override
	public int getOngoingEventsCount() {
	    return sqlSession.getMapper(EventDAO.class).getOngoingEventsCount();
	}

	// 이벤트 응모 여부 확인하기
	@Override
	public EventParticipantVO getEventParticipation(int eventId, int memberId) {
	    return sqlSession.getMapper(EventDAO.class).getEventParticipation(eventId, memberId);
	}

	// 이벤트 재 참여 시 CANCELLED 상태에서 ACTIVE로 업데이트
	@Override
	public void updateEventParticipation(int eventId, int memberId) {
	    sqlSession.getMapper(EventDAO.class).updateEventParticipation(eventId, memberId);
	}

	// 이벤트 참여 기록이 전혀 없는 경우 새로 삽입
	@Override
	public void insertEventParticipation(int eventId, int memberId) {
	    sqlSession.getMapper(EventDAO.class).insertEventParticipation(eventId, memberId);
	}

	// 이벤트 ACTIVE 참여가 없는 경우, CANCELLED 상태의 참여가 있는지 확인
	@Override
	public EventParticipantVO getCancelledEventParticipation(int eventId, int memberId) {
		return sqlSession.getMapper(EventDAO.class).getCancelledEventParticipation(eventId, memberId);
	}
}
