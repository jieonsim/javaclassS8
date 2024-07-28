package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;

public interface SportsDAO {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(@Param("sport") String sport, @Param("today") LocalDate today, @Param("firstDayOfNextMonth") LocalDate firstDayOfNextMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(@Param("sport") String sport, @Param("shortName") String shortName, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
}
