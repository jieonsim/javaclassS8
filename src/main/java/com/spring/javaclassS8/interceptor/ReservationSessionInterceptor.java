package com.spring.javaclassS8.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.javaclassS8.vo.reserve.TempReservation;

public class ReservationSessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        TempReservation tempReservation = (TempReservation) session.getAttribute("tempReservation");

        if (tempReservation != null && System.currentTimeMillis() > tempReservation.getExpirationTime()) {
            session.removeAttribute("tempReservation");
            response.sendRedirect(request.getContextPath() + "/reserve/error");
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
