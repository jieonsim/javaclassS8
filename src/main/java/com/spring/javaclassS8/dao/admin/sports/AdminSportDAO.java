package com.spring.javaclassS8.dao.admin.sports;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.TicketTypeVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

public interface AdminSportDAO {

	// 스포츠 종목 등록 처리
	int insertSport(String sportName);

	// 모든 스포츠 종목 가져오기
	List<String> getAllSports();

	// 스포츠 종목 이름으로 스포츠 고유번호 가져오기
	Integer getSportIdByName(String sportName);

	// 스포츠 팀 등록 처리
	int insertTeam(@Param("sportId") int sportId, @Param("teamName") String teamName, @Param("shortName") String shortName);

	// 경기장 등록 처리
	int insertVenue(@Param("sportId") int sportId, @Param("teamId") int teamId, @Param("venueName") String venueName, @Param("address") String address,
			@Param("capacity") String capacity);

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

	// 모든 경기 디테일 가져오기(경기 리스트)
	List<GameVO> getAllGamesDetails();

	// 경기 정보 수정
	int updateGame(@Param("id") int id, @Param("gameDate") String gameDate, @Param("gameTime") String gameTime, @Param("status") String status);

	// 경기 삭제
	void deleteGame(int id);

	// 좌석 등록 폼 경기장별 현재 사용된 좌석 수 확인
	int getUsedCapacityByVenueId(int venueId);

	// 경기장 총 수용인원 확인
	int getVenueCapacity(int venueId);

	// 좌석 등록 처리
	int insertSeat(SeatVO seat);

	// 새로 등록된 좌석을 포함한 해당 경기장의 모든 좌석 정보 반환
	List<SeatVO> getSeatsForVenue(int venueId);

	// 경기장 이름으로 경기장 고유번호 가져오기
	Integer getVenueIdByName(String venueName);

	// 새로 등록된 좌석 정보 반환
	SeatVO getRecentlyAddedSeat(int venueId);

	// 이미 등록된 좌석 등급인지 확인
	boolean isSeatExists(SeatVO seat);

	// 종목 이름, 팀 이름, 경기장 이름, 좌석 이름으로 seatId 찾기
	Integer getSeatIdByDetails(@Param("sportName") String sportName, @Param("teamName") String teamName, @Param("venueName") String venueName, @Param("seatName") String seatName);
	
	// 새로 등록된 요금 정보 반환
	PriceVO getRecentlyAddedPrice();
	
	// 모든 좌석 등급 가져오기
	List<SeatVO> getAllSeats();

	// 모든 권종 카테고리 가져오기
	List<String> getAllTicketCategories();

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	List<SeatVO> getSeatsByVenueId(int venueId);

	// 등록 폼 내 권종 카테고리 가져오기
	List<TicketTypeVO> getTicketTypesByCategory(String category);

	// 같은 정보로 이미 등록된 요금인지 확인
	int isPriceExists(PriceVO price);
	
	// 요금 등록 처리
	int insertPrice(PriceVO price);
	
	// 최근 등록된 요금 가져오기
	PriceVO getLastInsertedPrice();

	// 권종 이름으로 tickeTypeId 가져오기
	Integer getTicketTypeIdByName(String ticketTypeName);

	List<SeatVO> getSeatsByVenueName(String venueName);

}
