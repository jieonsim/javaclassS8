package com.spring.javaclassS8.service.admin.sports;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.admin.sports.AdminSportDAO;
import com.spring.javaclassS8.vo.sports.GameVO;
import com.spring.javaclassS8.vo.sports.PriceVO;
import com.spring.javaclassS8.vo.sports.SeatInventoryVO;
import com.spring.javaclassS8.vo.sports.SeatVO;
import com.spring.javaclassS8.vo.sports.SportVO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.TicketTypeVO;
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
		Integer sportId = adminSportDAO.getSportIdByName(sportName);
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
		Integer sportId = adminSportDAO.getSportIdByName(sportName);
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
		boolean result = adminSportDAO.registerGame(game) > 0;
		if (result) {
			// 새로 등록된 게임에 대한 seat_inventory 생성
			List<SeatVO> seats = adminSportDAO.getSeatsByVenueIdAndSportIdAndTeamId(game.getVenueId(), game.getSportId(), game.getHomeTeamId());
			for (SeatVO seat : seats) {
				SeatInventoryVO inventory = new SeatInventoryVO();
				inventory.setGameId(game.getId());
				inventory.setSeatId(seat.getId());
				inventory.setTotalCapacity(seat.getCapacity());
				inventory.setAvailableCapacity(seat.getCapacity());
				adminSportDAO.insertSeatInventory(inventory);
			}
		}
		return result;
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
	public boolean updateGame(int id, String gameDate, String gameTime) {
		if (gameDate == null || gameDate.trim().isEmpty() || gameTime == null || gameTime.trim().isEmpty()) {
			throw new IllegalArgumentException("경기 날짜와 시간, 상태는 필수 입력 항목입니다.");
		}
		return adminSportDAO.updateGame(id, gameDate, gameTime) > 0;
	}

	// 경기 삭제
	@Override
	@Transactional
	public void deleteGame(int id) throws Exception {
		adminSportDAO.deleteGame(id);
	}

	// 좌석 등록 폼 경기장별 현재 사용된 좌석 수 확인
	@Override
	public int getUsedCapacityByVenueId(int venueId) {
		return adminSportDAO.getUsedCapacityByVenueId(venueId);
	}

	// 좌석 등록 처리
	@Override
	@Transactional
	public SeatVO registerSeat(SeatVO seat) throws Exception {
		// sportName, teamName으로 각각의 id 조회
		Integer sportId = adminSportDAO.getSportIdByName(seat.getSportName());
		Integer teamId = adminSportDAO.getTeamIdByName(seat.getTeamName());

		// null 체크 추가
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠를 찾을 수 없습니다.");
		}
		if (teamId == null) {
			throw new IllegalArgumentException("해당 팀을 찾을 수 없습니다.");
		}

		// 조회한 sportId,teamId 값을 SeatVO에 설정
		seat.setSportId(sportId);
		seat.setTeamId(teamId);

		// 중복 체크
		if (adminSportDAO.isSeatExists(seat)) {
			throw new IllegalStateException("이미 등록된 좌석 등급입니다.");
		}

		// 경기장 총 수용인원 확인
		int venueCapacity = adminSportDAO.getVenueCapacity(seat.getVenueId());

		// 현재 사용 중인 좌석 수 확인
		int usedCapacity = adminSportDAO.getUsedCapacityByVenueId(seat.getVenueId());

		// 새로운 좌석 추가 시 총 수용인원을 초과하는지 확인
		if (usedCapacity + seat.getCapacity() > venueCapacity) {
			throw new IllegalStateException("좌석 추가 시 경기장의 총 수용인원을 초과합니다.");
		}

		// 좌석 등록 처리
		int result = adminSportDAO.insertSeat(seat);

		if (result > 0) {
	        // 이 시점에서 seat 객체의 id가 설정되어 있어야 함
	        System.out.println("Inserted seat ID: " + seat.getId());

	        // 새로 등록된 좌석에 대한 seat_inventory 생성
	        List<GameVO> games = adminSportDAO.getGamesByVenueIdAndSportIdAndHomeTeamId(
	            seat.getVenueId(), seat.getSportId(), seat.getTeamId());
	        
	        for (GameVO game : games) {
	            SeatInventoryVO inventory = new SeatInventoryVO();
	            inventory.setGameId(game.getId());
	            inventory.setSeatId(seat.getId());
	            System.out.println("Creating inventory for game " + game.getId() + " and seat " + seat.getId());
	            inventory.setTotalCapacity(seat.getCapacity());
	            inventory.setAvailableCapacity(seat.getCapacity());
	            adminSportDAO.insertSeatInventory(inventory);
	        }

	        return seat;
	    } else {
	        throw new IllegalStateException("좌석 등록에 실패했습니다.");
	    }
	}

	// 모든 좌석 등급 가져오기
	@Override
	public List<SeatVO> getAllSeats() {
		return adminSportDAO.getAllSeats();
	}

	// 모든 권종 카테고리 가져오기
	@Override
	public List<String> getAllTicketCategories() {
		return adminSportDAO.getAllTicketCategories();
	}

	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@Override
	public List<SeatVO> getSeatsByVenueId(int venueId) {
		return adminSportDAO.getSeatsByVenueId(venueId);
	}

	// 등록 폼 내 권종 카테고리 가져오기
	@Override
	public List<TicketTypeVO> getTicketTypesByCategory(String category) {
		return adminSportDAO.getTicketTypesByCategory(category);
	}

	// 요금 등록 처리
	@Override
	@Transactional
	public PriceVO registerPrice(PriceVO price) throws IllegalArgumentException {

		// 이름으로 각각의 id 조회
		Integer sportId = adminSportDAO.getSportIdByName(price.getSportName());
		Integer teamId = adminSportDAO.getTeamIdByName(price.getTeamName());
		Integer venueId = adminSportDAO.getVenueIdByName(price.getVenueName());
		Integer seatId = adminSportDAO.getSeatIdByDetails(price.getSportName(), price.getTeamName(), price.getVenueName(), price.getSeatName());
		Integer ticketTypeId = adminSportDAO.getTicketTypeIdByName(price.getTicketTypeName());

		// null 체크
		if (sportId == null) {
			throw new IllegalArgumentException("해당 스포츠를 찾을 수 없습니다.");
		}
		if (teamId == null) {
			throw new IllegalArgumentException("해당 팀을 찾을 수 없습니다.");
		}
		if (venueId == null) {
			throw new IllegalArgumentException("해당 경기장을 찾을 수 없습니다.");
		}
		if (seatId == null) {
			throw new IllegalArgumentException("해당 좌석을 찾을 수 없습니다.");
		}
		if (ticketTypeId == null) {
			throw new IllegalArgumentException("해당 권종을 찾을 수 없습니다.");
		}

		// 조회한 id 값을 PriceVO에 설정
		price.setSportId(sportId);
		price.setTeamId(teamId);
		price.setVenueId(venueId);
		price.setSeatId(seatId);
		price.setTicketTypeId(ticketTypeId);

		// 같은 정보로 이미 등록된 요금인지 확인
		int priceExists = adminSportDAO.isPriceExists(price);
		if (priceExists > 0) {
			throw new IllegalArgumentException("해당 정보로 이미 등록된 요금이 있습니다.");
		}

		int result = adminSportDAO.insertPrice(price);

		if (result > 0) {
			return adminSportDAO.getRecentlyAddedPrice();
		} else {
			throw new IllegalStateException("요금 등록에 실패했습니다.");
		}
	}
	
	// 등록 폼 내 선택된 경기장에 따른 좌석 등급 가져오기
	@Override
	public List<SeatVO> getSeatsByVenueName(String venueName) {
		return adminSportDAO.getSeatsByVenueName(venueName);
	}
	
	// 스포츠, 팀, 경기장으로 등록된 게임이 있는지
	@Override
	public boolean hasGames(String type, int id) {
	    return adminSportDAO.countGamesByTypeAndId(type, id) > 0;
	}
}
