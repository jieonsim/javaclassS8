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

	// 총 예매수수료 수익
	int getTotalBookingFeeRevenue();

	// 최근 6개월 간 예매 매출액
	List<ReservationVO> getReservationsLast6Months();

	// 스포츠 종목별 예매율
	List<Map<String, Object>> getSportsReservationCount();

	// 야구 팀별 홈경기 예매율
	List<TeamReservationRateVO> getBaseballTeamReservationRate();

	// 축구 팀별 홈경기 예매율
	List<TeamReservationRateVO> getFootballTeamReservationRate();

	// 예매권 발행 수 대비 사용 현황
	List<AdvanceTicketVO> getAllAdvanceTickets();

	// 권종별 판매 현황
	List<TicketTypeSalesVO> getTicketTypeSalesCount();

}
