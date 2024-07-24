package com.spring.javaclassS8.controller.my.activity;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.event.EventService;
import com.spring.javaclassS8.vo.event.EventParticipationVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/my/activity")
public class ActivityController {

	@Autowired
	private EventService eventService;

	// 활동관리 > 참여 이벤트 뷰
	@GetMapping("/event")
	public String getEventPArticipations(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}

		List<EventParticipationVO> paritipations = eventService.getEventParticipations(loginMember.getId());
		model.addAttribute("paritipations", paritipations);

		return "my/activity/event";
	}

	// 마이페이지 quickMenuWrap > 응모한 이벤트 갯수 보여주기
	@GetMapping("/eventCount")
	@ResponseBody
	public int GetEventCount(HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return 0;
		}
		return eventService.getActiveEventCount(loginMember.getId());
	}
}