package com.spring.javaclassS8.dao.admin.sports;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.TicketTypeVO;
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
	public Integer getSportIdByName(String sportName) {
		return sqlSession.getMapper(AdminSportDAO.class).getSportIdByName(sportName);
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
	public int updateGame(int id, String gameDate, String gameTime) {
		return sqlSession.getMapper(AdminSportDAO.class).updateGame(id, gameDate, gameTime);
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

	// 이미 등록된 좌석 등급인지 확인
	@Override
	public boolean isSeatExists(SeatVO seat) {
		return sqlSession.getMapper(AdminSportDAO.class).isSeatExists(seat);
	}

	// 종목 이름, 팀 이름, 경기장 이름, 좌석 이름으로 seatId 찾기
	@Override
	public Integer getSeatIdByDetails(String sportName, String teamName, String venueName, String seatName) {
		return sqlSession.getMapper(AdminSportDAO.class).getSeatIdByDetails(sportName, teamName, venueName, seatName);
	}

	// 새로 등록된 요금 정보 반환
	@Override
	public PriceVO getRecentlyAddedPrice() {
		return sqlSession.getMapper(AdminSportDAO.class).getRecentlyAddedPrice();
	}

	// 모든 좌석 등급 가져오기
	@Override
	public List<SeatVO> getAllSeats() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllSeats();
	}

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@Override
	public List<String> getAllTicketCategories() {
		return sqlSession.getMapper(AdminSportDAO.class).getAllTicketCategories();
	}

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@Override
	public List<SeatVO> getSeatsByVenueId(int venueId) {
		return sqlSession.getMapper(AdminSportDAO.class).getSeatsByVenueId(venueId);
	}

	// 등록 폼 내 권종 카테고리 가져오기
	@Override
	public List<TicketTypeVO> getTicketTypesByCategory(String category) {
		return sqlSession.getMapper(AdminSportDAO.class).getTicketTypesByCategory(category);
	}

	// 같은 정보로 이미 등록된 요금인지 확인
	@Override
	public int isPriceExists(PriceVO price) {
		return sqlSession.getMapper(AdminSportDAO.class).isPriceExists(price);
	}

	// 요금 등록 처리
	@Override
	public int insertPrice(PriceVO price) {
		return sqlSession.getMapper(AdminSportDAO.class).insertPrice(price);
	}

	// 최근 등록된 요금 가져오기
	@Override
	public PriceVO getLastInsertedPrice() {
		return sqlSession.getMapper(AdminSportDAO.class).getLastInsertedPrice();
	}

	// 권종 이름으로 tickeTypeId 가져오기
	@Override
	public Integer getTicketTypeIdByName(String ticketTypeName) {
		return sqlSession.getMapper(AdminSportDAO.class).getTicketTypeIdByName(ticketTypeName);
	}

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@Override
	public List<SeatVO> getSeatsByVenueName(String venueName) {
		return sqlSession.getMapper(AdminSportDAO.class).getSeatsByVenueName(venueName);
	}

	// 경기장 고유번호, 스포츠 고유번호, 홈팀 고유번호로 좌석 등급 가져오기
	@Override
	public List<SeatVO> getSeatsByVenueIdAndSportIdAndTeamId(int venueId, int sportId, int teamId) {
		return sqlSession.getMapper(AdminSportDAO.class).getSeatsByVenueIdAndSportIdAndTeamId(venueId, sportId, teamId);
	}
	
	// 경기장 고유번호, 스포츠 고유번호, 홈팀 고유번호로 게임 가져오기
	@Override
	public List<GameVO> getGamesByVenueIdAndSportIdAndHomeTeamId(int venueId, int sportId, int homeTeamId) {
		return sqlSession.getMapper(AdminSportDAO.class).getGamesByVenueIdAndSportIdAndHomeTeamId(venueId, sportId, homeTeamId);
	}

	// 좌석 잔여수량 설정
	@Override
	public void insertSeatInventory(SeatInventoryVO inventory) {
		sqlSession.getMapper(AdminSportDAO.class).insertSeatInventory(inventory);
	}


}