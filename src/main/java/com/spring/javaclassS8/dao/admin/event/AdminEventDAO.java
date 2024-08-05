package com.spring.javaclassS8.dao.admin.event;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;

public interface AdminEventDAO {

	// 이벤트 업로드 처리
	int insertEvent(EventVO event);

	// 이벤트 컨텐츠 수정 처리
	int updateEvent(EventVO event);

	// 이벤트 리스트 조건 검색
	List<EventVO> filterEvents(@Param("eventCategory") String eventCategory, @Param("status") String status, @Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("keyword") String keyword);

	// 이벤트 참여자 수 가져오기
	int getParticipantCount(int eventId);

	// 이벤트 참여자의 memberId 가져오기
	List<Integer> getActiveParticipants(int eventId);

	// 이벤트 당첨자 저장하기
	void insertWinner(WinnerVO winner);

	// 이벤트 추첨 리스트
	List<EventDrawSummaryVO> getEventDrawSummaries(@Param("offset") int offset, @Param("pageSize") int pageSize);

	// 이벤트 당첨자 디테일
	List<WinnerDetailVO> getWinnerDetails(int eventId);

	// 이벤트 아이디로 이벤트 가져오기
	EventVO getEventById(int eventId);

	// 당첨자 발표 게시글 저장
	void insertWinnerPost(WinnerPostVO winnerPost);

	// 이벤트 당첨자 메일 발송 후 메일 발송여부 필드 업데이트
	void updateEmailSentAt(int winnerId);

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨자 디테일 가져오기
	List<WinnerDetailVO> getWinnerDetailsByDrawAt(@Param("eventId") int eventId, @Param("drawAt") Timestamp drawAt);

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨 발표여부 확인
	boolean isEventAnnouncedByDrawAt(@Param("eventId") int eventId, @Param("drawAt") Timestamp drawAt);

	// winners 테이블의 isAnnounced 업데이트
	int updateWinnerIsAnnounced(@Param("eventId") int eventId, @Param("drawAt") Timestamp drawAt);
	
	// 전체 이벤트 리스트 가져오기
	List<EventVO> getAllEvents(@Param("offset") int offset, @Param("pageSize") int pageSize);
	
	// 전체 이벤트 개수 가져오기 (페이징)
	int getTotalEventsCount();
	
	// 전체 이벤트 추첨 개수 가져오기 (페이징)
	int getTotalDrawCount();
}
