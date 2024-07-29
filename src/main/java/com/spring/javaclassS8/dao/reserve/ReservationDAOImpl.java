package com.spring.javaclassS8.dao.reserve;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.reserve.ReservationDetailVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	private SqlSession sqlSession;

	// 경기 고유번호로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return sqlSession.getMapper(ReservationDAO.class).getGameById(gameId);
	}

	// 경기 고유번호로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return sqlSession.getMapper(ReservationDAO.class).getSeatInventoriesByGameId(gameId);
	}

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
		return sqlSession.getMapper(ReservationDAO.class).getMaxTicketsPerBooking(sportId);
	}

	// 좌석 고유번호로 좌석 정보 가져오기
	@Override
	public SeatVO getSeatById(int seatId) {
		return sqlSession.getMapper(ReservationDAO.class).getSeatById(seatId);
	}

	// 좌석 고유번호로 요금 정보 가져오기
	@Override
	public List<PriceVO> getPricesBySeatId(int seatId) {
		return sqlSession.getMapper(ReservationDAO.class).getPricesBySeatId(seatId);
	}

	// 스포츠 고유번호로 예매 정책 정보 가져오기
	@Override
	public SportBookingPolicyVO getBookingPolicyBySportId(int sportId) {
		return sqlSession.getMapper(ReservationDAO.class).getBookingPolicyBySportId(sportId);
	}

	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId) {
		return sqlSession.getMapper(ReservationDAO.class).getValidAdvanceTicketsByMemberId(memberId);
	}

	// reservations 테이블 레코드 생성
	@Override
	public int insertReservation(ReservationVO reservation) {
		return sqlSession.getMapper(ReservationDAO.class).insertReservation(reservation);
	}

	// reservation_details 테이블 레코드 생성
	@Override
	public void insertReservationDetails(List<ReservationDetailVO> details) {
		sqlSession.getMapper(ReservationDAO.class).insertReservationDetails(details);
	}

	// seat_inventory 테이블 availableCapacity 필드 업데이트
	@Override
	public void updateSeatInventory(int gameId, int seatId, int ticketAmount) {
		sqlSession.getMapper(ReservationDAO.class).updateSeatInventory(gameId, seatId, ticketAmount);
	}

	// advance_tickets 테이블 used, usedAt, usedByMemberId 필드 업데이트
	@Override
	public void updateAdvanceTickets(List<Integer> advanceTicketIds, int memberId) {
		sqlSession.getMapper(ReservationDAO.class).updateAdvanceTickets(advanceTicketIds, memberId);
	}

	// advance_ticket_usage 테이블 레코드 생성
	@Override
	public void insertAdvanceTicketUsage(int reservationId, List<Integer> advanceTicketIds) {
		sqlSession.getMapper(ReservationDAO.class).insertAdvanceTicketUsage(reservationId, advanceTicketIds);
	}

	// 좌석 등급에 따른 권종별 요금 가져오기
	@Override
	public int getPriceForTicketType(int sportId, int teamId, int venueId, int seatId, int ticketTypeId) {
		return sqlSession.getMapper(ReservationDAO.class).getPriceForTicketType(sportId, teamId, venueId, seatId, ticketTypeId);
	}

	// memberId로 해당 유저의 예매완료 건 가져오기
    @Override
    public List<ReservationVO> getReservationListByMemberId(int memberId) {
        return sqlSession.getMapper(ReservationDAO.class).getReservationListByMemberId(memberId);
    }
}