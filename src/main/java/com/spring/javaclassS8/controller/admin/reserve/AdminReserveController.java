package com.spring.javaclassS8.controller.admin.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaclassS8.service.admin.reserve.AdminReserveService;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;

@Controller
@RequestMapping("/admin/reservation")
public class AdminReserveController {

	@Autowired
	private AdminReserveService adminReserveService;

	// 예매권 발행하기
	@GetMapping("/advanceTicket/issuing")
	public String getAdvanaceTicketIssuing() {
		return "admin/reserve/advanceTicket/issuing";
	}

	// 예매권 발행하기 처리
	@PostMapping("/advanceTicket/issuing")
	public ResponseEntity<Map<String, Object>> issueAdvanceTickets(@RequestBody Map<String, Integer> request) {
		int quantity = request.get("quantity");
		List<AdvanceTicketVO> newTickets = adminReserveService.issueAdvanceTickets(quantity);

		Map<String, Object> response = new HashMap<>();
		response.put("success", true);
		response.put("newTickets", newTickets);

		return ResponseEntity.ok(response);

	}
}
