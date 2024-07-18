package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WinnerDetailVO {
	private int winnerId;
	private String name;
	private String email;
	private String advanceTicketNumber;
	
	private Timestamp expiresAt;
}
