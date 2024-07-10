package com.spring.javaclassS8.controller.sports.baseball;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sports/baseball/lg")
public class LGController {

	// LG트윈스 예매하기
	@GetMapping("/reservation")
	public String reservation() {
		return "sports/baseball/lg/reservation";
	}

	// LG트윈스 경기일정
	@GetMapping("/schedule")
	public String schedule() {
		return "sports/baseball/lg/schedule";
	}

	// LG트윈스 요금/할인카드
	@GetMapping("/price")
	public String price() {
		return "sports/baseball/lg/price";
	}

	// LG트윈스 좌석도
	@GetMapping("/seat")
	public String seat() {
		return "sports/baseball/lg/seat";
	}

	// LG트윈스 구단안내
	@GetMapping("/info")
	public String info() {
		return "sports/baseball/lg/info";
	}
}
