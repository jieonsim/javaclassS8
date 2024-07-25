package com.spring.javaclassS8.dao.admin.sports;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

@Repository
public class AdminSportDAOImpl implements AdminSportDAO {

	@Autowired
	private SqlSession sqlSession;

	// 스포츠 종목 등록 처리
	@Override
	public int insertSport(String sportName) {
		return sqlSession.getMapper(AdminSportDAO.class).insertSport(sportName);
	}

	// 모든 스포츠 종목 가져오기
	@Override
	public List<String> getAllSports() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllSports();
	}

	// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
	@Override
	public Integer getSPortIdByName(String sportName) {
		return sqlSession.getMapper(AdminSportDAO.class).getSPortIdByName(sportName);
	}

	// 스포츠 팀 등록 처리
	@Override
	public int insertTeam(int sportId, String teamName, String shortName) {
		return sqlSession.getMapper(AdminSportDAO.class).insertTeam(sportId, teamName, shortName);
	}

	// 경기장 등록 처리
	@Override
	public int insertVenue(int sportId, int teamId, String venueName, String address, String capacity) {
		return sqlSession.getMapper(AdminSportDAO.class).insertVenue(sportId, teamId, venueName, address, capacity);
	}

	// 팀 이름으로 팀 고유번호 가져오기
	@Override
	public Integer getTeamIdByName(String teamName) {
		return sqlSession.getMapper(AdminSportDAO.class).getTeamIdByName(teamName);
	}

	// 해당하는 스포츠에 따른 팀 이름 가져오기
	@Override
	public List<TeamVO> getAllTeamsWithSports() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllTeamsWithSports();
	}

	// 모든 스포츠 디테일
	@Override
	public List<SportVO> getAllSportsDetails() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllSportsDetails();
	}

	// 모든 팀 디테일
	@Override
	public List<TeamVO> getAllTeamsDetails() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllTeamsDetails();
	}

	// 모든 경기장 디테일
	@Override
	public List<VenueVO> getAllVenuesDetails() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllVenuesDetails();
	}

	// 스포츠 하위에 팀이나 경기장이 있는지 여부 확인
	@Override
	public int countTeamsAndVenuesBySportId(int sportId) {
		return sqlSession.getMapper(AdminSportDAO.class).countTeamsAndVenuesBySportId(sportId);
	}

	// 스포츠 종목 삭제
	@Override
	public void deleteSport(int id) {
		sqlSession.getMapper(AdminSportDAO.class).deleteSport(id);
	}

	// 팀 하위에 경기장이 있는지 여부 확인
	@Override
	public int countVenuesByTeamId(int teamId) {
		return sqlSession.getMapper(AdminSportDAO.class).countVenuesByTeamId(teamId);
	}

	// 팀 삭제
	@Override
	public void deleteTeam(int id) {
		sqlSession.getMapper(AdminSportDAO.class).deleteTeam(id);
	}

	// 경기장 삭제
	@Override
	public void deleteVenue(int id) {
		sqlSession.getMapper(AdminSportDAO.class).deleteVenue(id);
	}

	// 스포츠 이름 수정
	@Override
	public int updateSport(int id, String sportName) {
		return sqlSession.getMapper(AdminSportDAO.class).updateSport(id, sportName);
	}

	// 스포츠 팀 정보 수정
	@Override
	public int updateTeam(int id, String teamName, String shortName) {
		return sqlSession.getMapper(AdminSportDAO.class).updateTeam(id, teamName, shortName);
	}

	// 스포츠 경기장 정보 수정
	@Override
	public int updateVenue(int id, String venueName, String address, String capacity) {
		return sqlSession.getMapper(AdminSportDAO.class).updateVenue(id, venueName, address, capacity);
	}

	// 특정 스포츠의 팀 가져오기
	@Override
	public List<TeamVO> getTeamsBySport(String sportName) {
		return sqlSession.getMapper(AdminSportDAO.class).getTeamsBySport(sportName);
	}

	// 특정 팀의 경기장 가져오기
	@Override
	public List<TeamVO> getVenuesByTeam(String teamName) {
		return sqlSession.getMapper(AdminSportDAO.class).getVenuesByTeam(teamName);
	}

	// 경기 등록 처리
	@Override
	public int registerGame(GameVO game) {
		return sqlSession.getMapper(AdminSportDAO.class).registerGame(game);
	}

	// 가장 최근 등록된 게임 1개 가져오기
	@Override
	public List<GameVO> getRecentGames(int limit) {
		return sqlSession.getMapper(AdminSportDAO.class).getRecentGames(limit);
	}

	// 모든 경기 디테일 가져오기(경기 리스트)
	@Override
	public List<GameVO> getAllGamesDetails() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllGamesDetails();
	}

	// 경기 정보 수정
	@Override
	public int updateGame(int id, String gameDate, String gameTime, String status) {
		return sqlSession.getMapper(AdminSportDAO.class).updateGame(id, gameDate, gameTime, status);
	}

	// 경기 삭제
	@Override
	public void deleteGame(int id) {
		sqlSession.getMapper(AdminSportDAO.class).deleteGame(id);
	}

	// 좌석 등록 폼 경기장별 현재 사용된 좌석 수 확인
	@Override
	public int getUsedCapacityByVenueId(int venueId) {
		return sqlSession.getMapper(AdminSportDAO.class).getUsedCapacityByVenueId(venueId);
	}

	// 경기장 총 수용인원 확인
	@Override
	public int getVenueCapacity(int venueId) {
		return sqlSession.getMapper(AdminSportDAO.class).getVenueCapacity(venueId);
	}

	// 좌석 등록 처리
	@Override
	public int insertSeat(SeatVO seat) {
		return sqlSession.getMapper(AdminSportDAO.class).insertSeat(seat);
	}

	// 새로 등록된 좌석을 포함한 해당 경기장의 모든 좌석 정보 반환
	@Override
	public List<SeatVO> getSeatsForVenue(int venueId) {
		return sqlSession.getMapper(AdminSportDAO.class).getSeatsForVenue(venueId);
	}

	// 경기장 이름으로 경기장 고유번호 가져오기
	@Override
	public Integer getVenueIdByName(String venueName) {
		return sqlSession.getMapper(AdminSportDAO.class).getVenueIdByName(venueName);
	}

	// 새로 등록된 좌석 정보 반환
	@Override
	public SeatVO getRecentlyAddedSeat(int venueId) {
		return sqlSession.getMapper(AdminSportDAO.class).getRecentlyAddedSeat(venueId);
	}

}