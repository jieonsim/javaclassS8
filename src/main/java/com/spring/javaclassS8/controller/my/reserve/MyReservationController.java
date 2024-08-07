package com.spring.javaclassS8.controller.my.reserve;

import java.util.HashMap;
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
	
	// 마이페이지 > 예매취소 뷰
	@GetMapping("/cancel/list")
	public String getReservationCancelList(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}
		
		Map<String, Object> result = myReservationService.getReservationCancelListByMemberId(member.getId(), page);
		model.addAttribute("reservations", result.get("reservations"));
		model.addAttribute("paginationInfo", result.get("paginationInfo"));
		return "my/reserve/cancel/cancelList";
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

	// 마이페이지 > 예매확인 > 예매디테일 뷰
	@GetMapping("/detail")
	public String getReservationDetail(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		model.addAttribute("advanceTickets", reservationInfo.get("advanceTickets"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		return "my/reserve/reserveDetail";
	}
	
	// 마이페이지 > 취소확인 > 취소디테일 뷰
	@GetMapping("/cancel/detail")
	public String getReservationCancelDetail(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		Map<String, Object> cancelInfo = myReservationService.getCancelInfo(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		model.addAttribute("cancelInfo", cancelInfo);
		return "my/reserve/cancel/cancelDetail";
	}

	// 마이페이지 > 예매확인 > 예매디테일 > 내역 프린트
	@GetMapping("/print")
	public String getReservationPrint(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		return "my/reserve/print";
	}
	
	// 마이페이지 > 예매확인 > 예매디테일 > 내역 프린트
	@GetMapping("/cancel/print")
	public String getReservationCancelPrint(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("reservationDetails", reservationInfo.get("reservationDetails"));
		return "my/reserve/cancel/print";
	}

	// 마이페이지 > 예매확인 > 예매디테일 > 취소하기 컨펌 뷰
	@GetMapping("/cancel/confirm")
	public String getCancelConfirm(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		Map<String, Object> cancelInfo = myReservationService.getCancelInfo(reservationId);

		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("advanceTicketPrices", reservationInfo.get("advanceTicketPrices"));
		model.addAttribute("cancelInfo", cancelInfo);
		return "my/reserve/cancel/confirm";
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

	// 마이페이지 > 예매확인 > 예매디테일 > 취소 완료 뷰
	@GetMapping("/cancel/completed")
	public String getCancelCompleted(@RequestParam("reservationId") int reservationId, Model model) {
		Map<String, Object> reservationInfo = myReservationService.getReservationDetail(reservationId);
		Map<String, Object> cancelInfo = myReservationService.getCancelInfo(reservationId);
		model.addAttribute("reservation", reservationInfo.get("reservation"));
		model.addAttribute("cancelInfo", cancelInfo);
		return "my/reserve/cancel/completed";
	}
}
