package com.spring.javaclassS8.controller.admin.dashboard;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.admin.dashboard.AdminDashboardService;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminDashboardController {

	@Autowired
	private AdminDashboardService adminDashboardService;

	@GetMapping()
	public String dashboard() {
		return "admin/dashboard/dashboard";
	}

	// 오늘자 예매완료 건 수
	@GetMapping("/totalReservations")
	@ResponseBody
	public int getTotalCompletedReservations() {
		return adminDashboardService.getTotalCompletedReservations();
	}

	// 현재 진행 중인 이벤트 건 수
	@GetMapping("/ongoingEvents")
	@ResponseBody
	public int getOngoingEvents() {
		return adminDashboardService.getOngoingEvents();
	}

	// 활동 중인 회원 수
	@GetMapping("/activeMembers")
	@ResponseBody
	public int getActiveMembers() {
		return adminDashboardService.getActiveMembers();
	}

	// 현재 예매 오픈된 경기 수
	@GetMapping("/openGames")
	@ResponseBody
	public int getOpenGames() {
		return adminDashboardService.getOpenGames();
	}
	
	// 예매 대비 취소율
	@GetMapping("/cancellationRate")
	@ResponseBody
	public double getCancellationRate() {
		return adminDashboardService.getCancellationRate();
	}
	
	// 총 예매수수료 수익
	@GetMapping("/totalBookingFeeRevenue")
	@ResponseBody
	public int getTotalBookingFeeRevenue() {
		return adminDashboardService.getTotalBookingFeeRevenue();
	}

	// 최근 6개월 간 예매 매출액
	@GetMapping("/getReservationData")
	@ResponseBody
	public Map<String, Object> getReservationData() {
		return adminDashboardService.getReservationData();
	}

	// 스포츠 종목별 예매율
	@GetMapping("/getSportsPieData")
	@ResponseBody
	public Map<String, Object> getSportsPieData() {
		return adminDashboardService.getSportsPieData();
	}

	// 야구 팀별 홈경기 예매율
	@GetMapping("/getBaseballTeamData")
	@ResponseBody
	public Map<String, Object> getBaseballTeamData() {
		return adminDashboardService.getBaseballTeamData();
	}

	// 축구 팀별 홈경기 예매율
	@GetMapping("/getFootballTeamData")
	@ResponseBody
	public Map<String, Object> getFootballTeamData() {
		return adminDashboardService.getFootballTeamData();
	}

	// 예매권 발행 수 대비 사용 현황
	@GetMapping("/getAdvanceTicketData")
	@ResponseBody
	public Map<String, Object> getAdvanceTicketData() {
		return adminDashboardService.getAdvanceTicketData();
	}

	// 권종별 판매 현황
	@GetMapping("/getTicketTypeData")
	@ResponseBody
	public Map<String, Object> getTicketTypeData() {
		return adminDashboardService.getTicketTypeData();
	}
}
