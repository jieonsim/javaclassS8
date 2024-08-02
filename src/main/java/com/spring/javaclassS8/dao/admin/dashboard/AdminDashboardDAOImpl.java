package com.spring.javaclassS8.dao.admin.dashboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.reserve.TeamReservationRateVO;
import com.spring.javaclassS8.vo.reserve.TicketTypeSalesVO;

@Repository
public class AdminDashboardDAOImpl implements AdminDashboardDAO {
	@Autowired
	private SqlSession sqlSession;

	// 현재까지 총 예매완료 건 수
	@Override
	public int countCompletedReservations() {
		return sqlSession.getMapper(AdminDashboardDAO.class).countCompletedReservations();
	}
	
	// 현재 진행 중인 이벤트 건 수
	@Override
	public int countOngoingEvents() {
		return sqlSession.getMapper(AdminDashboardDAO.class).countOngoingEvents();
	}
	
	// 활동 중인 회원 수
	@Override
	public int countActiveMembers() {
		return sqlSession.getMapper(AdminDashboardDAO.class).countActiveMembers();
	}
	
	// 현재 예매 오픈된 경기 수
	@Override
	public int countOpenGames() {
		return sqlSession.getMapper(AdminDashboardDAO.class).countOpenGames();
	}
	
	// 예매 대비 취소율
	@Override
	public double getCancellationRate() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getCancellationRate();
	}
	
	// 총 예매수수료 수익
	@Override
	public int getTotalBookingFeeRevenue() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getTotalBookingFeeRevenue();
	}
	
	// 최근 6개월 간 예매 매출액
	@Override
	public List<ReservationVO> getReservationsLast6Months() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getReservationsLast6Months();
	}
	
	// 스포츠 종목별 예매율
	@Override
	public List<Map<String, Object>> getSportsReservationCount() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getSportsReservationCount();
	}

	// 야구 팀별 홈경기 예매율
	@Override
	public List<TeamReservationRateVO> getBaseballTeamReservationRate() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getBaseballTeamReservationRate();
	}

	// 축구 팀별 홈경기 예매율
	@Override
	public List<TeamReservationRateVO> getFootballTeamReservationRate() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getFootballTeamReservationRate();
	}

	// 예매권 발행 수 대비 사용 현황
	@Override
	public List<AdvanceTicketVO> getAllAdvanceTickets() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getAllAdvanceTickets();
	}
	
	// 권종별 판매 현황
	@Override
	public List<TicketTypeSalesVO> getTicketTypeSalesCount() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getTicketTypeSalesCount();
	}
}