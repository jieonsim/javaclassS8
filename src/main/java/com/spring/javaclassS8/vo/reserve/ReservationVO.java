package com.spring.javaclassS8.vo.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVO {
    private int id;
    private String reservationNumber;
    private int memberId;
    private int gameId;
    private int totalAmount;
    private int ticketAmount;
    private int bookingFee;
    private String status;
    private Timestamp createdAt;
    private Timestamp canceledAt;
    
    // 추가
    private int reservationId;
    private String homeTeamName;
    private String awayTeamName;
    private String gameDate;
    private String gameTime;
    private String cancelDeadline;
}
