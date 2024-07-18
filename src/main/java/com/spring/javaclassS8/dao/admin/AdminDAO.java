package com.spring.javaclassS8.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;

public interface AdminDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

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
	List<Integer> getActivceParticipants(int eventId);

	// 이벤트 당첨자 저장하기
	void insertWinner(WinnerVO winner);

	// 이벤트 추첨 리스트
	List<EventDrawSummaryVO> getEventDrawSummaries();

	// 이벤트 당첨자 디테일
	List<WinnerDetailVO> getWinnerDetails(int eventId);

	// 이벤트 아이디로 이벤트 가져오기
	EventVO getEventById(int eventId);

	// 당첨자 발표 게시글 저장
	void insertWinnerPost(WinnerPostVO winnerPost);

	// winners 테이블의 isAnnounced 업데이트
	void updateWinnerIsAnnounced(int eventId);

	// 이벤트 당첨자 발표 공지 여부
	boolean isEventAnnounced(int eventId);

	// 이벤트 당첨자 발표 게시글 공개 여부
	boolean isWinnerPostPublished(int eventId);

	// 이벤트 당첨자 발표 게시글 공개/비공개 처리
	boolean updateWinnerPostPublishStatus(Map<String, Object> params);

	// 이벤트 당첨자 발표 공지 처리
	boolean updateWinnersAnnouncedStatus(@Param("eventId") int eventId, @Param("isAnnounced") boolean isAnnounced);

}
