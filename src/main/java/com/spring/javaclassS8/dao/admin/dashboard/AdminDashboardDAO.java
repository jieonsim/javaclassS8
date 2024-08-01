package com.spring.javaclassS8.dao.admin.dashboard;

import java.util.List;
import java.util.Map;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.reserve.TeamReservationRateVO;
import com.spring.javaclassS8.vo.reserve.TicketTypeSalesVO;

public interface AdminDashboardDAO {

    List<ReservationVO> getReservationsLast6Months();
    List<Map<String, Object>> getSportsReservationCount();
    List<TeamReservationRateVO> getBaseballTeamReservationRate();
    List<TeamReservationRateVO> getFootballTeamReservationRate();
    List<AdvanceTicketVO> getAllAdvanceTickets();
    List<TicketTypeSalesVO> getTicketTypeSalesCount();
}
