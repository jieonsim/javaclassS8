package com.spring.javaclassS8.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;

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
	public EventVO getEventById(int id) {
		return eventDAO.getEventById(id);
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

	@Override
	public List<EventCommentVO> getEventComments(int eventId) {
		return  eventDAO.getEventComments(eventId);
	}


}
