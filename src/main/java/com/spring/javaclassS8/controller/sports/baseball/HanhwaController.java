package com.spring.javaclassS8.controller.sports.baseball;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/baseball/hanhwa")
public class HanhwaController {

	// 한화이글스 예매하기
	@GetMapping("/reservation")
	public String reservation() {
		return "sports/baseball/hanhwa/reservation";
	}

	// 한화이글스 경기일정
	@GetMapping("/schedule")
	public String schedule() {
		return "sports/baseball/hanhwa/schedule";
	}

	// 한화이글스 요금/할인카드
	@GetMapping("/price")
	public String price() {
		return "sports/baseball/hanhwa/price";
	}

	// 한화이글스 좌석도
	@GetMapping("/seat")
	public String seat() {
		return "sports/baseball/hanhwa/seat";
	}

	// 한화이글스 구단안내
	@GetMapping("/info")
	public String info() {
		return "sports/baseball/hanhwa/info";
	}
}
