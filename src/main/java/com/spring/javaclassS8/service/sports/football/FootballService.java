package com.spring.javaclassS8.service.sports.football;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import com.spring.javaclassS8.vo.sports.GameVO;

public interface FootballService {
	
	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getFootballGamesFromToday(LocalDate today, YearMonth currentMonth);
	

}
