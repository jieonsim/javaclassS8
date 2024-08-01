package com.spring.javaclassS8.dao.admin.dashboard;

import java.util.List;
import java.util.Map;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.reserve.TeamReservationRateVO;
import com.spring.javaclassS8.vo.reserve.TicketTypeSalesVO;

public interface AdminDashboardDAO {

	// 현재까지 총 예매완료 건 수
	int countCompletedReservations();

	// 현재 진행 중인 이벤트 건 수
	int countOngoingEvents();
	
	// 활동 중인 회원 수
	int countActiveMembers();
	
	// 현재 예매 오픈된 경기 수
	int countOpenGames();
	
	// 예매 대비 취소율
	double getCancellationRate();
	
	// 이번달 예매수수료 수익
	int getCurrentMonthRevenue();
	
	List<ReservationVO> getReservationsLast6Months();

	List<Map<String, Object>> getSportsReservationCount();

	List<TeamReservationRateVO> getBaseballTeamReservationRate();

	List<TeamReservationRateVO> getFootballTeamReservationRate();

	List<AdvanceTicketVO> getAllAdvanceTickets();

	List<TicketTypeSalesVO> getTicketTypeSalesCount();





}
