package com.spring.javaclassS8.controller.sports;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SeasonOffController {

	// 농구 시즌오프 메인
	@GetMapping("/sports/basketball/off-season")
	public String basketball() {
		return "sports/basketball/off-season";
	}
	
	// 배구 시즌오프 메인
	@GetMapping("/sports/volleyball/off-season")
	public String baseball() {
		return "sports/volleyball/off-season";
	}
}
