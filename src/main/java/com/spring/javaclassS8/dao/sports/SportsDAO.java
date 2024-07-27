package com.spring.javaclassS8.dao.sports;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

public interface SportsDAO {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(@Param("sport") String sport, @Param("today") LocalDate today, @Param("firstDayOfNextMonth") LocalDate firstDayOfNextMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(@Param("sport") String sport, @Param("shortName") String shortName, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

	// 경기 고유번호로 경기 정보 가져오기
	GameVO getGameById(int gameId);

	// 경기 고유번호로 잔여 좌석 수 가져오기
	List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId);

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	int getMaxTicketsPerBooking(int sportId);

	// 좌석 고유번호로 좌석 정보 가져오기
	SeatVO getSeatById(int seatId);

	// 좌석 고유번호로 요금 정보 가져오기
	List<PriceVO> getPricesBySeatId(int seatId);

	// 스포츠 고유번호로 예매 정책 정보 가져오기
	SportBookingPolicyVO getBookingPolicyBySportId(int sportId);

	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId);
}
