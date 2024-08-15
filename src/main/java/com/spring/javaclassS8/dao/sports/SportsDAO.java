package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

public interface SportsDAO {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(@Param("sport") String sport, @Param("today") LocalDate today, @Param("firstDayOfNextMonth") LocalDate firstDayOfNextMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(@Param("sport") String sport, @Param("shortName") String shortName, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

	// 키워드로 팀 검색
	TeamVO findTeamByKeyword(String keyword);

	// 키워드로 경기장 검색
	VenueVO findVenueByKeyword(String keyword);

	// 경기장 정보 가져오기
	VenueVO getTeamVenue(@Param("sport") String sport, @Param("shortName") String shortName);

	// 각 스포츠, 팀별로 좌석 등급과 권종별 요금 가져오기
	List<Map<String, Object>> getSeatPricesForTeam(@Param("sport") String sport, @Param("shortName") String shortName);
}
