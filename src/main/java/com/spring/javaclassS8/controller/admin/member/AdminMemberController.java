package com.spring.javaclassS8.controller.admin.member;

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

import com.spring.javaclassS8.service.admin.member.AdminMemberService;
import com.spring.javaclassS8.utils.PaginationInfo;
import com.spring.javaclassS8.vo.member.MemberUpdateRequest;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	// 회원 리스트
	@GetMapping("/memberList")
	public String memberList(@RequestParam(defaultValue = "1") int page, Model model) {
	    int pageSize = 10;
	    int totalCount = adminMemberService.getTotalMembersCount();
	    PaginationInfo paginationInfo = new PaginationInfo(totalCount, pageSize, page);
	    
	    List<MemberVO> members = adminMemberService.getAllMembers(page, pageSize);
	    
	    model.addAttribute("members", members);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
	    return "admin/member/memberList";
	}
	
	// 회원 정보(회원 등급 / 활동 상태 ) 업데이트
    @PostMapping("/update")
    public ResponseEntity<Map<String, Object>> updateMembers(@RequestBody MemberUpdateRequest request) {
        boolean success = adminMemberService.updateMembers(request);
        Map<String, Object> response = Map.of("success", success);
        return ResponseEntity.ok(response);
    }
	
	// 회원 리스트 페이지 내 검색
    @GetMapping("/search")
    public String searchMembers(@RequestParam(required = false) String keyword, 
                                @RequestParam(required = false) Integer status,
                                @RequestParam(required = false) String role,
                                Model model) {
        List<MemberVO> searchResults = adminMemberService.searchMembers(keyword, status, role);
        model.addAttribute("members", searchResults);
        return "admin/member/memberList";
    }
}
