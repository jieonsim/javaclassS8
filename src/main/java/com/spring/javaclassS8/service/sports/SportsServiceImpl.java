package com.spring.javaclassS8.service.sports;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.SportsDAO;
import com.spring.javaclassS8.vo.sports.CategoryVO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportBookingPolicyVO;

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

	// 경기 고유번호로 경기 정보 가져오기
	@Override
	public GameVO getGameById(int gameId) {
		return sportsDAO.getGameById(gameId);
	}

	// 경기 고유번호로 잔여 좌석 수 가져오기
	@Override
	public List<SeatInventoryVO> getSeatInventoriesByGameId(int gameId) {
		return sportsDAO.getSeatInventoriesByGameId(gameId);
	}

	// 스포츠 고유번호로 1회 예매 시 최대 구매 가능 티켓 수 가져오기
	@Override
	public int getMaxTicketsPerBooking(int sportId) {
		return sportsDAO.getMaxTicketsPerBooking(sportId);
	}

	// 좌석 고유번호로 좌석 정보 가져오기
	@Override
	public SeatVO getSeatById(int seatId) {
		return sportsDAO.getSeatById(seatId);
	}

	// 좌석 고유번호로 요금 정보 가져오기
	@Override
	public List<PriceVO> getPricesBySeatId(int seatId) {
		return sportsDAO.getPricesBySeatId(seatId);
	}

	// 스포츠 고유번호로 예매 정책 정보 가져오기
	@Override
	public SportBookingPolicyVO getBookingPolicyBySportId(int sportId) {
		return sportsDAO.getBookingPolicyBySportId(sportId);
	}

	// 좌석 고유번호로 권종 카테고리별 필요한 rowspan 가져오기
	@Override
	public List<CategoryVO> getCategoriesWithRowspan(int seatId) {
		List<PriceVO> prices = sportsDAO.getPricesBySeatId(seatId);
		Map<String, Integer> categoryCount = new HashMap<>();

		for (PriceVO price : prices) {
			categoryCount.put(price.getCategory(), categoryCount.getOrDefault(price.getCategory(), 0) + 1);
		}

		List<CategoryVO> categoryList = new ArrayList<>();
		for (Map.Entry<String, Integer> entry : categoryCount.entrySet()) {
			categoryList.add(new CategoryVO(entry.getKey(), entry.getValue()));
		}

		return categoryList;
	}

	// memberId로 해당 유저에 등록된 유효한 예매권 정보 가져오기
	@Override
	public List<Map<String, Object>> getValidAdvanceTicketsByMemberId(int memberId) {
		List<Map<String, Object>> tickets = sportsDAO.getValidAdvanceTicketsByMemberId(memberId);
		
		for (Map<String, Object> ticket : tickets) {
			// 유효기간 형식 변경
			Timestamp expiresAt = (Timestamp) ticket.get("expiresAt");
			String formattedDate = new SimpleDateFormat("yyyy.MM.dd").format(expiresAt) + "까지";
			ticket.put("formattedExpiresAt", formattedDate);

		}
		return tickets;
	}
}
