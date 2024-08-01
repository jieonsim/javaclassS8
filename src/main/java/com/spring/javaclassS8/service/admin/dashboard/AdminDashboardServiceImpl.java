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
    
    @Override
    public Map<String, Object> getReservationData() {
        List<ReservationVO> reservations = adminDashboardDAO.getReservationsLast6Months();
        return processReservationData(reservations);
    }

    @Override
    public Map<String, Object> getSportsPieData() {
        List<Map<String, Object>> sportsData = adminDashboardDAO.getSportsReservationCount();
        return processPieChartData(sportsData, "sportName", "count");
    }

    @Override
    public Map<String, Object> getBaseballTeamData() {
        List<TeamReservationRateVO> teamData = adminDashboardDAO.getBaseballTeamReservationRate();
        return processBarChartData(teamData);
    }

    @Override
    public Map<String, Object> getFootballTeamData() {
        List<TeamReservationRateVO> teamData = adminDashboardDAO.getFootballTeamReservationRate();
        return processBarChartData(teamData);
    }

    @Override
    public Map<String, Object> getAdvanceTicketData() {
        List<AdvanceTicketVO> tickets = adminDashboardDAO.getAllAdvanceTickets();
        return processAdvanceTicketData(tickets);
    }

    @Override
    public Map<String, Object> getTicketTypeData() {
        List<TicketTypeSalesVO> ticketTypeData = adminDashboardDAO.getTicketTypeSalesCount();
        return processPieChartData(ticketTypeData);
    }

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

	private Map<String, Object> processReservationData(List<ReservationVO> reservations) {
        Map<String, Object> result = new HashMap<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

        Map<String, Long> monthlySales = reservations.stream()
            .collect(Collectors.groupingBy(
                reservation -> reservation.getCreatedAt().toLocalDateTime().format(formatter),
                Collectors.summingLong(ReservationVO::getTotalAmount)
            ));

        List<String> labels = new ArrayList<>(monthlySales.keySet());
        Collections.sort(labels);

        List<Long> data = labels.stream()
            .map(month -> monthlySales.getOrDefault(month, 0L))
            .collect(Collectors.toList());

        result.put("labels", labels);
        result.put("data", data);
        
        System.out.println("processReservationData result : " + result);
        return result;
    }

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
	    
	    System.out.println("processBarChartData result : " + result);
	    return result;
	}

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
        List<Long> issuedData = labels.stream()
            .map(month -> issuedCount.getOrDefault(month, 0L))
            .collect(Collectors.toList());
        List<Long> usedData = labels.stream()
            .map(month -> usedCount.getOrDefault(month, 0L))
            .collect(Collectors.toList());

        result.put("labels", labels);
        result.put("issuedData", issuedData);
        result.put("usedData", usedData);
        
        System.out.println("processAdvanceTicketData result : " + result);
        return result;
    }
}