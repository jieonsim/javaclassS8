package com.spring.javaclassS8.dao.sports.baseball;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;

public interface BaseballDAO {

	// 오늘 날짜 ~ 당월 마지막 경기까지 가져오기
	List<GameVO> getBaseballGamesFromToday(@Param("today") LocalDate today, @Param("firstDayOfNextMonth") LocalDate firstDayOfNextMonth);
	

}
