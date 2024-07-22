package com.spring.javaclassS8.dao.sports.football;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;

@Repository
public class FootballDAOImpl implements FootballDAO {

	@Autowired
	private SqlSession sqlSession;

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	@Override
	public List<GameVO> getFootballGamesFromToday(LocalDate today, LocalDate firstDayOfNextMonth) {
		return sqlSession.getMapper(FootballDAO.class).getFootballGamesFromToday(today, firstDayOfNextMonth);
	}

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	@Override
	public List<GameVO> getTeamHomeGames(String shortName, LocalDate startDate, LocalDate endDate) {
		return sqlSession.getMapper(FootballDAO.class).getTeamHomeGames(shortName, startDate, endDate);
	}
}