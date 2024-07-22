package com.spring.javaclassS8.service.sports.football;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.football.FootballDAO;
import com.spring.javaclassS8.vo.sports.GameVO;

@Service
public class FootballServiceImpl implements FootballService {
	
	@Autowired
	private FootballDAO footballDAO;

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
    @Override
    public List<GameVO> getFootballGamesFromToday(LocalDate today, YearMonth currentMonth) {
        LocalDate firstDayOfNextMonth = currentMonth.plusMonths(1).atDay(1);
        return footballDAO.getFootballGamesFromToday(today, firstDayOfNextMonth);
    }
}
