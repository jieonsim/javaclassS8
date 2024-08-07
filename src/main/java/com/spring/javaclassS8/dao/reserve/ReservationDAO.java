package com.spring.javaclassS8.dao.reserve;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.reserve.ReservationDetailVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

public interface ReservationDAO {

	// 경기 고유번호로 경기 정보 가져오기
	GameVO getGameById(int gameId);

	// 경기 고유번호로 잔여 좌석 수 가져오기
	// List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId);
	
	// 경기 고유번호로 요금 등록된 좌석의 잔여 좌석 수 및 좌석 이름 가져오기
	List<SeatInventoryVO> getSeatInventoriesWithPricesByGameId(int gameId);

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

	// reservations 테이블 레코드 생성
	int insertReservation(ReservationVO reservation);

	// reservation_details 테이블 레코드 생성
	void insertReservationDetails(List<ReservationDetailVO> details);

	// seat_inventory 테이블 availableCapacity 필드 업데이트
	void updateSeatInventory(@Param("gameId") int gameId, @Param("seatId") int seatId, @Param("ticketAmount") int ticketAmount);

	// advance_tickets 테이블 used, usedAt, usedByMemberId 필드 업데이트
	void updateAdvanceTickets(@Param("advanceTicketIds") List<Integer> advanceTicketIds, @Param("memberId") int memberId);

	// advance_ticket_usage 테이블 레코드 생성
	void insertAdvanceTicketUsage(@Param("reservationId") int reservationId, @Param("advanceTicketIds") List<Integer> advanceTicketIds);

	// 권종별 요금 가져오기
	int getPriceForTicketType(@Param("sportId") int sportId, @Param("teamId") int teamId, @Param("venueId") int venueId, @Param("seatId") int seatId,
			@Param("ticketTypeId") int ticketTypeId);

	// 마이페이지 > 예매확인 뷰 | memberId로 해당 유저의 예매완료 리스트 가져오기
    List<ReservationVO> getReservationListByMemberId(@Param("memberId") int memberId, @Param("offset") int offset, @Param("limit") int limit);
    
    // 마이페이지 > 예매확인 뷰 | memberId로 해당 유저의 취소완료 리스트 가져오기
    List<ReservationVO> getReservationCancelListByMemberId(@Param("memberId") int memberId, @Param("offset") int offset, @Param("limit") int limit);
    
    // memberId로 해당 유저의 예매완료 건 수 가져오기
    int getReservationCountByMemberId(int memberId);
    
    // 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	int getAvailableReservationCount(int memberId);
	
	// reservationId로 예매내역 가져오기
	ReservationVO getReservationById(int reservationId);

	// reservationId로 예매상세내역 가져오기
	List<ReservationDetailVO> getReservationDetailsById(int reservationId);

	// reservationId로 스포츠예매권으로 예매된 내역 가져오기
	List<Map<String, Object>> getAdvanceTicketsForReservation(int reservationId);
	
	// reservationId로 각 예매별 스포츠예매권 권종의 요금 가져오기
	List<Map<String, Object>> getAdvanceTicketPricesForReservation(int reservationId);
	
	// 예매 취소 시 예매 상태를 취소로 업데이트
	void updateReservationStatus(@Param("reservationId") int reservationId, @Param("status") String status);
	
	// 예매 취소 시 좌석 수량 원복
	void restoreSeatInventoryForCancellation(@Param("gameId") int gameId, @Param("seatId") int seatId, @Param("ticketAmount") int ticketAmount);
	
	// 예매내역에 스포츠예매권 사용되었는지 확인
	List<Integer> getAdvanceTicketIdsForReservation(int reservationId);
	
	// 스포츠예매권의 예매 취소 시 예매권 사용 리셋
	void resetAdvanceTickets(List<Integer> advanceTicketIds);
	
	// 스포츠예매권의 예매 취소 시 사용된 예매권 테이블의 상테 업데이트
	void updateAdvanceTicketUsageStatus(@Param("reservationId") int reservationId, @Param("status") String status);

	// 취소 마감시간 가져오기
	int getCancellationDeadlineMinutes(int sportId);
	
	// 홈화면 경기일정에 경기 띄우기
	List<GameVO> getUpcomingGames(@Param("sport") String sport, @Param("today") LocalDate today);

	// memberId로 오늘 날짜로부터 관람일이 경과하지 않은 예매완료 건 가져오기
	List<ReservationVO> getAvailableReservationListByMemberId(int memberId);
	
	// memberId로 회원 이메일 가져오기
	String getEmailByMemberId(int memberId);
	

}
