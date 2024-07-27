package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;
import com.spring.javaclassS8.vo.sports.TicketTypeVO;

public interface SportsService {
	
	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getGamesFromToday(String sport, LocalDate today, YearMonth currentMonth);

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	List<GameVO> getTeamHomeGames(String sport, String team, LocalDate startDate, LocalDate endDate);

	// 경기 고유번호로 경기 정보 가져오기
	GameVO getGameById(int gameId);
	
	// 경기 고유번호로 잔여 좌석 수 가져오기
	List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId);

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	int getMaxTicketsPerBooking(int sportId);
	
	// 좌석 고유번호로 좌석 정보 가져오기
	SeatVO getSeatById(int seatId);

	// 좌석 고유번호로 권종리스트 가져오기
	List<TicketTypeVO> getTicketTypesBySeatId(int seatId);
	
	// 좌석 고유번호로 요금 정보 가져오기
	List<PriceVO> getPricesBySeatId(int seatId);
	
	// 스포츠 고유번호로 예매 정책 정보 가져오기
	SportBookingPolicyVO getBookingPolicyBySportId(int sportId);

	// 좌석 고유번호로 권종 카테고리별 필요한 rowspan 가져오기
	List<CategoryVO> getCategoriesWithRowspan(int seatId);


}
