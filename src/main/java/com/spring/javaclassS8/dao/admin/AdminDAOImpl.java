package com.spring.javaclassS8.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	// 예매권 발행하기 처리
	@Override
	public void insertAdvanceTicket(AdvanceTicketVO ticket) {
		sqlSession.getMapper(AdminDAO.class).insertAdvanceTicket(ticket);
	}

	// 이벤트 업로드
	@Override
	public int insertEvent(EventVO event) {
		return sqlSession.getMapper(AdminDAO.class).insertEvent(event);
	}

	// 이벤트 컨텐츠 수정 처리
	@Override
	public int updateEvent(EventVO event) {
		return sqlSession.getMapper(AdminDAO.class).updateEvent(event);
	}

	// 이벤트 리스트 조건 검색
	@Override
	public List<EventVO> filterEvents(String eventCategory, String status, String startDate, String endDate, String keyword) {
		return sqlSession.getMapper(AdminDAO.class).filterEvents(eventCategory, status, startDate, endDate, keyword);
	}

	// 이벤트 참여자 수 가져오기
	@Override
	public int getParticipantCount(int eventId) {
		return sqlSession.getMapper(AdminDAO.class).getParticipantCount(eventId);
	}

	// 이벤트 참여자 memberId 가져오기
	@Override
	public List<Integer> getActivceParticipants(int eventId) {
		return sqlSession.getMapper(AdminDAO.class).getActivceParticipants(eventId);
	}

	// 이벤트 당첨자 저장하기
	@Override
	public void insertWinner(WinnerVO winner) {
		sqlSession.getMapper(AdminDAO.class).insertWinner(winner);
	}

	// 이벤트 추첨 리스트
	@Override
	public List<EventDrawSummaryVO> getEventDrawSummaries() {
		return sqlSession.getMapper(AdminDAO.class).getEventDrawSummaries();
	}

	// 이벤트 당첨자 디테일
	@Override
	public List<WinnerDetailVO> getWinnerDetails(int eventId) {
		return sqlSession.getMapper(AdminDAO.class).getWinnerDetails(eventId);
	}

	// 이벤트 아이디로 이벤트 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return sqlSession.getMapper(AdminDAO.class).getEventById(eventId);
	}

	// 당첨자 발표 게시글 저장
	@Override
	public void insertWinnerPost(WinnerPostVO winnerPost) {
		sqlSession.getMapper(AdminDAO.class).insertWinnerPost(winnerPost);
	}

	// winners 테이블의 isAnnounced 업데이트
	@Override
	public void updateWinnerIsAnnounced(int eventId) {
		sqlSession.getMapper(AdminDAO.class).updateWinnerIsAnnounced(eventId);
	}

	// 이벤트 당첨자 발표 공지 여부
	@Override
	public boolean isEventAnnounced(int eventId) {
		return sqlSession.getMapper(AdminDAO.class).isEventAnnounced(eventId);
	}

	@Override
	public void updateEmailSentAt(int winnerId) {
	    sqlSession.getMapper(AdminDAO.class).updateEmailSentAt(winnerId);
	}
}
