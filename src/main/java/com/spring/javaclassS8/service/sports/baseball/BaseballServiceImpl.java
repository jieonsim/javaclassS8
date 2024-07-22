package com.spring.javaclassS8.service.sports.baseball;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.baseball.BaseballDAO;
import com.spring.javaclassS8.vo.sports.GameVO;

@Service
public class BaseballServiceImpl implements BaseballService {

	@Autowired
	private BaseballDAO baseballDAO;

	private static final Map<String, String> teamNameMap = new HashMap<>();
	static {
		teamNameMap.put("lg", "LG");
		teamNameMap.put("kt", "kt");
		teamNameMap.put("ssg", "SSG");
		teamNameMap.put("kia", "KIA");
		teamNameMap.put("samsung", "삼성");
		teamNameMap.put("hanhwa", "한화");
	}

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	@Override
	public List<GameVO> getBaseballGamesFromToday(LocalDate today, YearMonth currentMonth) {
		LocalDate firstDayOfNextMonth = currentMonth.plusMonths(1).atDay(1);
		return baseballDAO.getBaseballGamesFromToday(today, firstDayOfNextMonth);
	}

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	@Override
	public List<GameVO> getTeamHomeGames(String team, LocalDate startDate, LocalDate endDate) {
		String shortName = teamNameMap.get(team.toLowerCase());
		return baseballDAO.getTeamHomeGames(shortName, startDate, endDate);
	}
}
