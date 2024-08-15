package com.spring.javaclassS8.service.admin.dashboard;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.admin.dashboard.AdminDashboardDAO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;
import com.spring.javaclassS8.vo.reserve.TeamReservationRateVO;
import com.spring.javaclassS8.vo.reserve.TicketTypeSalesVO;

@Service
public class AdminDashboardServiceImpl implements AdminDashboardService {

	@Autowired
	private AdminDashboardDAO adminDashboardDAO;

	// 현재까지 총 예매완료 건 수
	@Override
	public int getTotalCompletedReservations() {
		return adminDashboardDAO.countCompletedReservations();
	}

	// 현재 진행 중인 이벤트 건 수
	@Override
	public int getOngoingEvents() {
		return adminDashboardDAO.countOngoingEvents();
	}

	// 활동 중인 회원 수
	@Override
	public int getActiveMembers() {
		return adminDashboardDAO.countActiveMembers();
	}

	// 현재 예매 오픈된 경기 수
	@Override
	public int getOpenGames() {
		return adminDashboardDAO.countOpenGames();
	}

	// 현재 예매 대비 취소율
	@Override
	public double getCancellationRate() {
		return adminDashboardDAO.getCancellationRate();
	}

	// 총 예매수수료 수익
	@Override
	public int getTotalBookingFeeRevenue() {
		return adminDashboardDAO.getTotalBookingFeeRevenue();
	}
	
	// 최근 6개월 간 예매 매출액
	@Override
	public Map<String, Object> getReservationData() {
		List<ReservationVO> reservations = adminDashboardDAO.getReservationsLast6Months();
		return processReservationData(reservations);
	}

	// 스포츠 종목별 예매율
	@Override
	public Map<String, Object> getSportsPieData() {
		List<Map<String, Object>> sportsData = adminDashboardDAO.getSportsReservationCount();
		return processPieChartData(sportsData, "sportName", "count");
	}

	// 야구 팀별 홈경기 예매율
	@Override
	public Map<String, Object> getBaseballTeamData() {
		List<TeamReservationRateVO> teamData = adminDashboardDAO.getBaseballTeamReservationRate();
		return processBarChartData(teamData);
	}

	// 축구 팀별 홈경기 예매율
	@Override
	public Map<String, Object> getFootballTeamData() {
		List<TeamReservationRateVO> teamData = adminDashboardDAO.getFootballTeamReservationRate();
		return processBarChartData(teamData);
	}
	
	// 예매권 발행 수 대비 사용 현황
	@Override
	public Map<String, Object> getAdvanceTicketData() {
		List<AdvanceTicketVO> tickets = adminDashboardDAO.getAllAdvanceTickets();
		return processAdvanceTicketData(tickets);
	}
	
	// 권종별 판매 현황
	@Override
	public Map<String, Object> getTicketTypeData() {
		List<TicketTypeSalesVO> ticketTypeData = adminDashboardDAO.getTicketTypeSalesCount();
		return processPieChartData(ticketTypeData);
	}

	// 파이 차트
	private Map<String, Object> processPieChartData(List<Map<String, Object>> data, String labelField, String valueField) {
		Map<String, Object> result = new HashMap<>();
		List<String> labels = new ArrayList<>();
		List<Number> values = new ArrayList<>();

		for (Map<String, Object> item : data) {
			String label = (String) item.get(labelField);
			Number value = (Number) item.get(valueField);
			if (label != null && value != null) {
				labels.add(label);
				values.add(value);
			}
		}

		result.put("labels", labels);
		result.put("data", values);
		return result;
	}

	// 파이 차트
	private Map<String, Object> processPieChartData(List<TicketTypeSalesVO> data) {
		Map<String, Object> result = new HashMap<>();
		List<String> labels = new ArrayList<>();
		List<Integer> values = new ArrayList<>();

		for (TicketTypeSalesVO item : data) {
			labels.add(item.getTicketTypeName());
			values.add(item.getSalesCount());
		}

		result.put("labels", labels);
		result.put("data", values);

		return result;
	}

	// 예매현황 데이터
	private Map<String, Object> processReservationData(List<ReservationVO> reservations) {
		Map<String, Object> result = new HashMap<>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

		Map<String, Long> monthlySales = reservations.stream().collect(
				Collectors.groupingBy(reservation -> reservation.getCreatedAt().toLocalDateTime().format(formatter), Collectors.summingLong(ReservationVO::getTotalAmount)));

		List<String> labels = new ArrayList<>(monthlySales.keySet());
		Collections.sort(labels);

		List<Long> data = labels.stream().map(month -> monthlySales.getOrDefault(month, 0L)).collect(Collectors.toList());

		result.put("labels", labels);
		result.put("data", data);

		return result;
	}

	// 바 차트
	private Map<String, Object> processBarChartData(List<TeamReservationRateVO> data) {
		Map<String, Object> result = new HashMap<>();
		List<String> labels = new ArrayList<>();
		List<Double> values = new ArrayList<>();

		for (TeamReservationRateVO item : data) {
			labels.add(item.getTeamName());
			values.add(item.getReservationRate());
		}

		result.put("labels", labels);
		result.put("data", values);

		return result;
	}

	// 예매권 데이터
	private Map<String, Object> processAdvanceTicketData(List<AdvanceTicketVO> tickets) {
		Map<String, Object> result = new HashMap<>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

		Map<String, Long> issuedCount = new TreeMap<>();
		Map<String, Long> usedCount = new TreeMap<>();

		for (AdvanceTicketVO ticket : tickets) {
			String monthIssued = ticket.getIssuedAt().toLocalDateTime().format(formatter);
			issuedCount.put(monthIssued, issuedCount.getOrDefault(monthIssued, 0L) + 1);

			if (ticket.isUsed()) {
				String monthUsed = ticket.getUsedAt().toLocalDateTime().format(formatter);
				usedCount.put(monthUsed, usedCount.getOrDefault(monthUsed, 0L) + 1);
			}
		}

		List<String> labels = new ArrayList<>(issuedCount.keySet());
		List<Long> issuedData = labels.stream().map(month -> issuedCount.getOrDefault(month, 0L)).collect(Collectors.toList());
		List<Long> usedData = labels.stream().map(month -> usedCount.getOrDefault(month, 0L)).collect(Collectors.toList());

		result.put("labels", labels);
		result.put("issuedData", issuedData);
		result.put("usedData", usedData);

		return result;
	}
}