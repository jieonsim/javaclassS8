package com.spring.javaclassS8.vo.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdvanceTicketInfoVO {
    private int id;
    private String advanceTicketNumber;
    private Timestamp issuedAt;
    private Timestamp expiresAt;
    private boolean used;
    private String isRegistered;
    private String usageStatus;
    private Timestamp registeredAt;
    private String registerEmail;
    private Timestamp usedAt;
    private String userEmail;
    private String reservationNumber;
    private String adminEmail;
}
