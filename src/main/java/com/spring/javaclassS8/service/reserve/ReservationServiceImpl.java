
package com.spring.javaclassS8.service.reserve;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.vo.reserve.ReservationDetailVO;
import com.spring.javaclassS8.vo.reserve.ReservationRequest;
import com.spring.javaclassS8.vo.reserve.ReservationResponse;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.reserve.SeatDetailVO;
import com.spring.javaclassS8.vo.reserve.TempReservation;
import com.spring.javaclassS8.vo.reserve.TicketTypeRequest;
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

	@Autowired
	private HttpSession session;

	// @Autowired
	// private ReservationCompletedEmailService emailService;

	//private static final Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);

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

	// 예매 처리
	@Override
	@Transactional
	public ReservationResponse processReservation(ReservationRequest request) throws Exception {
		// 1. 예매번호 생성
		String reservationNumber = generateReservationNumber();

		// 2. 상세 좌석번호 생성
		List<SeatDetailVO> seatDetails = generateSeatNumbers(request.getTicketAmount());

		// 3. completed.jsp에 상세 좌석번호 보여주기 위해 TempReservation 업데이트
		TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
		if (tempReservation != null) {
			tempReservation.setSeatDetails(seatDetails);
			session.setAttribute("tempReservation", tempReservation);
		}

		// 4. reservations 테이블 레코드 생성
		ReservationVO reservation = createReservation(request, reservationNumber);
		reservationDAO.insertReservation(reservation);
		int reservationId = reservation.getId();

		// 5. reservation_details 테이블 레코드 생성
		List<ReservationDetailVO> reservationDetails = createReservationDetails(reservationId, request, seatDetails);
		reservationDAO.insertReservationDetails(reservationDetails);

		// 6. seat_inventory 테이블 업데이트
		reservationDAO.updateSeatInventory(request.getGameId(), request.getSeatId(), request.getTicketAmount());

		// 7. 예매권 사용 처리
		if (request.getAdvanceTicketIds() != null && !request.getAdvanceTicketIds().isEmpty()) {
			reservationDAO.updateAdvanceTickets(request.getAdvanceTicketIds(), request.getMemberId());
			reservationDAO.insertAdvanceTicketUsage(reservationId, request.getAdvanceTicketIds());
		}

		ReservationResponse response = new ReservationResponse(true, reservationId, reservationNumber, "예매가 완료되었습니다.");
		response.setSeatDetails(seatDetails);
		response.setTotalAmount(request.getTotalAmount());
		response.setBookingFee(request.getBookingFee());

		return response;
	}

	// 10자리 숫자로 된 예매번호 생성
	private String generateReservationNumber() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder(10);
		for (int i = 0; i < 10; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}

	// 좌석번호 생성
	private List<SeatDetailVO> generateSeatNumbers(int ticketAmount) {
		List<SeatDetailVO> seatDetails = new ArrayList<>();
		Random random = new Random();

		int seatBlock = 101 + random.nextInt(9); // 101~109
		int seatRow = 1 + random.nextInt(10); // 1~10
		int seatNumber = 1 + random.nextInt(99); // 1~99

		for (int i = 0; i < ticketAmount; i++) {
			SeatDetailVO seatDetail = new SeatDetailVO();
			seatDetail.setSeatBlock(seatBlock);
			seatDetail.setSeatRow(seatRow);
			seatDetail.setSeatNumber(seatNumber + i);
			seatDetails.add(seatDetail);
		}
		return seatDetails;
	}

	// Reservation 객체 생성
	private ReservationVO createReservation(ReservationRequest request, String reservationNumber) {
		ReservationVO reservation = new ReservationVO();
		reservation.setId(0); // 명시적으로 0으로 설정
		reservation.setReservationNumber(reservationNumber);
		reservation.setMemberId(request.getMemberId());
		reservation.setGameId(request.getGameId());
		reservation.setTotalAmount(request.getTotalAmount());
		reservation.setTicketAmount(request.getTicketAmount());
		reservation.setBookingFee(request.getBookingFee());
		reservation.setStatus("예매완료");
		return reservation;
	}

	// ReservationDetail 객체 리스트 생성
	private List<ReservationDetailVO> createReservationDetails(int reservationId, ReservationRequest request, List<SeatDetailVO> seatDetails) {
		List<ReservationDetailVO> reservationDetails = new ArrayList<>();
		int seatIndex = 0;
		for (TicketTypeRequest ticketType : request.getTicketTypes()) {
			for (int i = 0; i < ticketType.getTicketQuantity(); i++) {
				if (seatIndex >= seatDetails.size()) {
					throw new IllegalStateException("좌석 수가 티켓 수와 일치하지 않습니다.");
				}
				SeatDetailVO seatDetail = seatDetails.get(seatIndex);
				ReservationDetailVO detail = new ReservationDetailVO();
				detail.setReservationId(reservationId);
				detail.setSeatId(request.getSeatId());
				detail.setTicketTypeId(ticketType.getTicketTypeId());
				detail.setSeatBlock(seatDetail.getSeatBlock());
				detail.setSeatRow(seatDetail.getSeatRow());
				detail.setSeatNumber(seatDetail.getSeatNumber());
				detail.setTicketPrice(getPriceForTicketType(request.getSportId(), request.getTeamId(), request.getVenueId(), request.getSeatId(), ticketType.getTicketTypeId()));
				reservationDetails.add(detail);
				seatIndex++;
			}
		}
		return reservationDetails;
	}

	// 권종별 요금 가져오기
	private int getPriceForTicketType(int sportId, int teamId, int venueId, int seatId, int ticketTypeId) {
		return reservationDAO.getPriceForTicketType(sportId, teamId, venueId, seatId, ticketTypeId);
	}
}
