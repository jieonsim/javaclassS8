package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventParticipantVO;
import com.spring.javaclassS8.vo.event.EventParticipationVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerEventVO;
import com.spring.javaclassS8.vo.event.WinnerPostDetailVO;

public interface EventDAO {

	// 전체 이벤트 목록 가져오기
	public List<EventVO> getAllEvents();

	// 진행 중인 이벤트만 가져오기
	public List<EventVO> getOngoingEvents(@Param("offset") int offset, @Param("limit") int limit);

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventById(int eventId);

	// 이벤트 응모 여부 확인
	public String getParticipationStatus(@Param("eventId") int eventId, @Param("memberId") int memberId);

	// 이벤트 컨텐츠 디테일에 댓글 달기
	public void insertEventComment(@Param("eventId") int eventId, @Param("memberId") int memberId, @Param("comment") String comment);

	// 이벤트 응모 처리하기
	public void insertOrUpdateEventParticipant(@Param("eventId") int eventId, @Param("memberId") int memberId);

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	public List<EventCommentVO> getAllEventComments(int eventId);
	
	// 이벤트 컨텐츠 디테일에 작성된 댓글 중 status가 active인것만 가져오기
	public List<EventCommentVO> getActiveEventComments(int eventId);

	// 이벤트 컨텐츠의 댓글 내용 수정
	public boolean updateEventComment(@Param("commentId") int commentId, @Param("comment") String comment);

	// 이벤트 컨텐츠의 댓글 삭제 -> event_comments 테이블의 status 필드 데이터 업데이트
	public boolean updateEventCommentStatus(@Param("commentId") int commentId, @Param("status") EventCommentVO.Status status);
	
	// 이벤트 참여 철회 -> event_participants 테이블의 status 필드 데이터 업데이트
	boolean updateEventParticipationToCancelled(@Param("eventId") int eventId, @Param("memberId") int memberId);
	
	// 이벤트 응모 여부 확인하기
	public EventParticipantVO getEventParticipation(@Param("eventId") int eventId, @Param("memberId") int memberId);
	
	// 이벤트 재 참여 시 CANCELLED 상태에서 ACTIVE로 업데이트
	void updateEventParticipation(@Param("eventId") int eventId, @Param("memberId") int memberId);
	
	// 이벤트 참여 기록이 전혀 없는 경우 새로 삽입
	void insertEventParticipation(@Param("eventId") int eventId, @Param("memberId") int memberId);
	
	// 이벤트 댓글 정보 가져오기
	public EventCommentVO getEventCommentById(@Param("commentId") int commentId);
	
	// 이벤트 당첨자 발표 리스트
	public List<WinnerEventVO> getWinnerEvents(@Param("offset") int offset, @Param("limit") int limit);

	// 이벤트 당첨자 발표 디테일
	public WinnerPostDetailVO getWinnerPostDetail(int winnerPostId);

	// 본인이 응모한 이벤트 리스트 가져오기
	public List<EventParticipationVO> getEventParticipations(@Param("memberId") int memberId, @Param("offset") int offset, @Param("limit") int limit);

	// memberId로 해당 member가 응모한 이벤트 갯수 가져오기
	public int getActiveEventCount(int memberId);
	
	// memberId로 해당 member가 응모한 이벤트 전체 갯수 가져오기
	public int getEventParticipationsCount(int memberId);
	
	// 이벤트 당첨자 발표 게시글 갯수 가져오기
	public int getWinnerEventsCount();

	// 진행 중인 이벤트 카운트 가져오기
	public int getOngoingEventsCount();
	
	// 이벤트 ACTIVE 참여가 없는 경우, CANCELLED 상태의 참여가 있는지 확인
	public EventParticipantVO getCancelledEventParticipation(@Param("eventId") int eventId, @Param("memberId") int memberId);

}
