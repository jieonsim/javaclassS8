package com.spring.javaclassS8.service.my.reserve;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class MyReservationServiceImpl implements MyReservationService {
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	// memberId로 해당 유저의 예매완료 건 가져오기
	@Override
    public List<ReservationVO> getReservationListByMemberId(int memberId) {
        List<ReservationVO> reservations = reservationDAO.getReservationListByMemberId(memberId);
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E)");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        
        for (ReservationVO reservation : reservations) {
            // 날짜 형식 변경
            if (reservation.getGameDate() != null) {
                LocalDate date = LocalDate.parse(reservation.getGameDate());
                reservation.setGameDate(date.format(dateFormatter));
            }
            
            // 시간 형식 변경
            if (reservation.getGameTime() != null) {
                LocalTime time = LocalTime.parse(reservation.getGameTime());
                reservation.setGameTime(time.format(timeFormatter));
            }
        }
        
        return reservations;
    }
}
