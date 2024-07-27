package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

@Repository
public class SportsDAOImpl implements SportsDAO {

	@Autowired
	private SqlSession sqlSession;

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	@Override
	public List<GameVO> getGamesFromToday(String sport, LocalDate today, LocalDate firstDayOfNextMonth) {
		return sqlSession.getMapper(SportsDAO.class).getGamesFromToday(sport, today, firstDayOfNextMonth);
	}

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	@Override
	public List<GameVO> getTeamHomeGames(String sport, String shortName, LocalDate startDate, LocalDate endDate) {
		return sqlSession.getMapper(SportsDAO.class).getTeamHomeGames(sport, shortName, startDate, endDate);
	}

	// 경기 고유번호로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return sqlSession.getMapper(SportsDAO.class).getGameById(gameId);
	}

	// 경기 고유번호로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return sqlSession.getMapper(SportsDAO.class).getSeatInventoriesByGameId(gameId);
	}

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
		return sqlSession.getMapper(SportsDAO.class).getMaxTicketsPerBooking(sportId);
	}

	// 좌석 고유번호로 좌석 정보 가져오기
	@Override
	public SeatVO getSeatById(int seatId) {
		return sqlSession.getMapper(SportsDAO.class).getSeatById(seatId);
	}

	// 좌석 고유번호로 요금 정보 가져오기
	@Override
	public List<PriceVO> getPricesBySeatId(int seatId) {
		return sqlSession.getMapper(SportsDAO.class).getPricesBySeatId(seatId);
	}

	// 스포츠 고유번호로 예매 정책 정보 가져오기
	@Override
	public SportBookingPolicyVO getBookingPolicyBySportId(int sportId) {
		return sqlSession.getMapper(SportsDAO.class).getBookingPolicyBySportId(sportId);
	}

	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId) {
		return sqlSession.getMapper(SportsDAO.class).getValidAdvanceTicketsByMemberId(memberId);
	}

}