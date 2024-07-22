package com.spring.javaclassS8.service.sports.football;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.football.FootballDAO;
import com.spring.javaclassS8.vo.sports.GameVO;

@Service
public class FootballServiceImpl implements FootballService {
	
	@Autowired
	private FootballDAO footballDAO;

	private static final Map<String, String> teamNameMap = new HashMap<>();
	static {
		teamNameMap.put("uhfc", "울산");
		teamNameMap.put("steelers", "포항");
		teamNameMap.put("gwangjufc", "광주FC");
		teamNameMap.put("hyundaimotorsfc", "전북현대");
		teamNameMap.put("incheonutd", "인천");
		teamNameMap.put("daegufc", "대구");
		teamNameMap.put("fcseoul", "FC서울");
		teamNameMap.put("gimcheonfc", "김천");
	}
	
	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
    @Override
    public List<GameVO> getFootballGamesFromToday(LocalDate today, YearMonth currentMonth) {
        LocalDate firstDayOfNextMonth = currentMonth.plusMonths(1).atDay(1);
        return footballDAO.getFootballGamesFromToday(today, firstDayOfNextMonth);
    }

    // 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	@Override
	public List<GameVO> getTeamHomeGames(String team, LocalDate startDate, LocalDate endDate) {
		String shortName = teamNameMap.get(team.toLowerCase());
		return footballDAO.getTeamHomeGames(shortName, startDate, endDate);
	}
}
