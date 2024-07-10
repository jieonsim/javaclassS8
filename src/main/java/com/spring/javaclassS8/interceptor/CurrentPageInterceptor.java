package com.spring.javaclassS8.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CurrentPageInterceptor implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null) {
			String uri = request.getRequestURI();
			String contextPath = request.getContextPath();
			String currentPage = "other";
			String currentTeam = "";
			String teamName = "";

			if (uri.equals(contextPath + "/") || uri.equals(contextPath)) {
				currentPage = "home";
			} else if (uri.startsWith(contextPath + "/sports/baseball")) {
				currentPage = "baseball";
			} else if (uri.startsWith(contextPath + "/sports/football")) {
				currentPage = "football";
			} else if (uri.startsWith(contextPath + "/sports/basketball")) {
				currentPage = "basketball";
			} else if (uri.startsWith(contextPath + "/sports/volleyball")) {
				currentPage = "volleyball";
			}

			if (uri.contains("/sports/baseball/lg")) {
				currentTeam = "lg";
				teamName = "LG트윈스";
			} else if (uri.contains("/sports/baseball/kt")) {
				currentTeam = "kt";
				teamName = "kt wiz";
			} else if (uri.contains("/sports/baseball/ssg")) {
				currentTeam = "ssg";
				teamName = "SSG 랜더스";
			} else if (uri.contains("/sports/baseball/kia")) {
				currentTeam = "kia";
				teamName = "KIA 타이거즈";
			} else if (uri.contains("/sports/baseball/samsung")) {
				currentTeam = "samsung";
				teamName = "삼성 라이온즈";
			} else if (uri.contains("/sports/baseball/hanhwa")) {
				currentTeam = "hanhwa";
				teamName = "한화이글스";
			} else if (uri.contains("/sports/football/uhfc")) {
				currentTeam = "uhfc";
				teamName = "울산 HD FC";
			} else if (uri.contains("/sports/football/steelers")) {
				currentTeam = "steelers";
				teamName = "포항 스틸러스";
			} else if (uri.contains("/sports/football/gwangjufc")) {
				currentTeam = "gwangjufc";
				teamName = "광주 FC";
			} else if (uri.contains("/sports/football/hyundaimotorsfc")) {
				currentTeam = "hyundaimotorsfc";
				teamName = "전북 현대모터스 ";
			} else if (uri.contains("/sports/football/incheonutd")) {
				currentTeam = "hyundaiMotorsfc";
				teamName = "인천 유나이티드";
			} else if (uri.contains("/sports/football/daegufc")) {
				currentTeam = "daegufc";
				teamName = "대구FC";
			} else if (uri.contains("/sports/football/fcseoul")) {
				currentTeam = "fcseoul";
				teamName = "FC서울";
			} else if (uri.contains("/sports/football/gimcheonfc")) {
				currentTeam = "gimcheonfc";
				teamName = "김천상무프로축구단";
			}

			modelAndView.addObject("currentPage", currentPage);
			modelAndView.addObject("currentTeam", currentTeam);
			modelAndView.addObject("teamName", teamName);
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
