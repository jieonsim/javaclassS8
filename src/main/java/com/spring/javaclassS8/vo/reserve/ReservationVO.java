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
    private String memberName;
    private String gameDate;
    private String gameTime;
    private String venueName;
    private String paymentMethod;
    private String cancelDeadline;
    private int totalTicketPrice; // 모든 티켷 가격의 합계
    private int advanceTicketDiscount; // 예매권 할인 금액
    private String cancelPeriod; // 취소 가능 기간
    private String formattedCreatedAt;
    private String formattedCancelDeadline;
}
