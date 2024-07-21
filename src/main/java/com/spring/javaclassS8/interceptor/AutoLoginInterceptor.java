package com.spring.javaclassS8.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.javaclassS8.service.member.LoginService;
import com.spring.javaclassS8.vo.member.LoginResult;
import com.spring.javaclassS8.vo.member.MemberVO;

public class AutoLoginInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(AutoLoginInterceptor.class);

	@Autowired
	private LoginService loginService;

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		HttpSession session = request.getSession();
//		if (session.getAttribute("loginMember") == null) {
//			Cookie loginCookie = WebUtils.getCookie(request, "autoLoginToken");
//			if (loginCookie != null) {
//				LoginResult result = loginService.autoLogin(request, response);
//				if (result.isSuccess()) {
//					session.setAttribute("loginMember", result.getMember());
//
//					// 자동 로그인 성공 여부를 request 속성에 저장
//					request.setAttribute("autoLoginSuccess", true);
//				}
//			}
//		}
//		return true;
//	}

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		HttpSession session = request.getSession();
//		logger.info("AutoLoginInterceptor: Checking session");
//
//		if (session.getAttribute("loginMember") == null) {
//			logger.info("AutoLoginInterceptor: No loginMember in session");
//			Cookie loginCookie = WebUtils.getCookie(request, "autoLoginToken");
//			if (loginCookie != null) {
//				logger.info("AutoLoginInterceptor: Found autoLoginToken cookie");
//				LoginResult result = loginService.autoLogin(request, response);
//				if (result.isSuccess()) {
//					logger.info("AutoLoginInterceptor: Auto login successful");
//					session.setAttribute("loginMember", result.getMember());
//					request.setAttribute("autoLoginSuccess", true);
//
//					// Check if the logged-in user is an admin
//					if ("ADMIN".equals(result.getMember().getRole())) {
//						logger.info("AutoLoginInterceptor: Admin user logged in");
//						return true;
//					}
//				} else {
//					logger.warn("AutoLoginInterceptor: Auto login failed");
//				}
//			} else {
//				logger.info("AutoLoginInterceptor: No autoLoginToken cookie found");
//			}
//		} else {
//			logger.info("AutoLoginInterceptor: LoginMember already in session");
//		}
//
//		// If it's an admin page and no admin is logged in, redirect to login page
//		if (request.getRequestURI().startsWith("/admin/") && (session.getAttribute("loginMember") == null || !"ADMIN".equals(((MemberVO) session.getAttribute("loginMember")).getRole()))) {
//			logger.warn("AutoLoginInterceptor: Unauthorized access to admin page");
//			response.sendRedirect(request.getContextPath() + "/login");
//			return false;
//		}
//
//		return true;
//	}

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        logger.info("AutoLoginInterceptor: Checking session");

        if (session.getAttribute("loginMember") == null) {
            logger.info("AutoLoginInterceptor: No loginMember in session");
            Cookie loginCookie = WebUtils.getCookie(request, "autoLoginToken");
            if (loginCookie != null) {
                logger.info("AutoLoginInterceptor: Found autoLoginToken cookie");
                LoginResult result = loginService.autoLogin(request, response);
                if (result.isSuccess()) {
                    logger.info("AutoLoginInterceptor: Auto login successful. User role: {}", result.getMember().getRole());
                    session.setAttribute("loginMember", result.getMember());
                    request.setAttribute("autoLoginSuccess", true);
                } else {
                    logger.warn("AutoLoginInterceptor: Auto login failed");
                }
            } else {
                logger.info("AutoLoginInterceptor: No autoLoginToken cookie found");
            }
        } else {
            logger.info("AutoLoginInterceptor: LoginMember already in session. Role: {}", ((MemberVO)session.getAttribute("loginMember")).getRole());
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