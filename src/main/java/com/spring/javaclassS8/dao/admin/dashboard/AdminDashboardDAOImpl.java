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

	@Override
	public List<ReservationVO> getReservationsLast6Months() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getReservationsLast6Months();
	}

	@Override
	public List<Map<String, Object>> getSportsReservationCount() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getSportsReservationCount();
	}

	@Override
	public List<TeamReservationRateVO> getBaseballTeamReservationRate() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getBaseballTeamReservationRate();
	}

	@Override
	public List<TeamReservationRateVO> getFootballTeamReservationRate() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getFootballTeamReservationRate();
	}

	@Override
	public List<AdvanceTicketVO> getAllAdvanceTickets() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getAllAdvanceTickets();
	}

	@Override
	public List<TicketTypeSalesVO> getTicketTypeSalesCount() {
		return sqlSession.getMapper(AdminDashboardDAO.class).getTicketTypeSalesCount();
	}

//	@Override
//	public List<ReservationVO> getReservationsLast6Months() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getReservationsLast6Months();
//	}
//
//	@Override
//	public List<Map<String, Object>> getSportsReservationCount() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getSportsReservationCount();
//	}
//
//	@Override
//	public List<Map<String, Object>> getBaseballTeamReservationRate() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getBaseballTeamReservationRate();
//	}
//
//	@Override
//	public List<Map<String, Object>> getFootballTeamReservationRate() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getFootballTeamReservationRate();
//	}
//
//	@Override
//	public List<AdvanceTicketVO> getAllAdvanceTickets() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getAllAdvanceTickets();
//	}
//
//	@Override
//	public List<Map<String, Object>> getTicketTypeSalesCount() {
//		return sqlSession.getMapper(AdminDashboardDAO.class).getTicketTypeSalesCount();
//	}
}