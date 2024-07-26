package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;

public interface SportsService {
	
	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(String sport, LocalDate today, YearMonth currentMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(String sport, String team, LocalDate startDate, LocalDate endDate);

	// gameId로 경기 정보 가져오기
	GameVO getGameById(int gameId);
	
	// gameId로 잔여 좌석 수 가져오기
	List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId);

	// sportId로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	int getMaxTicketsPerBooking(int sportId);

}
