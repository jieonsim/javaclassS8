package com.spring.javaclassS8.controller.sports;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/baseball")
public class BaseballController {
	
	// 야구 메인
	@GetMapping("/main")
	public String baseball() {
		return "sports/baseball/main";
	}
	
	@GetMapping("/lg/reservation")
	public String lg() {
		return "sports/baseball/lg/reservation";
	}
}
