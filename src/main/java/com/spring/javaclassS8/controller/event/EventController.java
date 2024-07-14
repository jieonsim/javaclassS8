package com.spring.javaclassS8.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaclassS8.service.event.EventService;
import com.spring.javaclassS8.vo.event.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService eventService;

	// 이벤트 메인 화면, 전체 이벤트 목록 가져오기
	@GetMapping("/main")
	public String getEventMain(Model model) {
		List<EventVO> events = eventService.getAllEvents();
		model.addAttribute("events", events);
		return "event/main";
	}

	// 이벤트 컨텐츠 디테일
	@GetMapping("/contentDetail")
	public String getEventContentDetail(@RequestParam("id") int id, Model model) {
		EventVO event = eventService.getEventId(id);
		model.addAttribute("event", event);
		model.addAttribute("newLine", "\n");
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
