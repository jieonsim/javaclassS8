package com.spring.javaclassS8.vo.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RegisteredAdvanceTicketVO {
	private int id;
	private int memberId;
	private int advanceTicketId;
	private Timestamp registeredAt;
}
