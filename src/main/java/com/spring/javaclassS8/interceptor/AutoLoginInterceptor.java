package com.spring.javaclassS8.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.javaclassS8.service.member.LoginService;
import com.spring.javaclassS8.vo.member.LoginResult;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private LoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginMember") == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "autoLoginToken");
			if (loginCookie != null) {
				LoginResult result = loginService.autoLogin(request, response);
				if (result.isSuccess()) {
					session.setAttribute("loginMember", result.getMember());
					// 클라이언트에 로그인 정보 전달
					//response.setContentType("application/json");
					//response.getWriter().write("{\"isLoggedIn\": true, \"email\": \"" + result.getMember().getEmail() + "\", \"role\": \"" + result.getMember().getRole() + "\"}");
					
					// 자동 로그인 성공 여부를 request 속성에 저장
					request.setAttribute("autoLoginSuccess", true);
				}
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}
}