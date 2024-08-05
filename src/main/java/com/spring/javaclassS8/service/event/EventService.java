package com.spring.javaclassS8.service.event;

import java.util.List;
import java.util.Map;

import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerPostDetailVO;

public interface EventService {

	// 전체 이벤트 데이터 가져오기
	public List<EventVO> getAllEvents();

	// 진행 중인 이벤트만 가져오기
	//public List<EventVO> getOngoingEvents();
	public Map<String, Object> getOngoingEvents(int page, int pageSize);

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventById(int eventId);

	// 이벤트 응모 여부 확인
	public boolean hasParticipated(int eventId, int memberId);

	// 이벤트 댓글달기 및 응모 처리
	public boolean insertEventCommentAndParticipate(int eventId, int memberId, String comment);

	// 이벤트 컨텐츠 디테일에 작성된 모든 댓글 가져오기
	public List<EventCommentVO> getAllEventComments(int eventId);
	
	// 이벤트 컨텐츠 디테일에 작성된 댓글 중 status가 active인것만 가져오기
	public List<EventCommentVO> getActiveEventComments(int eventId);

	// 이벤트 컨텐츠의 댓글 내용 수정
	public boolean updateEventComment(int commentId, String comment);

	// 이벤트 컨텐츠의 댓글 삭제 및 이벤트 참여 철회
	public boolean deleteEventComment(int commentId);

	// 이벤트 당첨자 발표 리스트
	//public List<WinnerEventVO> getWinnerEvents();
	public Map<String, Object> getWinnerEvents(int page, int pageSize);

	// 이벤트 당첨자 발표 디테일
	public WinnerPostDetailVO getWinnerPostDetail(int winnerPostId);

	// 본인이 응모한 이벤트 리스트 가져오기
	Map<String, Object> getEventParticipations(int memberId, int page, int pageSize);

	// memberId로 해당 member가 응모한 이벤트 갯수 가져오기
	public int getActiveEventCount(int memberId);
	
}
