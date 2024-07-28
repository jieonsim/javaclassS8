package com.spring.javaclassS8.service.reserve;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;

	// 경기 고유번호로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return reservationDAO.getGameById(gameId);
	}

	// 경기 고유번호로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return reservationDAO.getSeatInventoriesByGameId(gameId);
	}

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
		return reservationDAO.getMaxTicketsPerBooking(sportId);
	}

	// 좌석 고유번호로 좌석 정보 가져오기
	@Override
	public SeatVO getSeatById(int seatId) {
		return reservationDAO.getSeatById(seatId);
	}

	// 좌석 고유번호로 요금 정보 가져오기
	@Override
	public List<PriceVO> getPricesBySeatId(int seatId) {
		return reservationDAO.getPricesBySeatId(seatId);
	}

	// 스포츠 고유번호로 예매 정책 정보 가져오기
	@Override
	public SportBookingPolicyVO getBookingPolicyBySportId(int sportId) {
		return reservationDAO.getBookingPolicyBySportId(sportId);
	}

	// 좌석 고유번호로 권종 카테고리별 필요한 rowspan 가져오기
	@Override
	public List<CategoryVO> getCategoriesWithRowspan(int seatId) {
		List<PriceVO> prices = reservationDAO.getPricesBySeatId(seatId);
		Map<String, Integer> categoryCount = new HashMap<>();

		for (PriceVO price : prices) {
			categoryCount.put(price.getCategory(), categoryCount.getOrDefault(price.getCategory(), 0) + 1);
		}

		List<CategoryVO> categoryList = new ArrayList<>();
		for (Map.Entry<String, Integer> entry : categoryCount.entrySet()) {
			categoryList.add(new CategoryVO(entry.getKey(), entry.getValue()));
		}

		return categoryList;
	}

	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId) {
		List<Map<String, Object>> tickets = reservationDAO.getValidAdvanceTicketsByMemberId(memberId);
		
		for (Map<String, Object> ticket : tickets) {
			// 유효기간 형식 변경
			Timestamp expiresAt = (Timestamp) ticket.get("expiresAt");
			String formattedDate = new SimpleDateFormat("yyyy.MM.dd").format(expiresAt) + "까지";
			ticket.put("formattedExpiresAt", formattedDate);

		}
		return tickets;
	}
}
