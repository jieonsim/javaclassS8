package com.spring.javaclassS8.service.event;

import java.util.List;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;

public interface EventService {

	// 전체 이벤트 데이터 가져오기
	public List<EventVO> getAllEvents();

	// 진행 중인 이벤트만 가져오기
	public List<EventVO> getOngoingEvents();

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventById(int id);

	// 이벤트 응모 여부 확인
	public boolean hasParticipated(int eventId, int memberId);

	// 이벤트 댓글달기 및 응모 처리
	public boolean insertEventCommentAndParticipate(int eventId, int memberId, String comment);

	public List<EventCommentVO> getEventComments(int eventId);

}
