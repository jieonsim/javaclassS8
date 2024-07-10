package com.spring.javaclassS8.controller.sports.basketball;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/basketball")
public class BasketballController {

	// 농구 시즌오프 메인
	@GetMapping("/off-season")
	public String basketball() {
		return "sports/basketball/off-season";
	}
}
