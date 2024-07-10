package com.spring.javaclassS8.controller.sports.football;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/football/uhfc")
public class UhfcController {

	// uhfc 예매하기
	@GetMapping("/reservation")
	public String reservation() {
		return "sports/football/uhfc/reservation";
	}

	// uhfc 경기일정
	@GetMapping("/schedule")
	public String schedule() {
		return "sports/football/uhfc/schedule";
	}

	// uhfc 요금/할인카드
	@GetMapping("/price")
	public String price() {
		return "sports/football/uhfc/price";
	}

	// uhfc 좌석도
	@GetMapping("/seat")
	public String seat() {
		return "sports/football/uhfc/seat";
	}

	// uhfc 구단안내
	@GetMapping("/info")
	public String info() {
		return "sports/football/uhfc/info";
	}
}
