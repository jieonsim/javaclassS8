package com.spring.javaclassS8.controller.my.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my/reserve")
public class MyReservationController {

	// 마이페이지 >  회원정보관리 > 회원정보수정 뷰
	@GetMapping("/list")
	public String getMyReservationList() {
		return "my/reserve/list";
	}

}
