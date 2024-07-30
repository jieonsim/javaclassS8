package com.spring.javaclassS8.controller.my.reserve;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.my.reserve.MyReservationService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/my/reserve")
public class MyReservationController {

	@Autowired
	private MyReservationService myReservationService;

	// 마이페이지 > 예매확인 뷰
	@GetMapping("/list")
	public String getReservationList(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}

		Map<String, Object> result = myReservationService.getReservationListByMemberId(member.getId(), page);
		model.addAttribute("reservations", result.get("reservations"));
		model.addAttribute("paginationInfo", result.get("paginationInfo"));
		return "my/reserve/reserveList";
	}

	// 마이페이지 > quickMenuWrap > 오늘 날짜 기준 관람 가능한 나의 예매티켓 갯수 보여주기
	@GetMapping("/reservationCount")
	@ResponseBody
	public int GetEventCount(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return 0;
		}
		return myReservationService.getAvailableReservationCount(member.getId());
	}

	@GetMapping("/detail")
	public String getReservationDetail() {
		return "my/reserve/reserveDetail";
	}
}
