package com.spring.javaclassS8.controller.admin.sports;

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

import com.spring.javaclassS8.service.admin.sport.AdminSportSerivce;
import com.spring.javaclassS8.vo.sport.SportVO;
import com.spring.javaclassS8.vo.sport.TeamVO;
import com.spring.javaclassS8.vo.sport.VenueVO;

@Controller
@RequestMapping("/admin/sports")
public class AdminSportsController {

	@Autowired
	private AdminSportSerivce adminSportService;

	// 스포츠 종목 + 팀 + 경기장 등록 폼
	@GetMapping("/register")
	public String registerForm(Model model, @RequestParam(required = false) String selectedSport, @RequestParam(required = false) String selectedTeam) {
		List<String> sports = adminSportService.getAllSports();
		List<TeamVO> teams = adminSportService.getAllTeamsWithSports();

		model.addAttribute("sports", sports);
		model.addAttribute("selectedSport", selectedSport);
		model.addAttribute("teams", teams);
		model.addAttribute("selectedTeam", selectedTeam);
		return "admin/sports/register";
	}

	// 스포츠 종목 등록 처리
	@PostMapping("/register")
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
	@PostMapping("/team/register")
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

	// 경기장 등록 처리
	@PostMapping("/venue/register")
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

	// 스포츠 종목 + 팀 + 경기장 등록 리스트
	@GetMapping("/registrationList")
	public String registrationList(Model model) {
		List<SportVO> sports = adminSportService.getAllSportsDetails();
		List<TeamVO> teams = adminSportService.getAllTeamsDetails();
		List<VenueVO> venues = adminSportService.getAllVenuesDetails();

		model.addAttribute("sports", sports);
		model.addAttribute("teams", teams);
		model.addAttribute("venues", venues);

		return "admin/sports/registrationList";
	}
	
//	@PostMapping("/sports/{type}/delete")
//	public ResponseEntity<?> deleteItem(@PathVariable String type, @RequestBody Map<String, Integer> payload) {
//	    int id = payload.get("id");
//	    Map<String, Object> response = new HashMap<>();
//
//	    try {
//	        switch (type) {
//	            case "sport":
//	                if (sportService.hasTeamsOrVenues(id)) {
//	                    response.put("success", false);
//	                    response.put("errorCode", "DEPENDENT_ITEMS_EXIST");
//	                    response.put("message", "이 스포츠 종목에 등록된 팀이나 경기장이 있어 삭제할 수 없습니다.");
//	                    return ResponseEntity.ok(response);
//	                }
//	                sportService.deleteSport(id);
//	                break;
//	            case "team":
//	                if (teamService.hasVenues(id)) {
//	                    response.put("success", false);
//	                    response.put("errorCode", "DEPENDENT_ITEMS_EXIST");
//	                    response.put("message", "이 팀에 등록된 경기장이 있어 삭제할 수 없습니다.");
//	                    return ResponseEntity.ok(response);
//	                }
//	                teamService.deleteTeam(id);
//	                break;
//	            case "venue":
//	                venueService.deleteVenue(id);
//	                break;
//	            default:
//	                throw new IllegalArgumentException("Invalid type: " + type);
//	        }
//
//	        response.put("success", true);
//	        return ResponseEntity.ok(response);
//	    } catch (Exception e) {
//	        response.put("success", false);
//	        response.put("message", e.getMessage());
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
//	    }
//	}
}
