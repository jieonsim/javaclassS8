package com.spring.javaclassS8.controller.admin.event;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.service.admin.event.AdminEventService;
import com.spring.javaclassS8.service.event.EventService;
import com.spring.javaclassS8.vo.event.EventCommentVO;
import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.EventVO.EventCategory;
import com.spring.javaclassS8.vo.event.EventVO.EventStatus;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@Autowired
	private AdminEventService adminEventService;

	@Autowired
	private EventService eventService;

	// 이벤트 리스트
	@GetMapping("/list")
	public String getEventList(Model model) {
		List<EventVO> events = eventService.getAllEvents();
		model.addAttribute("events", events);
		model.addAttribute("categories", EventCategory.values());
		model.addAttribute("statuses", EventStatus.values());
		return "admin/event/list";
	}

	// 이벤트 업로드 폼
	@GetMapping("/upload")
	public String showUploadForm(Model model) {
		model.addAttribute("categories", EventCategory.values());
		model.addAttribute("statuses", EventStatus.values());
		return "admin/event/upload";
	}

	// 이벤트 업로드 시 ckeditor 이미지 업로드 처리
	@PostMapping("/imageUpload")
	public void imageUploadGet(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/event/");
		String oFileName = upload.getOriginalFilename();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		oFileName = sdf.format(date) + "_" + oFileName;

		FileOutputStream fos = new FileOutputStream(new File(realPath + oFileName));
		fos.write(upload.getBytes());

		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/event/" + oFileName;
		out.println("{\"originalFilename\":\"" + oFileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");

		out.flush();
		fos.close();
	}

	// 이벤트 업로드 처리
	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<?> uploadEvent(@ModelAttribute EventVO event, HttpSession session) {
		try {
			MemberVO admin = (MemberVO) session.getAttribute("loginMember");
			if (admin == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("error", "로그인이 필요합니다."));
			}
			event.setAdminId(admin.getId());

			// 썸네일 처리
			if (event.getThumbnailFile() != null && !event.getThumbnailFile().isEmpty()) {
				String thumbnailFileName = adminEventService.saveThumbnail(event.getThumbnailFile());
				event.setThumbnail(thumbnailFileName);
			}

			// 컨텐츠 이미지 처리
			if (event.getContent() != null && event.getContent().indexOf("src=\"/") != -1) {
				adminEventService.imgCheck(event.getContent());
			}

			// 컨텐츠 처리 - 맨 앞의 쉼표 제거 및 경로 변경
			if (event.getContent() != null) {
				event.setContent(event.getContent().replaceFirst("^,", "").replace("/data/ckeditor/event/", "/data/event/content/"));
			}

			int result = adminEventService.insertEvent(event);

			if (result != 0) {
				return ResponseEntity.ok(Collections.singletonMap("message", "이벤트가 성공적으로 등록되었습니다."));
			} else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "이벤트 등록에 실패했습니다."));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "이벤트 등록 중 오류가 발생했습니다: " + e.getMessage()));
		}
	}

	// 이벤트 컨텐츠 디테일
	@GetMapping("/contentDetail")
	public String getEventContentDetail(@RequestParam("eventId") int eventId, Model model) {
		EventVO event = eventService.getEventById(eventId);
		// 댓글 상태 active/deleted 상관없이 모두 가져오기
		List<EventCommentVO> eventComments = eventService.getAllEventComments(eventId);
		int commentCount = eventComments.size();

		model.addAttribute("event", event);
		model.addAttribute("eventComments", eventComments);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("newLine", "\n");

		return "admin/event/contentDetail";
	}

	// 이벤트 컨텐츠 수정 폼
	@GetMapping("/update")
	public String updateEventContent(@RequestParam("eventId") int eventId, Model model) {
		EventVO event = eventService.getEventById(eventId);

		// 이벤트 수정하기 폼 접속 시 기존 컨텐츠 내 이미지가 존재한다면
		// 현재 폴더(event/content)의 이미지를 ckeditor/event로 복사 처리
		if (event.getContent().indexOf("src=\"/") != -1) {
			adminEventService.imgBackup(event.getContent());
		}
		model.addAttribute("event", event);
		model.addAttribute("categories", EventCategory.values());
		model.addAttribute("statuses", EventStatus.values());

		return "admin/event/update";
	}

	// 이벤트 컨텐츠 수정 처리
	@PostMapping("/update")
	@ResponseBody
	public ResponseEntity<?> updateEvent(@ModelAttribute EventVO event, HttpSession session) {
		try {
			MemberVO admin = (MemberVO) session.getAttribute("loginMember");
			if (admin == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("error", "로그인이 필요합니다."));
			}
			event.setAdminId(admin.getId());

			// 컨텐츠 처리
			if (event.getContent() != null) {
				event.setContent(event.getContent().replaceFirst("^,", "")); // 맨 앞의 쉼표 제거
			}

			int result = adminEventService.updateEvent(event);

			if (result != 0) {
				return ResponseEntity.ok(Collections.singletonMap("message", "이벤트가 성공적으로 수정되었습니다."));
			} else {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("error", "이벤트 수정에 실패했습니다."));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "이벤트 수정 중 오류가 발생했습니다."));
		}
	}

	// 이벤트 리스트 조건 검색
	@PostMapping("/filter")
	@ResponseBody
	public ResponseEntity<List<EventVO>> filterEvents(@RequestParam(required = false) String eventCategory, @RequestParam(required = false) String status,
			@RequestParam(required = false) String startDate, @RequestParam(required = false) String endDate, @RequestParam(required = false) String keyword, Model model) {

		List<EventVO> filteredEvents = adminEventService.filterEvents(eventCategory, status, startDate, endDate, keyword);
		model.addAttribute("statuses", EventStatus.values());
		return ResponseEntity.ok(filteredEvents);
	}

	// 이벤트 참여자 수 가져오기
	@GetMapping("/getParticipantCount")
	@ResponseBody
	public ResponseEntity<Map<String, Integer>> getParticipantCount(@RequestParam("eventId") int eventId) {
		int count = adminEventService.getParticipantCount(eventId);
		Map<String, Integer> response = new HashMap<>();
		response.put("pariticipantCount", count);
		return ResponseEntity.ok(response);
	}

	// 이벤트 참여자 중 랜덤 추첨
	@PostMapping("/drawWinners")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> drawWinners(@RequestBody Map<String, Object> request) {
		try {
			int eventId = Integer.parseInt(request.get("eventId").toString());
			int numOfWinners = Integer.parseInt(request.get("numOfWinners").toString());

			boolean success = adminEventService.drawWinners(eventId, numOfWinners);
			Map<String, Object> response = new HashMap<>();
			response.put("success", success);
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			e.printStackTrace(); // 서버 로그에 스택 트레이스 출력
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			response.put("message", "An error occurred: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// 이벤트 추첨 리스트
	@GetMapping("/drawList")
	public String getwinnerList(Model model) {
		List<EventDrawSummaryVO> drawSummaries = adminEventService.getEventDrawSummaries();
		model.addAttribute("drawSummaries", drawSummaries);
		return "admin/event/drawList";
	}

	// 이벤트 당첨자 디테일
	@GetMapping("/winnerDetail")
	public String getWinnerDetail(@RequestParam("eventId") int eventId, Model model) {
		List<WinnerDetailVO> winnerDetails = adminEventService.getWinnerDetails(eventId);
		EventVO event = adminEventService.getEventById(eventId);
		boolean isAnnounced = adminEventService.isEventAnnounced(eventId);
		
		model.addAttribute("winnerDetails", winnerDetails);
		model.addAttribute("eventTitle", event.getTitle());
		model.addAttribute("eventId", eventId);
		model.addAttribute("isAnnounced", isAnnounced);
		
		return "admin/event/winnerDetail";
	}

	// 이벤트 당첨자 발표
	@PostMapping("/uploadWinnerAnnouoncement")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> uploadWinnerAnnouoncement(@RequestBody WinnerPostVO winnerPost, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		try {
			MemberVO admin = (MemberVO) session.getAttribute("loginMember");
			if (admin == null) {
				throw new RuntimeException("관리자 로그인이 필요합니다.");
			}

			winnerPost.setAdminId(admin.getId());
			boolean result = adminEventService.createWinnerPost(winnerPost);

			if (result) {
				response.put("success", true);
				response.put("message", "당첨자 발표가 정상적으로 완료되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "당첨자 발표에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "당첨자 발표 중 오류가 발생했습니다.");
			e.printStackTrace();
		}
		return ResponseEntity.ok(response);
	}

	// 이벤트 당첨자 대상으로 메일 발송
	@PostMapping("/sendWinnerEmails")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> sendWinnerEmails(@RequestBody Map<String, Object> request) {
		int eventId = Integer.parseInt(request.get("eventId").toString());
		Map<String, Object> response = new HashMap<>();

		try {
			boolean result = adminEventService.sendOrResendWinnerEmails(eventId);
			if (result) {
				response.put("success", true);
				response.put("message", "메일 발송이 완료되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "메일 발송에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "메일 발송 중 오류가 발생했습니다: " + e.getMessage());
		}

		return ResponseEntity.ok(response);
	}
}