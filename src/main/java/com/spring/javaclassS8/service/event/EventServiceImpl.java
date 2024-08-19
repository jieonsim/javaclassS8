package com.spring.javaclassS8.service.event;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.utils.PaginationInfo;
import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
import com.spring.javaclassS8.vo.event.EventParticipationVO;
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
	public Map<String, Object> getOngoingEvents(int page, int pageSize) {
		int totalCount = eventDAO.getOngoingEventsCount();
		PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);

		int offset = (page - 1) * pageSize;
		List<EventVO> events = eventDAO.getOngoingEvents(offset, pageSize);

		Map<String, Object> result = new HashMap<>();
		result.put("events", events);
		result.put("paginationInfo", paginationInfo);

		return result;
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return eventDAO.getEventById(eventId);
	}

	// 이벤트 응모 여부 확인
	@Override
	public boolean hasParticipated(int eventId, int memberId) {
		return eventDAO.getEventParticipation(eventId, memberId) != null;
	}

	// 이벤트 댓글 달기 및 응모 처리
	@Override
	@Transactional
	public boolean insertEventCommentAndParticipate(int eventId, int memberId, String comment) {
	    EventParticipantVO activeParticipation = eventDAO.getEventParticipation(eventId, memberId);
	    
	    if (activeParticipation != null) {
	        return false; // 이미 활성 상태로 참여 중
	    } else {
	        // ACTIVE 참여가 없는 경우, CANCELLED 상태의 참여가 있는지 확인
	        EventParticipantVO cancelledParticipation = eventDAO.getCancelledEventParticipation(eventId, memberId);
	        if (cancelledParticipation != null) {
	            // CANCELLED 상태인 경우 ACTIVE로 업데이트
	            eventDAO.updateEventParticipation(eventId, memberId);
	        } else {
	            // 참여 기록이 전혀 없는 경우 새로 삽입
	            eventDAO.insertEventParticipation(eventId, memberId);
	        }
	    }
	    
	    // 이벤트 컨텐츠 디테일에 댓글 달기
	    eventDAO.insertEventComment(eventId, memberId, comment);
	    
	    return true;
	}

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	@Override
	public List<EventCommentVO> getAllEventComments(int eventId) {
		return eventDAO.getAllEventComments(eventId);
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
	    // 댓글 정보 가져오기
	    EventCommentVO comment = eventDAO.getEventCommentById(commentId);
	    if (comment == null) {
	        return false;
	    }

	    // 이벤트 컨텐츠의 댓글 삭제 -> event_comments 테이블의 status 필드 데이터 업데이트
	    boolean commentUpdated = eventDAO.updateEventCommentStatus(commentId, EventCommentVO.Status.DELETED);

	    // 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
	    boolean participationUpdated = eventDAO.updateEventParticipationToCancelled(comment.getEventId(), comment.getMemberId());

	    return commentUpdated && participationUpdated;
	}

	// 이벤트 당첨자 발표 리스트
	@Override
	public Map<String, Object> getWinnerEvents(int page, int pageSize) {
		int totalCount = eventDAO.getWinnerEventsCount();
		PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);

		int offset = (page - 1) * pageSize;
		List<WinnerEventVO> events = eventDAO.getWinnerEvents(offset, pageSize);

		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

		for (WinnerEventVO event : events) {
			LocalDate startDate = LocalDate.parse(event.getStartDate(), inputFormatter);
			LocalDate endDate = LocalDate.parse(event.getEndDate(), inputFormatter);
			event.setStartDate(startDate.format(outputFormatter));
			event.setEndDate(endDate.format(outputFormatter));
		}

		Map<String, Object> result = new HashMap<>();
		result.put("winnerEvents", events);
		result.put("paginationInfo", paginationInfo);

		return result;
	}

	// 이벤트 당첨자 발표 디테일
	@Override
	public WinnerPostDetailVO getWinnerPostDetail(int winnerPostId) {
		return eventDAO.getWinnerPostDetail(winnerPostId);
	}

	// 마이페이지 이벤트 참여 리스트
	@Override
	public Map<String, Object> getEventParticipations(int memberId, int page, int pageSize) {
		int totalCount = eventDAO.getEventParticipationsCount(memberId);
		PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);

		int offset = (page - 1) * pageSize;
		List<EventParticipationVO> participations = eventDAO.getEventParticipations(memberId, offset, pageSize);

		Map<String, Object> result = new HashMap<>();
		result.put("participations", participations);
		result.put("paginationInfo", paginationInfo);

		return result;
	}

	// memberId로 해당 member가 응모한 이벤트 갯수 가져오기
	@Override
	public int getActiveEventCount(int memberId) {
		return eventDAO.getActiveEventCount(memberId);
	}
}
