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
	
	// 이번달 예매수수료 수익
	int getCurrentMonthRevenue();

	Map<String, Object> getReservationData();

	Map<String, Object> getSportsPieData();

	Map<String, Object> getBaseballTeamData();

	Map<String, Object> getFootballTeamData();

	Map<String, Object> getAdvanceTicketData();

	Map<String, Object> getTicketTypeData();

}
