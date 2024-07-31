package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

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

	@Override
	public TeamVO findTeamByKeyword(String keyword) {
		return sqlSession.getMapper(SportsDAO.class).findTeamByKeyword(keyword);
	}

	@Override
	public VenueVO findVenueByKeyword(String keyword) {
		return sqlSession.getMapper(SportsDAO.class).findVenueByKeyword(keyword);
	}
}