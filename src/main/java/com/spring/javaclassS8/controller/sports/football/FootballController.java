package com.spring.javaclassS8.controller.sports.football;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/football")
public class FootballController {

	// 축구 메인
	@GetMapping("/main")
	public String football() {
		return "sports/football/common/main";
	}

	// 축구 페이지 구단별 team_tab class 처리
	@GetMapping("/{team}/{tab}")
	public String teamTab(@PathVariable String team, @PathVariable String tab, Model model) {
		model.addAttribute("activeTab", tab);
		return "sports/football/" + team + "/" + tab;
	}
	
	// 축구 전체일정
	@GetMapping("/schedule")
	public String schedule() {
		return "sports/football/common/schedule";
	}
}
