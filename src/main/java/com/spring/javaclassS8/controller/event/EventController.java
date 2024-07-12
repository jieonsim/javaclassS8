package com.spring.javaclassS8.controller.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event")
public class EventController {

	// 이벤트 메인
	@GetMapping("/main")
	public String getEventMain() {
		return "event/main";
	}

	// 이벤트 컨텐츠 디테일
	@GetMapping("/contentDetail")
	public String getEventContentDetail() {
		return "event/contentDetail";
	}

	// 이벤트 당첨자 발표
	@GetMapping("/winner")
	public String getEventWinner() {
		return "event/winner";
	}

	// 이벤트 당첨자 발표 디테일
	@GetMapping("/winnerDetail")
	public String getEventWinnerDetail() {
		return "event/winnerDetail";
	}
}
