package com.spring.javaclassS8.controller.sports;

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

import com.spring.javaclassS8.service.sports.SportsService;
import com.spring.javaclassS8.vo.sports.GameVO;

@Controller
@RequestMapping("/sports")
public class SportsController {

	@Autowired
	private SportsService sportsService;

	// 스포츠별 메인
	@GetMapping("/{sport}/main")
	public String main(@PathVariable String sport) {
		return "sports/" + sport + "/common/main";
	}

	// 스포츠별 예매창
	@GetMapping("/{sport}/reserve")
	public String baseballreserve(@PathVariable String sport) {
		return "sports/" + sport + "/common/reserve";
	}

	// 스포츠별 페이지 구단별 team_tab class 처리
	@GetMapping("/{sport}/{team}/{tab}")
	public String teamTab(@PathVariable String sport, @PathVariable String team, @PathVariable String tab, Model model) {
		model.addAttribute("activeTab", tab);
		return "sports/" + sport + "/" + team + "/" + tab;
	}

	// 스포츠별 전체일정
	@GetMapping("/{sport}/schedule")
	public String getSchedule(@PathVariable String sport, Model model) {
		LocalDate today = LocalDate.now();
		YearMonth currentMonth = YearMonth.from(today);
		List<GameVO> games = sportsService.getGamesFromToday(sport, today, currentMonth);
		model.addAttribute("games", games);
		model.addAttribute("currentYearMonth", today.format(DateTimeFormatter.ofPattern("yyyy.MM")));
		model.addAttribute("hasGames", !games.isEmpty());
		return "sports/" + sport + "/common/schedule";
	}

	// 스포츠 구단별 예매하기
	@GetMapping("/{sport}/{team}/reservation")
	public String reservation(@PathVariable String sport, @PathVariable("team") String team, Model model) {
		LocalDate today = LocalDate.now();
		YearMonth nextMonth = YearMonth.from(today).plusMonths(1);
		List<GameVO> games = sportsService.getTeamHomeGames(sport, team, today, nextMonth.atEndOfMonth());

		model.addAttribute("games", games);
		model.addAttribute("team", team);

		return "sports/" + sport + "/" + team + "/reservation";
	}

	// 스포츠 구단별 경기일정
	@GetMapping("/{sport}/{team}/schedule")
	public String schedule(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/schedule";
	}

	// 구단별 요금/할인카드
	@GetMapping("/{sport}/{team}/price")
	public String price(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/price";
	}

	// 구단별 좌석도
	@GetMapping("/{sport}/{team}/seat")
	public String seat(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/seat";
	}

	// 구단별 구단안내
	@GetMapping("/{sport}/{team}/info")
	public String info(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/info";
	}
}
