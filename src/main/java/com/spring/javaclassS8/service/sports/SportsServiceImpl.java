package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.SportsDAO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;

@Service
public class SportsServiceImpl implements SportsService {

	@Autowired
	private SportsDAO sportsDAO;

	private static final Map<String, String> sportNameMap = new HashMap<>();
	static {
		sportNameMap.put("baseball", "야구");
		sportNameMap.put("football", "축구");
	}

	private static final Map<String, Map<String, String>> teamNameMap = new HashMap<>();
	static {
		Map<String, String> baseballTeams = new HashMap<>();
		baseballTeams.put("lg", "LG");
		baseballTeams.put("kt", "kt");
		baseballTeams.put("ssg", "SSG");
		baseballTeams.put("kia", "KIA");
		baseballTeams.put("samsung", "삼성");
		baseballTeams.put("hanhwa", "한화");

		Map<String, String> footballTeams = new HashMap<>();
		footballTeams.put("uhfc", "울산");
		footballTeams.put("steelers", "포항");
		footballTeams.put("gwangjufc", "광주FC");
		footballTeams.put("hyundaimotorsfc", "전북현대");
		footballTeams.put("incheonutd", "인천");
		footballTeams.put("daegufc", "대구");
		footballTeams.put("fcseoul", "FC서울");
		footballTeams.put("gimcheonfc", "김천");

		teamNameMap.put("야구", baseballTeams);
		teamNameMap.put("축구", footballTeams);
	}

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	@Override
	public List<GameVO> getGamesFromToday(String sport, LocalDate today, YearMonth currentMonth) {
		LocalDate firstDayOfNextMonth = currentMonth.plusMonths(1).atDay(1);
		String dbSportName = sportNameMap.get(sport);
		return sportsDAO.getGamesFromToday(dbSportName, today, firstDayOfNextMonth);
	}

	// 구단별 오늘 날짜 ~ 다음달 마지막 날까지 홈경기 가져오기
	@Override
	public List<GameVO> getTeamHomeGames(String sport, String team, LocalDate startDate, LocalDate endDate) {
		String dbSportName = sportNameMap.get(sport);
		String shortName = teamNameMap.get(dbSportName).get(team.toLowerCase());
		return sportsDAO.getTeamHomeGames(dbSportName, shortName, startDate, endDate);
	}

	// gameId로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return sportsDAO.getGameById(gameId);
	}

	// gameId로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return sportsDAO.getSeatInventoriesByGameId(gameId);
	}

	// sportId로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
		return sportsDAO.getMaxTicketsPerBooking(sportId);
	}
}
