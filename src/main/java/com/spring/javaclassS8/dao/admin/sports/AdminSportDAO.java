package com.spring.javaclassS8.dao.admin.sports;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

public interface AdminSportDAO {

	// 스포츠 종목 등록 처리
	int insertSport(String sportName);

	// 모든 스포츠 종목 가져오기
	List<String> getAllSports();

	// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
	Integer getSPortIdByName(String sportName);

	// 스포츠 팀 등록 처리
	int insertTeam(@Param("sportId") int sportId, @Param("teamName") String teamName, @Param("shortName") String shortName);

	// 경기장 등록 처리
	int insertVenue(@Param("sportId") int sportId, @Param("teamId") int teamId, @Param("venueName") String venueName, @Param("address") String address, @Param("capacity") String capacity);

	// 팀 이름으로 팀 고유번호 가져오기
	Integer getTeamIdByName(String teamName);

	// 해당하는 스포츠에 따른 팀 이름 가져오기
	List<TeamVO> getAllTeamsWithSports();

	// 모든 스포츠 디테일
	List<SportVO> getAllSportsDetails();

	// 모든 팀 디테일
	List<TeamVO> getAllTeamsDetails();

	// 모든 경기장 디테일
	List<VenueVO> getAllVenuesDetails();

	// 스포츠 하위에 팀이나 경기장이 있는지 여부 확인
	int countTeamsAndVenuesBySportId(int sportId);

	// 스포츠 종목 삭제
	void deleteSport(int id);

	// 팀 하위에 경기장이 있는지 여부 확인
	int countVenuesByTeamId(int teamId);

	// 팀 삭제
	void deleteTeam(int id);

	// 경기장 삭제
	void deleteVenue(int id);

	// 스포츠 이름 수정
	int updateSport(@Param("id") int id, @Param("sportName") String sportName);

	// 스포츠 팀 정보 수정
	int updateTeam(@Param("id") int id, @Param("teamName") String teamName, @Param("shortName") String shortName);

	// 스포츠 경기장 정보 수정
	int updateVenue(@Param("id") int id, @Param("venueName") String venueName, @Param("address") String address, @Param("capacity") String capacity);

	// 특정 스포츠의 팀 가져오기
	List<TeamVO> getTeamsBySport(String sportName);

	// 특정 팀의 경기장 가져오기
	List<TeamVO> getVenuesByTeam(String teamName);

	// 경기 등록 처리
	int registerGame(GameVO game);

	// 가장 최근 등록된 게임 1개 가져오기
	List<GameVO> getRecentGames(int limit);
}
