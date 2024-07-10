package com.spring.javaclassS8.controller.sports.volleyball;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/volleyball")
public class VolleyballController {

	// 배구 시즌오프 메인
	@GetMapping("/off-season")
	public String baseball() {
		return "sports/volleyball/off-season";
	}
}
