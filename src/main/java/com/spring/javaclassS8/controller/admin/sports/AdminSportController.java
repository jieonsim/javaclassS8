package com.spring.javaclassS8.controller.admin.sports;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.admin.sports.AdminSportSerivce;
import com.spring.javaclassS8.utils.PaginationInfo;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.TicketTypeVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

@Controller
@RequestMapping("/admin/sports")
public class AdminSportController {

	@Autowired
	private AdminSportSerivce adminSportService;

	// 스포츠 종목 + 팀 + 경기장 등록 폼
	@GetMapping("/sportRegister")
	public String sportTeamVenueRegisterForm(Model model, @RequestParam(required = false) String selectedSport, @RequestParam(required = false) String selectedTeam) {
		List<String> sports = adminSportService.getAllSports();
		List<TeamVO> teams = adminSportService.getAllTeamsWithSports();

		model.addAttribute("sports", sports);
		model.addAttribute("selectedSport", selectedSport);
		model.addAttribute("teams", teams);
		model.addAttribute("selectedTeam", selectedTeam);
		return "admin/sports/sportRegister";
	}

	// 스포츠 종목 등록 처리
	@PostMapping("/sportRegister")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registerSport(@RequestBody Map<String, String> payload) {
		Map<String, Object> response = new HashMap<>();

		try {
			String sportName = payload.get("sportName");
			boolean result = adminSportService.registerSport(sportName);
			if (result) {
				response.put("success", true);
				response.put("message", "스포츠가 성공적으로 등록되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "스포츠 등록에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	// 스포츠 팀 등록 처리
	@PostMapping("/team/teamRegister")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registerTeam(@RequestBody Map<String, String> payload) {
		Map<String, Object> response = new HashMap<>();

		try {
			String sportName = payload.get("sportName");
			String teamName = payload.get("teamName");
			String shortName = payload.get("shortName");
			boolean result = adminSportService.registerTeam(sportName, teamName, shortName);
			if (result) {
				response.put("success", true);
				response.put("message", "스포츠 팀이 성공적으로 등록되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "스포츠 팀 등록에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	// 스포츠 경기장 등록 처리
	@PostMapping("/venue/venueRegister")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registerVenue(@RequestBody Map<String, String> payload) {
		Map<String, Object> response = new HashMap<>();

		try {
			String sportName = payload.get("sportName");
			String teamName = payload.get("teamName");
			String venueName = payload.get("venueName");
			String address = payload.get("address");
			String capacity = payload.get("capacity");
			boolean result = adminSportService.registerVenue(sportName, teamName, venueName, address, capacity);
			if (result) {
				response.put("success", true);
				response.put("message", "경기장이 성공적으로 등록되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "경기장 등록에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	// 스포츠 종목 + 팀 + 경기장 리스트
	@GetMapping("/sportList")
	public String sportTeamVenueList(Model model) {
		List<SportVO> sports = adminSportService.getAllSportsDetails();
		List<TeamVO> teams = adminSportService.getAllTeamsDetails();
		List<VenueVO> venues = adminSportService.getAllVenuesDetails();
		
	    Map<Integer, Boolean> sportHasGames = new HashMap<>();
	    Map<Integer, Boolean> teamHasGames = new HashMap<>();
	    Map<Integer, Boolean> venueHasGames = new HashMap<>();

	    for (SportVO sport : sports) {
	        sportHasGames.put(sport.getId(), adminSportService.hasGames("sport", sport.getId()));
	    }
	    for (TeamVO team : teams) {
	        teamHasGames.put(team.getId(), adminSportService.hasGames("team", team.getId()));
	    }
	    for (VenueVO venue : venues) {
	        venueHasGames.put(venue.getId(), adminSportService.hasGames("venue", venue.getId()));
	    }
	    
		model.addAttribute("sports", sports);
		model.addAttribute("teams", teams);
		model.addAttribute("venues", venues);
	    model.addAttribute("sportHasGames", sportHasGames);
	    model.addAttribute("teamHasGames", teamHasGames);
	    model.addAttribute("venueHasGames", venueHasGames);

		return "admin/sports/sportList";
	}

	// 종목 / 팀 / 경기장 정보 삭제
	@PostMapping("/{type}/delete")
	@ResponseBody
	public ResponseEntity<?> deleteItem(@PathVariable String type, @RequestBody Map<String, Integer> payload) {
		int id = payload.get("id");
		Map<String, Object> response = new HashMap<>();

		try {
			switch (type) {
				case "sport":
					if (adminSportService.hasTeamsOrVenues(id)) {
						response.put("success", false);
						response.put("errorCode", "DEPENDENT_ITEMS_EXIST");
						response.put("message", "이 스포츠 종목에 등록된 팀이나 경기장이 있어 삭제할 수 없습니다.");
						return ResponseEntity.ok(response);
					}
					adminSportService.deleteSport(id);
					break;
				case "team":
					if (adminSportService.hasVenues(id)) {
						response.put("success", false);
						response.put("errorCode", "DEPENDENT_ITEMS_EXIST");
						response.put("message", "이 팀에 등록된 경기장이 있어 삭제할 수 없습니다.");
						return ResponseEntity.ok(response);
					}
					adminSportService.deleteTeam(id);
					break;
				case "venue":
					adminSportService.deleteVenue(id);
					break;
				default:
					throw new IllegalArgumentException("Invalid type: " + type);
			}

			response.put("success", true);
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// 스포츠 종목 이름 수정
	@PostMapping("/update")
	@ResponseBody
	public ResponseEntity<?> updateSport(@RequestBody Map<String, Object> payload) {
		int id = Integer.parseInt((String) payload.get("id"));
		String sportName = (String) payload.get("sportName");

		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminSportService.updateSport(id, sportName);
			if (result) {
				response.put("success", true);
				response.put("message", "스포츠가 성공적으로 업데이트 되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "스포츠 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 팀 정보 수정
	@PostMapping("/team/update")
	@ResponseBody
	public ResponseEntity<?> updateTeam(@RequestBody Map<String, Object> payload) {
		int id = Integer.parseInt((String) payload.get("id"));
		String teamName = (String) payload.get("teamName");
		String shortName = (String) payload.get("shortName");

		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminSportService.updateTeam(id, teamName, shortName);
			if (result) {
				response.put("success", true);
				response.put("message", "팀이 성공적으로 업데이트 되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "팀 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 경기장 정보 수정
	@PostMapping("/venue/update")
	@ResponseBody
	public ResponseEntity<?> updateVenue(@RequestBody Map<String, Object> payload) {
		int id = Integer.parseInt((String) payload.get("id"));
		String venueName = (String) payload.get("venueName");
		String address = (String) payload.get("address");
		String capacity = (String) payload.get("capacity");

		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminSportService.updateVenue(id, venueName, address, capacity);
			if (result) {
				response.put("success", true);
				response.put("message", "경기장이 성공적으로 업데이트 되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "경기장 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 경기 등록 폼
	@GetMapping("/game/gameRegister")
	public String gameRegisterForm(Model model) {
		List<String> sports = adminSportService.getAllSports();
		List<TeamVO> teams = adminSportService.getAllTeamsWithSports();
		List<VenueVO> venues = adminSportService.getAllVenuesDetails();

		model.addAttribute("sports", sports);
		model.addAttribute("teams", teams);
		model.addAttribute("venues", venues);
		return "admin/sports/game/gameRegister";
	}

	// 등록 폼 내 셀렉된 스포츠에 따른 팀 가져오기
	@GetMapping("/teams")
	@ResponseBody
	public List<TeamVO> getTeamsBySport(@RequestParam String sportName) {
		return adminSportService.getTeamsBySport(sportName);
	}

	// 등록 폼 내 셀렉된 팀에 따른 경기장 가져오기
	@GetMapping("/venues")
	@ResponseBody
	public List<TeamVO> getVenuesByTeam(@RequestParam String teamName) {
		return adminSportService.getVenuesByTeam(teamName);
	}

	// 경기 등록 처리
	@PostMapping("/game/gameRegister")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registerGame(@ModelAttribute GameVO game) {
		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminSportService.registerGame(game);
			if (result) {
				List<GameVO> newGames = adminSportService.getRecentGames(1); // 가장 최근에 등록된 1개의 게임 가져오기
				response.put("success", true);
				response.put("games", newGames);
			} else {
				response.put("success", false);
				response.put("message", "게임 등록에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 모든 경기 리스트
	@GetMapping("/game/gameList")
	public String gameList(@RequestParam(defaultValue = "1") int page, Model model) {
	    int pageSize = 10;
	    int totalCount = adminSportService.getTotalGamesCount();
	    PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);
		
		List<GameVO> games = adminSportService.getAllGamesDetails(page, pageSize);
		Map<Integer, Boolean> gameHasReservations = new HashMap<>();
		
	    for (GameVO game : games) {
	        gameHasReservations.put(game.getId(), adminSportService.hasReservations(game.getId()));
	    }
	    
		model.addAttribute("games", games);
		model.addAttribute("gameHasReservations", gameHasReservations);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/sports/game/gameList";
	}

	// 경기 정보 수정
	@PostMapping("/game/update")
	@ResponseBody
	public ResponseEntity<?> updateGame(@RequestBody Map<String, Object> payload) {
		int id = Integer.parseInt((String) payload.get("id"));
		String gameDate = (String) payload.get("gameDate");
		String gameTime = (String) payload.get("gameTime");

		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminSportService.updateGame(id, gameDate, gameTime);
			if (result) {
				response.put("success", true);
				response.put("message", "경기가 성공적으로 업데이트 되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "경기 업데이트에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류 발생 : " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}

	// 경기 삭제
	@PostMapping("/game/delete")
	@ResponseBody
	public ResponseEntity<?> deleteGame(@RequestBody Map<String, Integer> payload) {
		int id = payload.get("id");
		Map<String, Object> response = new HashMap<>();

		try {
			adminSportService.deleteGame(id);
			response.put("success", true);
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// 좌석 등록 폼
	@GetMapping("/seat/seatRegister")
	public String seatRegisterForm(Model model) {
		List<String> sports = adminSportService.getAllSports();
		List<TeamVO> teams = adminSportService.getAllTeamsWithSports();
		List<VenueVO> venues = adminSportService.getAllVenuesDetails();

		model.addAttribute("sports", sports);
		model.addAttribute("teams", teams);
		model.addAttribute("venues", venues);
		return "admin/sports/seat/seatRegister";
	}

	// 좌석 등록 폼 경기장별 현재 사용된 좌석 수 확인
	@GetMapping("/seat/usedCapacity")
	@ResponseBody
	public Map<String, Integer> getUsedCapacity(@RequestParam int venueId) {
		int usedCapacity = adminSportService.getUsedCapacityByVenueId(venueId);
		Map<String, Integer> response = new HashMap<>();
		response.put("usedCapacity", usedCapacity);
		return response;
	}

//	// 좌석 등록 처리
//	@PostMapping("/seat/seatRegister")
//	@ResponseBody
//	public ResponseEntity<?> registerSeat(@ModelAttribute SeatVO seat) {
//	    try {
//	        SeatVO newSeat = adminSportService.registerSeat(seat);
//	        Map<String, Object> response = new HashMap<>();
//	        response.put("success", true);
//	        response.put("seats", Collections.singletonList(newSeat));
//	        return ResponseEntity.ok(response);
//	    } catch (Exception e) {
//	        e.printStackTrace(); // 서버 로그에 스택 트레이스 출력
//	        Map<String, Object> response = new HashMap<>();
//	        response.put("success", false);
//	        response.put("message", "좌석 등록 중 오류가 발생했습니다: " + e.getMessage());
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
//	    }
//	}
	@PostMapping("/seat/seatRegister")
	@ResponseBody
	public ResponseEntity<?> registerSeat(@ModelAttribute SeatVO seat) {
		try {
			SeatVO newSeat = adminSportService.registerSeat(seat);
			Map<String, Object> response = new HashMap<>();
			response.put("success", true);
			response.put("seats", Collections.singletonList(newSeat));
			return ResponseEntity.ok(response);
		} catch (IllegalArgumentException | IllegalStateException e) {
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("message", e.getMessage());
			return ResponseEntity.ok(response); // 200 OK로 변경
		} catch (Exception e) {
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("message", "좌석 등록 중 오류가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// 요금 등록 폼
	@GetMapping("/price/priceRegister")
	public String priceRegisterForm(Model model) {
		List<String> sports = adminSportService.getAllSports();
		List<TeamVO> teams = adminSportService.getAllTeamsWithSports();
		List<VenueVO> venues = adminSportService.getAllVenuesDetails();
		List<SeatVO> seats = adminSportService.getAllSeats();
		List<String> ticketCategories = adminSportService.getAllTicketCategories();

		model.addAttribute("sports", sports);
		model.addAttribute("teams", teams);
		model.addAttribute("venues", venues);
		model.addAttribute("seats", seats);
		model.addAttribute("ticketCategories", ticketCategories);
		return "admin/sports/price/priceRegister";
	}

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@GetMapping("/seats")
	@ResponseBody
	public List<SeatVO> getSeatsByVenueName(@RequestParam String venueName) {
		return adminSportService.getSeatsByVenueName(venueName);
	}

	// 등록 폼 내 권종 카테고리 가져오기
	@GetMapping("/ticketTypes")
	@ResponseBody
	public List<TicketTypeVO> getTicketTypesByCategory(@RequestParam String category) {
		return adminSportService.getTicketTypesByCategory(category);
	}

	// 요금 등록 처리
	@PostMapping("/price/priceRegister")
	@ResponseBody
	public ResponseEntity<?> registerPrice(@ModelAttribute PriceVO price) {
		try {
			PriceVO newPrice = adminSportService.registerPrice(price);
			Map<String, Object> response = new HashMap<>();
			response.put("success", true);
			response.put("price", newPrice);
			return ResponseEntity.ok(response);
		} catch (IllegalArgumentException | IllegalStateException e) {
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("message", e.getMessage());
			return ResponseEntity.ok(response); // 200 OK로 변경
		} catch (Exception e) {
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("message", "요금 등록 중 오류가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}
}
