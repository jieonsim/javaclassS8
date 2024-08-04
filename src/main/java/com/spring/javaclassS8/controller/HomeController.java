package com.spring.javaclassS8.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.reserve.ReservationService;
import com.spring.javaclassS8.vo.sports.GameVO;

@Controller
public class HomeController {

	@Autowired
	private ReservationService reservationService;

	@GetMapping("/")
	public String home(Model model) {
		List<GameVO> baseballGames = reservationService.getUpcomingGames("야구");
		List<GameVO> footballGames = reservationService.getUpcomingGames("축구");
		model.addAttribute("baseballGames", baseballGames);
		model.addAttribute("footballGames", footballGames);
		return "home";
	}

	@GetMapping("/getGames")
	@ResponseBody
	public List<GameVO> getGames(@RequestParam String sport) {
		return reservationService.getUpcomingGames(sport);
	}
}
