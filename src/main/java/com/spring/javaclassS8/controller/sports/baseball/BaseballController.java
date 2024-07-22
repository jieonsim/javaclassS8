package com.spring.javaclassS8.controller.sports.baseball;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaclassS8.service.sports.baseball.BaseballService;
import com.spring.javaclassS8.vo.sports.GameVO;

@Controller
@RequestMapping("/sports/baseball")
public class BaseballController {

	@Autowired
	private BaseballService baseballService;

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
	public String getSchedule(Model model) {
		LocalDate today = LocalDate.now();
		YearMonth currentMonth = YearMonth.from(today);
		List<GameVO> games = baseballService.getBaseballGamesFromToday(today, currentMonth);
		model.addAttribute("games", games);
		model.addAttribute("currentYearMonth", today.format(DateTimeFormatter.ofPattern("yyyy.MM")));
		model.addAttribute("hasGames", !games.isEmpty());
		return "sports/baseball/common/schedule";
	}

	// 구단별 예매하기
	@GetMapping("/{team}/reservation")
	public String reservation(@PathVariable("team") String team, Model model) {
		LocalDate today = LocalDate.now();
		YearMonth nextMonth = YearMonth.from(today).plusMonths(1);
		List<GameVO> games = baseballService.getTeamHomeGames(team, today, nextMonth.atEndOfMonth());

		model.addAttribute("games", games);
		model.addAttribute("team", team);
		
		return "sports/baseball/" + team + "/reservation";
	}

	// 구단별 경기일정
	@GetMapping("/{team}/schedule")
	public String schedule(@PathVariable("team") String team) {
		return "sports/baseball/" + team + "/schedule";
	}

	// 구단별 요금/할인카드
	@GetMapping("/{team}/price")
	public String price(@PathVariable("team") String team) {
		return "sports/baseball/" + team + "/price";
	}

	// 구단별 좌석도
	@GetMapping("/{team}/seat")
	public String seat(@PathVariable("team") String team) {
		return "sports/baseball/" + team + "/seat";
	}

	// 구단별 구단안내
	@GetMapping("/{team}/info")
	public String info(@PathVariable("team") String team) {
		return "sports/baseball/" + team + "/info";
	}
}
