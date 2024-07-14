package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;

public interface EventDAO {
	
	// 전체 이벤트 목록 가져오기
	public List<EventVO> getAllEvents();

	// 진행 중인 이벤트만 가져오기
	public List<EventVO> getOngoingEvents();

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventById(int id);

	// 이벤트 응모 여부 확인
	public boolean hasParticipated(@Param("eventId") int eventId, @Param("memberId") int memberId);

	// 이벤트 컨텐츠 디테일에 댓글 달기
	public void insertEventComment(@Param("eventId") int eventId, @Param("memberId") int memberId, @Param("comment") String comment);

	// 이벤트 응모 처리하기
	public void insertEventParticipant(@Param("eventId") int eventId, @Param("memberId") int memberId);

	public List<EventCommentVO> getEventComments(int eventId);


}
