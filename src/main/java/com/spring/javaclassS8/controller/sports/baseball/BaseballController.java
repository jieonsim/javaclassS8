package com.spring.javaclassS8.controller.sports.baseball;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/baseball")
public class BaseballController {

	// 야구 메인
	@GetMapping("/main")
	public String baseball() {
		return "sports/baseball/common/main";
	}

	// 야구 페이지 구단별 team_tab class 처리
	@GetMapping("/{team}/{tab}")
	public String teamTab(@PathVariable String team, @PathVariable String tab, Model model) {
		model.addAttribute("activeTab", tab);
		return "sports/baseball/" + team + "/" + tab;
	}
	
	// 야구 전체일정
	@GetMapping("/schedule")
	public String schedule() {
		return "sports/baseball/common/schedule";
	}
}
