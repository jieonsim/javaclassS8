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

	// 메일 테스트
	@GetMapping("/advanceTicketMail")
	public String advanceTicketMail() {
		return "mail/advanceTicketMail";
	}
	
	// 메일 테스트
	@GetMapping("/certificationMail")
	public String certificationMail() {
		return "mail/certificationMail";
	}
}
