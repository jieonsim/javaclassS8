package com.spring.javaclassS8.controller.sports.baseball;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/baseball/kt")
public class KTController {
	
	// Kt wiz 예매하기
	@GetMapping("/reservation")
	public String reservation() {
		return "sports/baseball/kt/reservation";
	}
}
