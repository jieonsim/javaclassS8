package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

public interface SportsService {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(String sport, LocalDate today, YearMonth currentMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(String sport, String team, LocalDate startDate, LocalDate endDate);
	
	// 경기장 정보 가져오기
	VenueVO getTeamVenue(String sport, String team);

	// 각 스포츠,팀에 따른 좌석 등급 및 요금 가져오기
	List<Map<String, Object>> getSeatPricesForTeam(String sport, String team);
}
