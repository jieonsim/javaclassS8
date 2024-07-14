package com.spring.javaclassS8.controller.event;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.event.EventService;
import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private EventService eventService;

	// 이벤트 메인 화면
	@GetMapping("/main")
	public String getEventMain(Model model) {
		List<EventVO> ongoingEvents = eventService.getOngoingEvents();
		model.addAttribute("events", ongoingEvents);
		return "event/main";
	}

	// 이벤트 컨텐츠 디테일
	@GetMapping("/contentDetail")
	public String getEventContentDetail(@RequestParam("id") int id, Model model) {
	    EventVO event = eventService.getEventById(id);
	    List<EventCommentVO> eventComments = eventService.getEventComments(id);
	    int commentCount = eventComments.size();

	    model.addAttribute("event", event);
	    model.addAttribute("eventComments", eventComments);
	    model.addAttribute("commentCount", commentCount);
	    model.addAttribute("newLine", "\n");
	    return "event/contentDetail";
	}

	// 이벤트 응모 여부 확인
	@GetMapping("/checkParticipation")
	@ResponseBody
	public Map<String, Boolean> checkParticipation(@RequestParam("eventId") int eventId, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		boolean hasParticipated = eventService.hasParticipated(eventId, member.getId());
		return Collections.singletonMap("hasParticipated", hasParticipated);
	}

	// 이벤트 댓글달기 및 응모 처리
	@PostMapping("/insertEventComment")
	@ResponseBody
	public Map<String, Object> insertEventComment(@RequestParam("eventId") int eventId, @RequestParam("comment") String comment, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		Map<String, Object> result = new HashMap<>();

		try {
			boolean success = eventService.insertEventCommentAndParticipate(eventId, member.getId(), comment);
			result.put("success", success);
			if (!success) {
				result.put("alreadyParticipated", true);
			}
		} catch (Exception e) {
			result.put("success", false);
			result.put("error", "서버 오류가 발생했습니다.");
			e.printStackTrace();
		}

		return result;
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
