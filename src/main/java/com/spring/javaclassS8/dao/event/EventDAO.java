package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
import com.spring.javaclassS8.vo.event.EventVO;

public interface EventDAO {

	// 전체 이벤트 목록 가져오기
	public List<EventVO> getAllEvents();

	// 진행 중인 이벤트만 가져오기
	public List<EventVO> getOngoingEvents();

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventById(int eventId);

	// 이벤트 응모 여부 확인
	public boolean hasParticipated(@Param("eventId") int eventId, @Param("memberId") int memberId);

	// 이벤트 컨텐츠 디테일에 댓글 달기
	public void insertEventComment(@Param("eventId") int eventId, @Param("memberId") int memberId,
			@Param("comment") String comment);

	// 이벤트 응모 처리하기
	public void insertEventParticipant(@Param("eventId") int eventId, @Param("memberId") int memberId);

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	public List<EventCommentVO> getAllEventComments(int eventId);
	
	// 이벤트 컨텐츠 디테일에 작성된 댓글 중 status가 active인것만 가져오기
	public List<EventCommentVO> getActiveEventComments(int eventId);

	// 이벤트 컨텐츠의 댓글 내용 수정
	public boolean updateEventComment(@Param("commentId") int commentId, @Param("comment") String comment);

	// 이벤트 컨텐츠의 댓글 삭제 -> event_comments 테이블의 status 필드 데이터 업데이트
	public boolean updateEventCommentStatus(@Param("commentId") int commentId, @Param("status") EventCommentVO.Status status);

	// 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
	public boolean updateEventParticipationStatus(@Param("commentId") int commentId, @Param("status") EventParticipantVO.Status status);

}
