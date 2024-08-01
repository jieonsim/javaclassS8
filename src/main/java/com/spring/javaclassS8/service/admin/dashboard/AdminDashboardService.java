package com.spring.javaclassS8.service.admin.dashboard;

import java.util.Map;

public interface AdminDashboardService {

    Map<String, Object> getReservationData();
    Map<String, Object> getSportsPieData();
    Map<String, Object> getBaseballTeamData();
    Map<String, Object> getFootballTeamData();
    Map<String, Object> getAdvanceTicketData();
    Map<String, Object> getTicketTypeData();

}
