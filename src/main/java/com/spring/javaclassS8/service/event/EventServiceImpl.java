package com.spring.javaclassS8.service.event;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerEventVO;
import com.spring.javaclassS8.vo.event.WinnerPostDetailVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	// 전체 이벤트 목록 가져오기
	@Override
	public List<EventVO> getAllEvents() {
		return eventDAO.getAllEvents();
	}

	// 진행 중인 이벤트만 가져오기
	@Override
	public List<EventVO> getOngoingEvents() {
		return eventDAO.getOngoingEvents();
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return eventDAO.getEventById(eventId);
	}

	// 이벤트 응모 여부 확인
	@Override
	public boolean hasParticipated(int eventId, int memberId) {
		return eventDAO.hasParticipated(eventId, memberId);
	}

	// 이벤트 댓글 달기 및 응모 처리
	@Override
	@Transactional
	public boolean insertEventCommentAndParticipate(int eventId, int memberId, String comment) {
		if(hasParticipated(eventId, memberId)) {
			return false;
		}
		
		// 이벤트 컨텐츠 디테일에 댓글 달기
		eventDAO.insertEventComment(eventId, memberId, comment);
		// 이벤트 응모 처리
		eventDAO.insertEventParticipant(eventId, memberId);
		return true;
	}

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	@Override
	public List<EventCommentVO> getAllEventComments(int eventId) {
		return  eventDAO.getAllEventComments(eventId);
	}

	// 이벤트 컨텐츠 디테일에 작성된 댓글 중 status가 active인것만 가져오기
	@Override
	public List<EventCommentVO> getActiveEventComments(int eventId) {
		return eventDAO.getActiveEventComments(eventId);
	}

	// 이벤트 컨텐츠의 댓글 내용 수정
	@Override
	@Transactional
	public boolean updateEventComment(int commentId, String comment) {
		return eventDAO.updateEventComment(commentId, comment);
	}

	// 이벤트 컨텐츠의 댓글 삭제 및 이벤트 참여 철회
	@Override
	@Transactional
	public boolean deleteEventComment(int commentId) {
		// 이벤트 컨텐츠의 댓글 삭제 -> event_comments 테이블의 status 필드 데이터 업데이트
		boolean commentUpdated = eventDAO.updateEventCommentStatus(commentId, EventCommentVO.Status.DELETED);
		// 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
		boolean participationUpdated = eventDAO.updateEventParticipationStatus(commentId, EventParticipantVO.Status.CANCELLED);
		return commentUpdated &&  participationUpdated;
	}

	// 이벤트 당첨자 발표 리스트
	@Override
	public List<WinnerEventVO> getWinnerEvents() {
		 List<WinnerEventVO> events = eventDAO.getWinnerEvents();
	        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	        
	        for (WinnerEventVO event : events) {
	            LocalDate startDate = LocalDate.parse(event.getStartDate(), inputFormatter);
	            LocalDate endDate = LocalDate.parse(event.getEndDate(), inputFormatter);
	            event.setStartDate(startDate.format(outputFormatter));
	            event.setEndDate(endDate.format(outputFormatter));
	        }
	        return events;
	}

	// 이벤트 당첨자 발표 디테일
	@Override
	public WinnerPostDetailVO getWinnerPostDetail(int winnerPostId) {
		return eventDAO.getWinnerPostDetail(winnerPostId);
	}
}
