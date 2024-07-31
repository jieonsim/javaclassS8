package com.spring.javaclassS8.service.reserve;

import java.util.List;
import java.util.Map;

import com.spring.javaclassS8.vo.reserve.ReservationRequest;
import com.spring.javaclassS8.vo.reserve.ReservationResponse;
import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

public interface ReservationService {
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

	// 좌석 고유번호로 권종 카테고리별 필요한 rowspan 가져오기
	List<CategoryVO> getCategoriesWithRowspan(int seatId);
	
	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId);

	// 예매 처리
	ReservationResponse processReservation(ReservationRequest request) throws Exception;

	List<GameVO> getUpcomingGames(String sport);

}
