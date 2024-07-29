package com.spring.javaclassS8.controller.my.reserve;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaclassS8.service.my.reserve.MyReservationService;
import com.spring.javaclassS8.vo.member.MemberVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Controller
@RequestMapping("/my/reserve")
public class MyReservationController {
	
	@Autowired
	private MyReservationService myReservationService;

	// 마이페이지 >  회원정보관리 > 회원정보수정 뷰
	@GetMapping("/list")
	public String getReservationList(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		if (member == null) {
			return "redirect:/login";
		}
		
		List<ReservationVO> reservations = myReservationService.getReservationListByMemberId(member.getId());
		model.addAttribute("reservations", reservations);
		return "my/reserve/reserveList";
	}
}
