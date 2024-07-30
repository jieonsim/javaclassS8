package com.spring.javaclassS8.service.my.reserve;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.utils.PaginationInfo;
import com.spring.javaclassS8.vo.reserve.ReservationDetailVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class MyReservationServiceImpl implements MyReservationService {

	@Autowired
	private ReservationDAO reservationDAO;

	// 마이페이지 > 예매확인 뷰
	@Override
	public Map<String, Object> getReservationListByMemberId(int memberId, int page) {
		int pageSize = 10;
		int offset = (page - 1) * pageSize;

		List<ReservationVO> reservations = reservationDAO.getReservationListByMemberId(memberId, offset, pageSize);
		int totalCount = reservationDAO.getReservationCountByMemberId(memberId);

		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E)");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

		for (ReservationVO reservation : reservations) {
			if (reservation.getGameDate() != null) {
				LocalDate date = LocalDate.parse(reservation.getGameDate());
				reservation.setGameDate(date.format(dateFormatter));
			}

			if (reservation.getGameTime() != null) {
				LocalTime time = LocalTime.parse(reservation.getGameTime());
				reservation.setGameTime(time.format(timeFormatter));
			}
		}

		PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);

		Map<String, Object> result = new HashMap<>();
		result.put("reservations", reservations);
		result.put("paginationInfo", paginationInfo);

		return result;
	}

	// 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	@Override
	public int getAvailableReservationCount(int memberId) {
		return reservationDAO.getAvailableReservationCount(memberId);
	}

	// 마이페이지 > 예매확인 > 예매상세내역 뷰
    @Override
    public Map<String, Object> getReservationDetail(int reservationId) {
        Map<String, Object> result = new HashMap<>();
        
        ReservationVO reservation = reservationDAO.getReservationById(reservationId);
        List<ReservationDetailVO> reservationDetails = reservationDAO.getReservationDetailsById(reservationId);
        List<Map<String, Object>> advanceTickets = reservationDAO.getAdvanceTicketsForReservation(reservationId);
        List<Map<String, Object>> advanceTicketPrices = reservationDAO.getAdvanceTicketPricesForReservation(reservationId);
        
        // 날짜 형식 변환 및 계산
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat outputFormatDate = new SimpleDateFormat("yyyy.MM.dd(E)");
        SimpleDateFormat outputFormatTime = new SimpleDateFormat("HH:mm");
        SimpleDateFormat outputFormatDateTime = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
        SimpleDateFormat outputFormatDateOnly = new SimpleDateFormat("yyyy.MM.dd");
        
        try {
            Date gameDateTime = inputFormat.parse(reservation.getGameDate() + " " + reservation.getGameTime());
            reservation.setGameDate(outputFormatDate.format(gameDateTime));
            reservation.setGameTime(outputFormatTime.format(gameDateTime));
            
            Date createdAt = new Date(reservation.getCreatedAt().getTime());
            reservation.setFormattedCreatedAt(outputFormatDateOnly.format(createdAt));
            
            // 취소 마감시간 계산
            Calendar cancelDeadline = Calendar.getInstance();
            cancelDeadline.setTime(gameDateTime);
            cancelDeadline.add(Calendar.MINUTE, -120); // 예: 120분 전
            reservation.setCancelDeadline(outputFormatDateTime.format(cancelDeadline.getTime()));
            
            SimpleDateFormat cancelDeadlineFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
            reservation.setFormattedCancelDeadline(cancelDeadlineFormat.format(cancelDeadline.getTime()));
            
            // 예매익일 계산
            Calendar nextDay = Calendar.getInstance();
            nextDay.setTime(createdAt);
            nextDay.add(Calendar.DATE, 1);
            
            String cancelPeriod = outputFormatDateOnly.format(nextDay.getTime()) + "~" +
                                  outputFormatDateOnly.format(cancelDeadline.getTime());
            reservation.setCancelPeriod(cancelPeriod);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // 티켓 가격 총합 계산
        int totalTicketPrice = reservationDetails.stream()
                .mapToInt(ReservationDetailVO::getTicketPrice)
                .sum();
        reservation.setTotalTicketPrice(totalTicketPrice);
        
        // 예매권 할인 금액 계산
        int advanceTicketDiscount = advanceTicketPrices.stream()
                .mapToInt(ticket -> ((Number) ticket.get("price")).intValue())
                .sum();
        reservation.setAdvanceTicketDiscount(advanceTicketDiscount);
        
        result.put("reservation", reservation);
        result.put("reservationDetails", reservationDetails);
        result.put("advanceTickets", advanceTickets);
        result.put("advanceTicketPrices", advanceTicketPrices);
        
        return result;
    }
}
