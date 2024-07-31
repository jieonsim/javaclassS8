package com.spring.javaclassS8.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.reserve.ReservationService;
import com.spring.javaclassS8.vo.sports.GameVO;

@Controller
public class HomeController {
	
    @Autowired
    private ReservationService reservationService;
	
    @GetMapping("/")
    public String home(Model model) {
        List<GameVO> baseballGames = reservationService.getUpcomingGames("야구");
        model.addAttribute("baseballGames", baseballGames);
        return "home";
    }
    
    @GetMapping("/getGames")
    @ResponseBody
    public List<GameVO> getGames(@RequestParam String sport) {
        return reservationService.getUpcomingGames(sport);
    }

	// 어드민 메인
	@GetMapping("/admin/main")
	public String adminMain() {
		return "admin/main";
	}

	// 예매권 메일 테스트
	@GetMapping("/advanceTicketMail")
	public String advanceTicketMail() {
		return "mail/advanceTicketMail";
	}

	// 인증번호 메일 테스트
	@GetMapping("/certificationMail")
	public String certificationMail() {
		return "mail/certificationMail";
	}

	// 예매내역 메일 테스트
	@GetMapping("/reservationCompletedMail")
	public String reservationCompletedMail() {
		return "mail/reservationCompletedMail";
	}
	
	// 에러 페이지
	@GetMapping("/error")
	public String commonError() {
		return "common/error";
	}
}
