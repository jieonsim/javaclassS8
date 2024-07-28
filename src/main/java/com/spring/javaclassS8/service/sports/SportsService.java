package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import com.spring.javaclassS8.vo.sports.GameVO;

public interface SportsService {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(String sport, LocalDate today, YearMonth currentMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(String sport, String team, LocalDate startDate, LocalDate endDate);
}
