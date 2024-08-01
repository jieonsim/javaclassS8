package com.spring.javaclassS8.controller.admin.dashboard;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.admin.dashboard.AdminDashboardService;

@Controller
@RequestMapping("/admin")
public class AdminDashboardController {
	
    @Autowired
    private AdminDashboardService adminDashboardService;

    @GetMapping("/main")
    public String dashboard() {
        return "admin/main";
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
    
    // 예매권 사용 현황(발행수 대비 사용 수 구하기)
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
