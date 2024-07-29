package com.spring.javaclassS8.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	// 유저 메인
	@GetMapping("/")
	public String home() {
		return "home";
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
