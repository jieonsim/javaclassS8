package com.spring.javaclassS8.dao.admin.event;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketEmailVO;

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

	// 이벤트 당첨자에게 당첨 안내 및 예매권 번호를 발송했는지 확인
	AdvanceTicketEmailVO getAdvanceTicketEmailByAdvanceTicketId(int advanceTicketId);

	// 기존 이메일 발송 기록이 있는 경우 retryCount / lastAttemptAt / status 필드 업데이트
	void updateAdvanceTicketEmail(AdvanceTicketEmailVO advanceTicketEmail);

	// 새로운 이메일 발송 시 advance_ticket_email 테이블에 레코드 생성
	void insertAdvanceTicketEmail(AdvanceTicketEmailVO advanceTicketEmail);

	// 이벤트 당첨자 메일 발송 후 winners 테이블의 emailSentAt 필드 업데이트
	void updateEmailSentAt(int winnerId);

}
