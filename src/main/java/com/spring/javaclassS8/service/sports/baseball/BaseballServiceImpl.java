package com.spring.javaclassS8.service.sports.baseball;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.baseball.BaseballDAO;
import com.spring.javaclassS8.vo.sports.GameVO;

@Service
public class BaseballServiceImpl implements BaseballService {
	
	@Autowired
	private BaseballDAO baseballDAO;

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
    @Override
    public List<GameVO> getBaseballGamesFromToday(LocalDate today, YearMonth currentMonth) {
        LocalDate firstDayOfNextMonth = currentMonth.plusMonths(1).atDay(1);
        return baseballDAO.getBaseballGamesFromToday(today, firstDayOfNextMonth);
    }
    
}
