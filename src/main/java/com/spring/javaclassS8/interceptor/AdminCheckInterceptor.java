package com.spring.javaclassS8.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.javaclassS8.vo.member.MemberVO;

public class AdminCheckInterceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MemberVO member = (MemberVO) session.getAttribute("loginMember");

        if (member == null || !MemberVO.Role.ADMIN.equals(member.getRole())) {
            response.sendRedirect(request.getContextPath() + "/error/accessDenied");
            return false;
        }

        return true;
    }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub

	}

}
