package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;

public interface SportsDAO {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(@Param("sport") String sport, @Param("today") LocalDate today, @Param("firstDayOfNextMonth") LocalDate firstDayOfNextMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(@Param("sport") String sport, @Param("shortName") String shortName, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

	// gameId로 경기 정보 가져오기
	GameVO getGameById(int gameId);

	// gameId로 잔여 좌석 수 가져오기
	List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId);

	// sportId로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	int getMaxTicketsPerBooking(int sportId);
}
