package com.spring.javaclassS8.service.admin.sport;

import java.util.List;

import com.spring.javaclassS8.vo.sport.SportVO;
import com.spring.javaclassS8.vo.sport.TeamVO;
import com.spring.javaclassS8.vo.sport.VenueVO;

public interface AdminSportSerivce {

	// 스포츠 종목 등록 처리
	boolean registerSport(String sportName);

	// 모든 스포츠 종목 가져오기
	List<String> getAllSports();

	// 스포츠 팀 등록 처리
	boolean registerTeam(String sportName, String teamName, String shortName);

	// 경기장 등록 처리
	boolean registerVenue(String sportName, String teamName, String venueName, String address, String capacity);

	// 해당하는 스포츠에 따른 팀 이름 가져오기
	List<TeamVO> getAllTeamsWithSports();

	// 모든 스포츠 디테일
	List<SportVO> getAllSportsDetails();

	// 모든 팀 디테일
	List<TeamVO> getAllTeamsDetails();

	// 모든 경기장 디테일
	List<VenueVO> getAllVenuesDetails();

}
