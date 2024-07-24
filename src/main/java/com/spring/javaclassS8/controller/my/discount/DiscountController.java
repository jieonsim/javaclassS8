package com.spring.javaclassS8.controller.my.discount;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.my.discount.AdvanceTicketService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/my/discount")
public class DiscountController {

	@Autowired
	private AdvanceTicketService advanceTicketService;

	// 마이페이지 > 할인혜택 > 예매권 뷰
	@GetMapping("/advanceTicket")
	public String getAdvanceTicket(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/loing";
		}

		List<Map<String, Object>> advanceTickets = advanceTicketService.getAdvanceTicketsByMemberId(member.getId());
		model.addAttribute("advanceTickets", advanceTickets);
		return "my/discount/advanceTicket";
	}

	// 마이페이지 > 할인혜택 > 예매권 등록 시 예매권번호 유효성 검사
	@PostMapping("/validateAdvanceTicket")
	@ResponseBody
	public ResponseEntity<?> validateAdvanceTicket(@RequestBody Map<String, String> payload) {
		String advanceTicketNumber = payload.get("advanceTicketNumber");
		return ResponseEntity.ok(advanceTicketService.validateAdvanceTicket(advanceTicketNumber));
	}

	// 마이페이지 > 할인혜택 > 예매권 등록 처리
	@PostMapping("/registerAdvanceTicket")
	@ResponseBody
	public ResponseEntity<?> registerAdvanceTicket(@RequestBody Map<String, String> payload) {
		String advanceTicketNumber = payload.get("advanceTicketNumber");
		return ResponseEntity.ok(advanceTicketService.registerAdvanceTicket(advanceTicketNumber));
	}
}