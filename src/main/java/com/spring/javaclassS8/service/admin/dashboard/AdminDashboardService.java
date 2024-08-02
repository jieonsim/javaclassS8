package com.spring.javaclassS8.service.admin.dashboard;

import java.util.Map;

public interface AdminDashboardService {

	// 현재까지 총 예매완료 건 수
	int getTotalCompletedReservations();

	// 현재 진행 중인 이벤트 건 수
	int getOngoingEvents();

	// 활동 중인 회원 수
	int getActiveMembers();

	// 현재 예매 오픈된 경기 수
	int getOpenGames();
	
	// 예매 대비 취소율
	double getCancellationRate();
	
	// 총 예매수수료 수익
	int getTotalBookingFeeRevenue();
	
	// 최근 6개월 간 예매 매출액
	Map<String, Object> getReservationData();
	
	// 스포츠 종목별 예매율
	Map<String, Object> getSportsPieData();

	// 야구 팀별 홈경기 예매율
	Map<String, Object> getBaseballTeamData();
	
	// 축구 팀별 홈경기 예매율
	Map<String, Object> getFootballTeamData();
	
	// 예매권 발행 수 대비 사용 현황
	Map<String, Object> getAdvanceTicketData();
	
	// 권종별 판매 현황
	Map<String, Object> getTicketTypeData();

}
