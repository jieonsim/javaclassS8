package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;

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

	// gameId로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return sqlSession.getMapper(SportsDAO.class).getGameById(gameId);
	}

	// gameId로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return sqlSession.getMapper(SportsDAO.class).getSeatInventoriesByGameId(gameId);
	}

	// sportId로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
	    return sqlSession.getMapper(SportsDAO.class).getMaxTicketsPerBooking(sportId);
	}
}