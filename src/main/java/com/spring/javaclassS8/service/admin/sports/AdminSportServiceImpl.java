package com.spring.javaclassS8.service.admin.sports;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.admin.sports.AdminSportDAO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

@Service
public class AdminSportServiceImpl implements AdminSportSerivce {

	@Autowired
	private AdminSportDAO adminSportDAO;

	// 스포츠 종목 등록 처리
	@Override
	public boolean registerSport(String sportName) {
		if (sportName == null || sportName.trim().isEmpty()) {
			throw new IllegalArgumentException("스포츠 이름은 필수 입력 항목입니다.");
		}
		return adminSportDAO.insertSport(sportName) > 0;
	}

	// 모든 스포츠 종목 이름 가져오기
	@Override
	public List<String> getAllSports() {
		return adminSportDAO.getAllSports();
	}

	// 스포츠 팀 등록 처리
	@Override
	@Transactional
	public boolean registerTeam(String sportName, String teamName, String shortName) {
		// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
		Integer sportId = adminSportDAO.getSPortIdByName(sportName);
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠가 존재하지 않습니다." + sportName);
		}

		return adminSportDAO.insertTeam(sportId, teamName, shortName) > 0;

	}

	// 경기장 등록 처리
	@Override
	@Transactional
	public boolean registerVenue(String sportName, String teamName, String venueName, String address, String capacity) {
		// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
		Integer sportId = adminSportDAO.getSPortIdByName(sportName);
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠가 존재하지 않습니다." + sportName);
		}
		// 팀 이름으로 팀 고유번호 가져오기
		Integer teamId = adminSportDAO.getTeamIdByName(teamName);
		if (teamId == null) {
			throw new IllegalArgumentException("해당 팀이 존재하지 않습니다." + teamName);
		}

		return adminSportDAO.insertVenue(sportId, teamId, venueName, address, capacity) > 0;
	}

	// 해당하는 스포츠에 따른 팀 이름 가져오기
	@Override
	public List<TeamVO> getAllTeamsWithSports() {
		return adminSportDAO.getAllTeamsWithSports();
	}

	// 모든 스포츠 디테일
	@Override
	public List<SportVO> getAllSportsDetails() {
		return adminSportDAO.getAllSportsDetails();
	}

	// 모든 팀 디테일
	@Override
	public List<TeamVO> getAllTeamsDetails() {
		return adminSportDAO.getAllTeamsDetails();
	}

	// 모든 경기장 디테일
	@Override
	public List<VenueVO> getAllVenuesDetails() {
		return adminSportDAO.getAllVenuesDetails();
	}

	// 스포츠 하위에 팀이나 경기장이 있는지 여부 확인
	@Override
	public boolean hasTeamsOrVenues(int id) {
		return adminSportDAO.countTeamsAndVenuesBySportId(id) > 0;
	}

	// 스포츠 종목 삭제
	@Override
	@Transactional
	public void deleteSport(int id) {
		adminSportDAO.deleteSport(id);
	}

	// 팀 하위에 경기장이 있는지 여부 확인
	@Override
	public boolean hasVenues(int id) {
		return adminSportDAO.countVenuesByTeamId(id) > 0;
	}

	// 팀 삭제
	@Override
	@Transactional
	public void deleteTeam(int id) {
		adminSportDAO.deleteTeam(id);
	}

	// 경기장 삭제
	@Override
	public void deleteVenue(int id) {
		adminSportDAO.deleteVenue(id);
	}

	// 스포츠 이름 수정
	@Override
	@Transactional
	public boolean updateSport(int id, String sportName) {
		if (sportName == null || sportName.trim().isEmpty()) {
			throw new IllegalArgumentException("스포츠 이름은 필수 입력 항목입니다.");
		}
		return adminSportDAO.updateSport(id, sportName) > 0;
	}

	// 스포츠 팀 정보 수정
	@Override
	@Transactional
	public boolean updateTeam(int id, String teamName, String shortName) {
		if (teamName == null || teamName.trim().isEmpty() || shortName == null || shortName.trim().isEmpty()) {
			throw new IllegalArgumentException("팀 이름과 단축 이름은 필수 입력 항목입니다.");
		}
		return adminSportDAO.updateTeam(id, teamName, shortName) > 0;
	}

	// 스포츠 경기장 정보 수정
	@Override
	@Transactional
	public boolean updateVenue(int id, String venueName, String address, String capacity) {
		if (venueName == null || venueName.trim().isEmpty() || address == null || address.trim().isEmpty() || capacity == null || capacity.trim().isEmpty()) {
			throw new IllegalArgumentException("경기장 이름과 주소, 수용 인원은 필수 입력 항목입니다.");
		}
		return adminSportDAO.updateVenue(id, venueName, address, capacity) > 0;
	}

	// 특정 스포츠의 팀 가져오기
	@Override
	public List<TeamVO> getTeamsBySport(String sportName) {
		return adminSportDAO.getTeamsBySport(sportName);
	}

	// 특정 팀의 경기장 가져오기
	@Override
	public List<TeamVO> getVenuesByTeam(String teamName) {
		return adminSportDAO.getVenuesByTeam(teamName);
	}

	// 경기 등록 처리
	@Override
	@Transactional
	public boolean registerGame(GameVO game) {
		return adminSportDAO.registerGame(game) > 0;
	}

	// 가장 최근 등록된 게임 1개 가져오기
	@Override
	public List<GameVO> getRecentGames(int limit) {
		return adminSportDAO.getRecentGames(limit);
	}

	// 모든 경기 디테일 가져오기(경기 리스트)
	@Override
	public List<GameVO> getAllGamesDetails() {
		return adminSportDAO.getAllGamesDetails();
	}

	// 경기 정보 수정
	@Override
	@Transactional
	public boolean updateGame(int id, String gameDate, String gameTime, String status) {
		if (gameDate == null || gameDate.trim().isEmpty() || gameTime == null || gameTime.trim().isEmpty() || status == null || status.trim().isEmpty()) {
			throw new IllegalArgumentException("경기 날짜와 시간, 상태는 필수 입력 항목입니다.");
		}
		return adminSportDAO.updateGame(id, gameDate, gameTime, status) > 0;
	}

	// 경기 삭제
    @Override
    @Transactional
    public void deleteGame(int id) throws Exception {
        adminSportDAO.deleteGame(id);
    }
}
