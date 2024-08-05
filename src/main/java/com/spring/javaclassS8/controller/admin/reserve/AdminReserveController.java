package com.spring.javaclassS8.controller.admin.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.admin.reserve.AdminReserveService;
import com.spring.javaclassS8.service.my.reserve.MyReservationService;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketInfoVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Controller
@RequestMapping("/admin/reserve")
public class AdminReserveController {

	@Autowired
	private AdminReserveService adminReserveService;

	@Autowired
	private MyReservationService myReservationService;

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

	// 예매 리스트
	@GetMapping("/reservationList")
	public String getReservationList(Model model) {
		List<ReservationVO> reservations = adminReserveService.getAllReservations();
		model.addAttribute("reservations", reservations);
		return "admin/reserve/reservationList";
	}

	// 예매 디테일
	@GetMapping("/reservationDetail")
	public String getReservationDetail(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		model.addAttribute("advanceTickets", reservationInfo.get("advanceTickets"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		return "admin/reserve/reservationDetail";
	}

	// 취소 디테일 리스트
	@GetMapping("/cancel/cancelDetail")
	public String getCancelDetail(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		Map<String, Object> cancelInfo = myReservationService.getCancelInfo(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		model.addAttribute("cancelInfo", cancelInfo);
		return "admin/reserve/cancel/cancelDetail";
	}
	
	// 마이페이지 > 예매확인 > 예매디테일 > 취소하기 컨펌 뷰
	@GetMapping("/cancel/confirm")
	public String getCancelConfirm(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		Map<String, Object> cancelInfo = myReservationService.getCancelInfo(reservationId);

		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		model.addAttribute("cancelInfo", cancelInfo);
		return "admin/reserve/cancel/confirm";
	}
	
	// 예매 취소 처리
	@PostMapping("/cancel")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> cancelReservation(@RequestBody Map<String, Integer> payload) {
		int reservationId = payload.get("reservationId");
		Map<String, Object> response = new HashMap<>();

		try {
			myReservationService.cancelReservation(reservationId);
			response.put("success", true);
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 예매권 발행 리스트
	@GetMapping("/advanceTicket/advanceTicketList")
	public String getAdvanceTicketList(Model model) {
		List<AdvanceTicketInfoVO> advanceTickets = adminReserveService.getAdvanceTicketList();
		model.addAttribute("advanceTickets", advanceTickets);
		return "admin/reserve/advanceTicket/advanceTicketList";
	}
}
