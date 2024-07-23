package com.spring.javaclassS8.dao.admin.event;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;

@Repository
public class AdminEventDAOImpl implements AdminEventDAO {

	@Autowired
	private SqlSession sqlSession;

	// 이벤트 업로드
	@Override
	public int insertEvent(EventVO event) {
		return sqlSession.getMapper(AdminEventDAO.class).insertEvent(event);
	}

	// 이벤트 컨텐츠 수정 처리
	@Override
	public int updateEvent(EventVO event) {
		return sqlSession.getMapper(AdminEventDAO.class).updateEvent(event);
	}

	// 이벤트 리스트 조건 검색
	@Override
	public List<EventVO> filterEvents(String eventCategory, String status, String startDate, String endDate, String keyword) {
		return sqlSession.getMapper(AdminEventDAO.class).filterEvents(eventCategory, status, startDate, endDate, keyword);
	}

	// 이벤트 참여자 수 가져오기
	@Override
	public int getParticipantCount(int eventId) {
		return sqlSession.getMapper(AdminEventDAO.class).getParticipantCount(eventId);
	}

	// 이벤트 참여자 memberId 가져오기
	@Override
	public List<Integer> getActiveParticipants(int eventId) {
		return sqlSession.getMapper(AdminEventDAO.class).getActiveParticipants(eventId);
	}

	// 이벤트 당첨자 저장하기
	@Override
	public void insertWinner(WinnerVO winner) {
		sqlSession.getMapper(AdminEventDAO.class).insertWinner(winner);
	}

	// 이벤트 추첨 리스트
	@Override
	public List<EventDrawSummaryVO> getEventDrawSummaries() {
		return sqlSession.getMapper(AdminEventDAO.class).getEventDrawSummaries();
	}

	// 이벤트 당첨자 디테일
	@Override
	public List<WinnerDetailVO> getWinnerDetails(int eventId) {
		return sqlSession.getMapper(AdminEventDAO.class).getWinnerDetails(eventId);
	}

	// 이벤트 아이디로 이벤트 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return sqlSession.getMapper(AdminEventDAO.class).getEventById(eventId);
	}

	// 당첨자 발표 게시글 저장
	@Override
	public void insertWinnerPost(WinnerPostVO winnerPost) {
		sqlSession.getMapper(AdminEventDAO.class).insertWinnerPost(winnerPost);
	}

	// 이벤트 당첨자 메일 발송 후 메일 발송여부 필드 업데이트
	@Override
	public void updateEmailSentAt(int winnerId) {
		sqlSession.getMapper(AdminEventDAO.class).updateEmailSentAt(winnerId);
	}

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨자 디테일 가져오기
	@Override
	public List<WinnerDetailVO> getWinnerDetailsByDrawAt(int eventId, Timestamp drawAt) {
		return sqlSession.getMapper(AdminEventDAO.class).getWinnerDetailsByDrawAt(eventId, drawAt);
	}

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨 발표여부 확인
	@Override
	public boolean isEventAnnouncedByDrawAt(int eventId, Timestamp drawAt) {
		return sqlSession.getMapper(AdminEventDAO.class).isEventAnnouncedByDrawAt(eventId, drawAt);
	}
	
	// 당첨자 발표 후 winners 테이블의 isAnnounced 업데이트
	@Override
	public int updateWinnerIsAnnounced(int eventId, Timestamp drawAt) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("eventId", eventId);
	    paramMap.put("drawAt", drawAt);
	    int updatedRows = sqlSession.update("com.spring.javaclassS8.dao.admin.event.AdminEventDAO.updateWinnerIsAnnounced", paramMap);
	    System.out.println("Updated " + updatedRows + " rows for eventId: " + eventId + ", drawAt: " + drawAt);
	    return updatedRows;
	}
}
