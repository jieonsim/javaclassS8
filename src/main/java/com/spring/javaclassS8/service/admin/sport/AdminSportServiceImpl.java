package com.spring.javaclassS8.service.admin.sport;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.sport.SportVO;
import com.spring.javaclassS8.vo.sport.TeamVO;
import com.spring.javaclassS8.vo.sport.VenueVO;

@Service
public class AdminSportServiceImpl implements AdminSportSerivce {

	@Autowired
	private AdminDAO adminDAO;

	// 스포츠 종목 등록 처리
	@Override
	public boolean registerSport(String sportName) {
		if (sportName == null || sportName.trim().isEmpty()) {
			throw new IllegalArgumentException("스포츠 이름은 필수 입력 항목입니다.");
		}
		return adminDAO.insertSport(sportName) > 0;
	}

	// 모든 스포츠 종목 이름 가져오기
	@Override
	public List<String> getAllSports() {
		return adminDAO.getAllSports();
	}

	// 스포츠 팀 등록 처리
	@Override
	@Transactional
	public boolean registerTeam(String sportName, String teamName, String shortName) {
		// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
		Integer sportId = adminDAO.getSPortIdByName(sportName);
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠가 존재하지 않습니다." + sportName);
		}

		return adminDAO.insertTeam(sportId, teamName, shortName) > 0;

	}

	// 경기장 등록 처리
	@Override
	@Transactional
	public boolean registerVenue(String sportName, String teamName, String venueName, String address, String capacity) {
		// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
		Integer sportId = adminDAO.getSPortIdByName(sportName);
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠가 존재하지 않습니다." + sportName);
		}
		// 팀 이름으로 팀 고유번호 가져오기
		Integer teamId = adminDAO.getTeamIdByName(teamName);
		if (teamId == null) {
			throw new IllegalArgumentException("해당 팀이 존재하지 않습니다." + teamName);
		}
		
		return adminDAO.insertVenue(sportId, teamId, venueName, address, capacity) > 0;
	}

	// 해당하는 스포츠에 따른 팀 이름 가져오기
	@Override
	public List<TeamVO> getAllTeamsWithSports() {
		return adminDAO.getAllTeamsWithSports();
	}

	// 모든 스포츠 디테일
	@Override
	public List<SportVO> getAllSportsDetails() {
		return adminDAO.getAllSportsDetails();
	}

	// 모든 팀 디테일
	@Override
	public List<TeamVO> getAllTeamsDetails() {
		return adminDAO.getAllTeamsDetails();
	}
	
	// 모든 경기장 디테일
	@Override
	public List<VenueVO> getAllVenuesDetails() {
		return adminDAO.getAllVenuesDetails();
	}
}
