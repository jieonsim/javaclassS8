package com.spring.javaclassS8.controller.sports;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.sports.SportsService;
import com.spring.javaclassS8.utils.CaptchaGenerator;
import com.spring.javaclassS8.utils.DateTimeFormatUtils;
import com.spring.javaclassS8.vo.reserve.TempReservation;
import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

@Controller
@RequestMapping("/sports")
public class SportsController {

	@Autowired
	private SportsService sportsService;

	// 스포츠별 메인
	@GetMapping("/{sport}/main")
	public String main(@PathVariable String sport) {
		return "sports/" + sport + "/common/main";
	}

	// 캡챠 로딩
	@GetMapping("/reserve/captcha")
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
	@PostMapping("/reserve/verifyCaptcha")
	@ResponseBody
	public Map<String, Object> verifyCaptcha(@RequestParam("captcha") String captcha, HttpSession session) {
		String generatedCaptcha = (String) session.getAttribute("captchaText");

		Map<String, Object> result = new HashMap<>();
		if (generatedCaptcha != null && generatedCaptcha.equals(captcha.toUpperCase())) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}

		return result;
	}

	// 예매창 > 등급/좌석선택(depth1)
	@GetMapping("/reserve/seat")
	public String reserveDepth1(@RequestParam("gameId") int gameId, Model model) {
		GameVO game = sportsService.getGameById(gameId);

		// 날짜와 시간 포맷팅
		game.setGameDate(DateTimeFormatUtils.formatDate(game.getGameDate()));
		game.setGameTime(DateTimeFormatUtils.formatTime(game.getGameTime()));

		List<SeatInventoryVO> seatInventories = sportsService.getSeatInventoriesByGameId(gameId);
		int maxTicketsPerBooking = sportsService.getMaxTicketsPerBooking(game.getSportId());

		model.addAttribute("game", game);
		model.addAttribute("seatInventories", seatInventories);
		model.addAttribute("maxTicketsPerBooking", maxTicketsPerBooking);

		return "sports/reserve/seat";
	}

	@PostMapping("/reserve/saveTempReservation")
	public String saveTempReservation(@RequestParam int gameId, @RequestParam int seatId, @RequestParam int quantity, HttpSession session) {
		TempReservation tempReservation = new TempReservation(gameId, seatId, quantity, 1, // currentDepth
				System.currentTimeMillis() + 480000 // 현재 시간 + 8분
		);

		session.setAttribute("tempReservation", tempReservation);

		return "redirect:/sports/reserve/price";
	}

	// 예매창 > 권종/할인/매수선택(depth2)
	@GetMapping("/reserve/price")
	public String reserveDepth2(HttpSession session, Model model) {
		TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");
		if (tempReservation == null) {
			return "redirect:/sports/reserve/seat";
		}

		int gameId = tempReservation.getGameId();
		int seatId = tempReservation.getSeatId();
		int quantity = tempReservation.getQuantity();

		GameVO game = sportsService.getGameById(gameId);
		SportBookingPolicyVO bookingPolicy = sportsService.getBookingPolicyBySportId(game.getSportId());

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

		SeatVO seat = sportsService.getSeatById(seatId);
		//List<TicketTypeVO> ticketTypes = sportsService.getTicketTypesBySeatId(seatId);
		List<PriceVO> prices = sportsService.getPricesBySeatId(seatId);
		List<CategoryVO> categoryList = sportsService.getCategoriesWithRowspan(seatId);

		model.addAttribute("game", game);
		model.addAttribute("seat", seat);
		model.addAttribute("quantity", quantity);
		//model.addAttribute("ticketTypes", ticketTypes);
		model.addAttribute("prices", prices);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("bookingPolicy", bookingPolicy);
		model.addAttribute("gameDateTime", gameDateTime.format(displayFormatter));
		model.addAttribute("cancelDeadline", cancelDeadline.format(dateTimeFormatter));
		model.addAttribute("today", today.format(dateFormatter));
		model.addAttribute("tomorrow", today.plusDays(1).format(dateFormatter));
		model.addAttribute("cancelDeadlineDate", cancelDeadline.format(dateFormatter));

		return "sports/reserve/price";
	}

	// 예매창 > 예매확인(depth3)
	@GetMapping("/reserve/check")
	public String reserveDepth3() {
		return "sports/reserve/check";
	}

	// 예매창 > 스포츠 예매권(depth4)
	@GetMapping("/reserve/advanceTicket")
	public String reserveDepth4_advanceTicket() {
		return "sports/reserve/advanceTicket";
	}

	// 예매창 > 일반 결제(depth4)
	@GetMapping("/reserve/payment")
	public String reserveDepth4_payment() {
		return "sports/reserve/payment";
	}

	// 스포츠별 페이지 구단별 team_tab class 처리
	@GetMapping("/{sport}/{team}/{tab}")
	public String teamTab(@PathVariable String sport, @PathVariable String team, @PathVariable String tab, Model model) {
		model.addAttribute("activeTab", tab);
		return "sports/" + sport + "/" + team + "/" + tab;
	}

	// 스포츠별 전체일정
	@GetMapping("/{sport}/schedule")
	public String getSchedule(@PathVariable String sport, Model model) {
		LocalDate today = LocalDate.now();
		YearMonth currentMonth = YearMonth.from(today);
		List<GameVO> games = sportsService.getGamesFromToday(sport, today, currentMonth);
		model.addAttribute("games", games);
		model.addAttribute("currentYearMonth", today.format(DateTimeFormatter.ofPattern("yyyy.MM")));
		model.addAttribute("hasGames", !games.isEmpty());
		return "sports/" + sport + "/common/schedule";
	}

	// 스포츠 구단별 예매하기
	@GetMapping("/{sport}/{team}/reservation")
	public String reservation(@PathVariable String sport, @PathVariable("team") String team, Model model) {
		LocalDate today = LocalDate.now();
		YearMonth nextMonth = YearMonth.from(today).plusMonths(1);
		List<GameVO> games = sportsService.getTeamHomeGames(sport, team, today, nextMonth.atEndOfMonth());

		model.addAttribute("games", games);
		model.addAttribute("team", team);

		return "sports/" + sport + "/" + team + "/reservation";
	}

	// 스포츠 구단별 경기일정
	@GetMapping("/{sport}/{team}/schedule")
	public String schedule(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/schedule";
	}

	// 구단별 요금/할인카드
	@GetMapping("/{sport}/{team}/price")
	public String price(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/price";
	}

	// 구단별 좌석도
	@GetMapping("/{sport}/{team}/seat")
	public String seat(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/seat";
	}

	// 구단별 구단안내
	@GetMapping("/{sport}/{team}/info")
	public String info(@PathVariable String sport, @PathVariable("team") String team) {
		return "sports/" + sport + "/" + team + "/info";
	}
}
