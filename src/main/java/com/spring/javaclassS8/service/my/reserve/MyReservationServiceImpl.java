package com.spring.javaclassS8.service.my.reserve;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.utils.PaginationInfo;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class MyReservationServiceImpl implements MyReservationService {

	@Autowired
	private ReservationDAO reservationDAO;

	// memberId로 해당 유저의 예매완료 리스트 가져오기
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
}
