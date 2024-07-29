package com.spring.javaclassS8.controller.reserve;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.my.discount.AdvanceTicketService;
import com.spring.javaclassS8.service.reserve.ReservationService;
import com.spring.javaclassS8.utils.CaptchaGenerator;
import com.spring.javaclassS8.utils.DateTimeFormatUtils;
import com.spring.javaclassS8.vo.member.MemberVO;
import com.spring.javaclassS8.vo.reserve.ReservationRequest;
import com.spring.javaclassS8.vo.reserve.ReservationResponse;
import com.spring.javaclassS8.vo.reserve.SeatDetailVO;
import com.spring.javaclassS8.vo.reserve.TempReservation;
import com.spring.javaclassS8.vo.reserve.TicketVO;
import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

@Controller
@RequestMapping("/reserve")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private AdvanceTicketService advanceTicketService;

	// 캡챠 로딩
	@GetMapping("/captcha")
	@ResponseBody
	public Map<String, Object> getCaptcha(HttpServletRequest request, HttpSession session) throws IOException {
		String captchaText = CaptchaGenerator.generateCaptchaText();
		session.setAttribute("captchaText", captchaText);

		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/sports/");
		String fileName = UUID.randomUUID().toString() + ".jpg";
		String filePath = realPath + "/" + fileName;
		CaptchaGenerator.generateCaptchaImage(captchaText, filePath);

		Map<String, Object> result = new HashMap<>();
		result.put("captchaUrl", request.getContextPath() + "/resources/data/sports/" + fileName + "?timestamp=" + System.currentTimeMillis());
		return result;
	}

	// 캡챠 인증
	@PostMapping("/verifyCaptcha")
	@ResponseBody
	public Map<String, Object> verifyCaptcha(@RequestParam("captcha") String captcha, @RequestParam("gameId") int gameId, HttpSession session) {
		String generatedCaptcha = (String) session.getAttribute("captchaText");

		Map<String, Object> result = new HashMap<>();
		if (generatedCaptcha != null && generatedCaptcha.equals(captcha.toUpperCase())) {
			result.put("success", true);
			// 캡챠 인증 성공 시 해당 게임에 대한 인증 상태를 세션에 저장
			session.setAttribute("captchaVerified_" + gameId, true);
		} else {
			result.put("success", false);
		}

		return result;
	}

	// 예매창 > 등급/좌석선택(depth1)
	@GetMapping("/seat")
	public String reserveSeat(@RequestParam("gameId") int gameId, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}

		GameVO game = reservationService.getGameById(gameId);

		// 날짜와 시간 포맷팅
		game.setGameDate(DateTimeFormatUtils.formatDate(game.getGameDate()));
		game.setGameTime(DateTimeFormatUtils.formatTime(game.getGameTime()));

		List<SeatInventoryVO> seatInventories = reservationService.getSeatInventoriesByGameId(gameId);
		int maxTicketsPerBooking = reservationService.getMaxTicketsPerBooking(game.getSportId());

		model.addAttribute("gameId", gameId);
		model.addAttribute("game", game);
		model.addAttribute("seatInventories", seatInventories);
		model.addAttribute("maxTicketsPerBooking", maxTicketsPerBooking);

		// 캡챠 인증 여부 확인
		Boolean captchaVerified = (Boolean) session.getAttribute("captchaVerified_" + gameId);
		model.addAttribute("captchaVerified", captchaVerified != null && captchaVerified);

		// 세션에서 캡챠 인증 상태 제거
		session.removeAttribute("captchaVerified_" + gameId);

		return "reserve/seat";
	}

	// depth1의 세션 저장
	@PostMapping("/saveTempReservation")
	public String saveTempReservation(@RequestParam int gameId, @RequestParam int seatId, @RequestParam int ticketAmount, HttpSession session) {
		TempReservation tempReservation = new TempReservation(gameId, seatId, ticketAmount, 1, // currentDepth
				System.currentTimeMillis() + 480000 // 현재 시간 + 8분
		);

		session.setAttribute("tempReservation", tempReservation);

		return "redirect:/reserve/price";
	}

	// 예매창 > 권종/할인/매수선택(depth2)
	@GetMapping("/price")
	public String reservePrice(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}

		TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
		if (tempReservation == null) {
			return "redirect:/reserve/seat";
		}

		int gameId = tempReservation.getGameId();
		int seatId = tempReservation.getSeatId();
		int ticketAmount = tempReservation.getTicketAmount();

		GameVO game = reservationService.getGameById(gameId);
		SportBookingPolicyVO bookingPolicy = reservationService.getBookingPolicyBySportId(game.getSportId());

		// gameDate와 gameTime을 LocalDateTime으로 변환
		LocalDate gameDateLocal = LocalDate.parse(game.getGameDate());
		LocalTime gameTimeLocal = LocalTime.parse(game.getGameTime());
		LocalDateTime gameDateTime = LocalDateTime.of(gameDateLocal, gameTimeLocal);

		// 취소 기한 계산
		LocalDateTime cancelDeadline = gameDateTime.minusMinutes(bookingPolicy.getCancellationDeadlineMinutesBeforeStart());

		// 현재 날짜 (예매일)
		LocalDate today = LocalDate.now();

		// 날짜 포맷터
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
		DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E) HH:mm");

		// 좌석 / 요금 / 권종
		SeatVO seat = reservationService.getSeatById(seatId);
		List<PriceVO> prices = reservationService.getPricesBySeatId(seatId);
		List<CategoryVO> categoryList = reservationService.getCategoriesWithRowspan(seatId);

		// 스포츠 예매권
		List<Map<String, Object>> advanceTickets = reservationService.getValidAdvanceTicketsByMemberId(member.getId());

		model.addAttribute("tempReservation", tempReservation);
		model.addAttribute("game", game);
		model.addAttribute("seat", seat);
		model.addAttribute("ticketAmount", ticketAmount);
		model.addAttribute("prices", prices);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("advanceTickets", advanceTickets);
		model.addAttribute("bookingPolicy", bookingPolicy);
		model.addAttribute("gameDateTime", gameDateTime.format(displayFormatter));
		model.addAttribute("cancelDeadline", cancelDeadline.format(dateTimeFormatter));
		model.addAttribute("today", today.format(dateFormatter));
		model.addAttribute("tomorrow", today.plusDays(1).format(dateFormatter));
		model.addAttribute("cancelDeadlineDate", cancelDeadline.format(dateFormatter));

		return "reserve/price";
	}

	// depth2 > 스포츠 예매권 등록 시 예매권 유효성 검사
	@PostMapping("/validateAdvanceTicket")
	@ResponseBody
	public ResponseEntity<?> validateAdvanceTicket(@RequestBody Map<String, String> payload) {
		String advanceTicketNumber = payload.get("advanceTicketNumber");
		return ResponseEntity.ok(advanceTicketService.validateAdvanceTicket(advanceTicketNumber));
	}
	
	
	// depth2 > 스포츠 예매권 신규 등록
	@PostMapping("/registerAdvanceTicket")
	@ResponseBody
	public ResponseEntity<?> registerAdvanceTicket(@RequestBody Map<String, String> payload) {
	    String advanceTicketNumber = payload.get("advanceTicketNumber");
	    Map<String, Object> result = advanceTicketService.registerAdvanceTicket(advanceTicketNumber);
	    
	    return ResponseEntity.ok(result);
	}

	// depth2의 세션 저장
	@PostMapping("/saveTicketSelection")
	@ResponseBody
	public ResponseEntity<?> saveTicketSelection(@RequestBody Map<String, Object> ticketSelectionData, HttpSession session) {
	    try {
	        TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
	        if (tempReservation == null) {
	            return ResponseEntity.badRequest().body("{\"error\": \"예약 정보가 없습니다.\"}");
	        }

	        @SuppressWarnings("unchecked")
			List<Map<String, Object>> ticketsData = (List<Map<String, Object>>) ticketSelectionData.get("tickets");
	        List<TicketVO> selectedTickets = new ArrayList<>();

	        int totalSelectedTickets = 0;
	        for (Map<String, Object> ticketData : ticketsData) {
	            TicketVO ticket = new TicketVO();
	            ticket.setType((String) ticketData.get("type"));
	            ticket.setQuantity((Integer) ticketData.get("quantity"));
	            ticket.setPrice((Integer) ticketData.get("price"));
	            ticket.setTicketTypeId((Integer) ticketData.get("ticketTypeId"));
	            selectedTickets.add(ticket);
	            totalSelectedTickets += ticket.getQuantity();
	        }

	        if (totalSelectedTickets == 0) {
	            return ResponseEntity.badRequest().body("{\"error\": \"티켓종류 및 매수를 선택해주세요.\"}");
	        }

	        @SuppressWarnings("unchecked")
			List<Map<String, Object>> selectedAdvanceTicketsData = (List<Map<String, Object>>) ticketSelectionData.get("selectedAdvanceTickets");
	        List<String> selectedAdvanceTickets = new ArrayList<>();
	        List<Integer> advanceTicketIds = new ArrayList<>();
	        
	        if (selectedAdvanceTicketsData != null) {
	            for (Map<String, Object> ticket : selectedAdvanceTicketsData) {
	                String number = (String) ticket.get("number");
	                Object idObj = ticket.get("id");
	                
	                if (number != null && idObj != null) {
	                    try {
	                        Integer id = Integer.parseInt(idObj.toString());
	                        selectedAdvanceTickets.add(number);
	                        advanceTicketIds.add(id);
	                    } catch (NumberFormatException e) {
	                        // 로그 출력
	                        System.out.println("Invalid id format for ticket: " + number);
	                        // 오류 발생 시 해당 티켓은 건너뛰기
	                    }
	                } else {
	                    // number나 id가 null인 경우 로그 출력
	                    System.out.println("Incomplete ticket data: " + ticket);
	                }
	            }
	        }

	        boolean hasAdvanceTicket = selectedTickets.stream().anyMatch(ticket -> "ADVANCE_TICKET".equals(ticket.getType()));
	        int totalAdvanceTicketQuantity = selectedTickets.stream()
	            .filter(ticket -> "ADVANCE_TICKET".equals(ticket.getType()))
	            .mapToInt(TicketVO::getQuantity)
	            .sum();

	        if (hasAdvanceTicket && selectedAdvanceTickets.size() != totalAdvanceTicketQuantity) {
	            return ResponseEntity.badRequest().body("{\"error\": \"스포츠 예매권 등록 및 선택 후 예매가 가능합니다.\"}");
	        }

	        // 세션 업데이트
	        tempReservation.setSelectedTickets(selectedTickets);
	        tempReservation.setSelectedAdvanceTickets(selectedAdvanceTickets);
	        tempReservation.setAdvanceTicketIds(advanceTicketIds);
	        tempReservation.setCurrentDepth(2);
	        session.setAttribute("tempReservation", tempReservation);

	        return ResponseEntity.ok()
	                .contentType(new MediaType(MediaType.APPLICATION_JSON, StandardCharsets.UTF_8))
	                .body(Map.of("success", true, "message", "티켓 선택이 저장되었습니다."));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.badRequest()
	                .contentType(new MediaType(MediaType.APPLICATION_JSON, StandardCharsets.UTF_8))
	                .body(Map.of("error", "티켓 선택을 저장하는 중 오류가 발생했습니다."));
	    }
	}

	// depth3 최종 확인 및 취소 정책 동의
	@GetMapping("/confirm")
	public String reserveConfirm(Model model, HttpSession session) {
		TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
		if (tempReservation == null || tempReservation.getCurrentDepth() != 2) {
			return "redirect:/reserve/seat?gameId=" + tempReservation.getGameId();
		}

		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}

		int gameId = tempReservation.getGameId();
		int seatId = tempReservation.getSeatId();
		int ticketAmount = tempReservation.getTicketAmount();

		GameVO game = reservationService.getGameById(gameId);
		SportBookingPolicyVO bookingPolicy = reservationService.getBookingPolicyBySportId(game.getSportId());

		// gameDate와 gameTime을 LocalDateTime으로 변환
		LocalDate gameDateLocal = LocalDate.parse(game.getGameDate());
		LocalTime gameTimeLocal = LocalTime.parse(game.getGameTime());
		LocalDateTime gameDateTime = LocalDateTime.of(gameDateLocal, gameTimeLocal);

		// 취소 기한 계산
		LocalDateTime cancelDeadline = gameDateTime.minusMinutes(bookingPolicy.getCancellationDeadlineMinutesBeforeStart());

		// 현재 날짜 (예매일)
		LocalDate today = LocalDate.now();

		// 날짜 포맷터
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
		DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E) HH:mm");

		// 좌석
		SeatVO seat = reservationService.getSeatById(seatId);

		// 티켓 정보 추가
		int ticketPrice = calculateTicketPrice(tempReservation.getSelectedTickets());
		int bookingFee = calculateBookingFee(tempReservation.getSelectedTickets(), bookingPolicy);
		int totalAmount = ticketPrice + bookingFee;

		model.addAttribute("reservation", tempReservation);
		model.addAttribute("member", member);
		model.addAttribute("game", game);
		model.addAttribute("seat", seat);
		model.addAttribute("ticketAmount", ticketAmount);
		model.addAttribute("bookingPolicy", bookingPolicy);
		model.addAttribute("gameDateTime", gameDateTime.format(displayFormatter));
		model.addAttribute("cancelDeadline", cancelDeadline.format(dateTimeFormatter));
		model.addAttribute("today", today.format(dateFormatter));
		model.addAttribute("tomorrow", today.plusDays(1).format(dateFormatter));
		model.addAttribute("cancelDeadlineDate", cancelDeadline.format(dateFormatter));
		model.addAttribute("ticketPrice", ticketPrice);
		model.addAttribute("bookingFee", bookingFee);
		model.addAttribute("totalAmount", totalAmount);
		
		// 현재 depth 세션 저장
		tempReservation.setCurrentDepth(3);

		return "reserve/confirm";
	}
	
	// 결제 및 예매 요청
	@PostMapping("/paymentAndReserve")
	@ResponseBody
	public ResponseEntity<?> paymentAndReserve(@RequestBody ReservationRequest request, HttpSession session) {
		try {
			GameVO game = reservationService.getGameById(request.getGameId());
			request.setSportId(game.getSportId());
			request.setTeamId(game.getHomeTeamId());
			request.setVenueId(game.getVenueId());

			ReservationResponse response = reservationService.processReservation(request);

			TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
			if (tempReservation != null) {
				tempReservation.setTotalAmount(response.getTotalAmount());
				tempReservation.setBookingFee(response.getBookingFee());
				session.setAttribute("tempReservation", tempReservation);
			}

			return ResponseEntity.ok(Map.of("success", response.isSuccess(), "reservationNumber", response.getReservationNumber(), "message", response.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "예약 처리 중 오류가 발생했습니다: " + e.getMessage()));
		}
	}

	// 예매 완료 뷰
	@GetMapping("/completed")
	public String reserveCompleted(@RequestParam String reservationNumber, Model model, HttpSession session) {
		TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		if (tempReservation == null || member == null) {
			return "redirect:/reserve/error";
		}
		
		int gameId = tempReservation.getGameId();
		int seatId = tempReservation.getSeatId();
		int ticketAmount = tempReservation.getTicketAmount();
		
		GameVO game = reservationService.getGameById(gameId);
		SportBookingPolicyVO bookingPolicy = reservationService.getBookingPolicyBySportId(game.getSportId());
		
		// 경기일시
		LocalDate gameDateLocal = LocalDate.parse(game.getGameDate());
		LocalTime gameTimeLocal = LocalTime.parse(game.getGameTime());
		LocalDateTime gameDateTime = LocalDateTime.of(gameDateLocal, gameTimeLocal);
		DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E) HH:mm");
		
		// 좌석
		SeatVO seat = reservationService.getSeatById(seatId);
		List<SeatDetailVO> seatDetails = tempReservation.getSeatDetails();
		
		// 요금
		int ticketPrice = calculateTicketPrice(tempReservation.getSelectedTickets());
		int bookingFee = calculateBookingFee(tempReservation.getSelectedTickets(), bookingPolicy);
		int totalAmount = ticketPrice + bookingFee;
		
		model.addAttribute("reservationNumber", reservationNumber);
		model.addAttribute("member", member);
		model.addAttribute("game", game);
		model.addAttribute("seat", seat);
		model.addAttribute("seatDetails", seatDetails);
		model.addAttribute("ticketAmount", ticketAmount);
		model.addAttribute("bookingPolicy", bookingPolicy);
		model.addAttribute("gameDateTime", gameDateTime.format(displayFormatter));
		model.addAttribute("ticketPrice", ticketPrice);
		model.addAttribute("bookingFee", bookingFee);
		model.addAttribute("totalAmount", totalAmount);

		// 예매 완료 후 세션에서 임시 예매 정보 제거
		session.removeAttribute("tempReservation");

		return "reserve/completed";
	}

	// 티켓 요금 계산
	private int calculateTicketPrice(List<TicketVO> selectedTickets) {
		return selectedTickets.stream().filter(ticket -> !"ADVANCE_TICKET".equals(ticket.getType())).mapToInt(ticket -> ticket.getPrice() * ticket.getQuantity()).sum();
	}

	// 예매 수수료 계산
	private int calculateBookingFee(List<TicketVO> selectedTickets, SportBookingPolicyVO bookingPolicy) {
		int totalQuantity = selectedTickets.stream().filter(ticket -> !"ADVANCE_TICKET".equals(ticket.getType())).mapToInt(TicketVO::getQuantity).sum();
		return bookingPolicy.getBookingFeePerTicket() * totalQuantity;
	}

	@GetMapping("/error")
	public String error() {
		return "reserve/error";
	}
}
