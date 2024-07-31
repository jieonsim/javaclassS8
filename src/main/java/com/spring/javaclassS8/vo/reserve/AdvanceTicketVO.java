package com.spring.javaclassS8.vo.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdvanceTicketVO {
	private int id;
	private int adminId;
	private String advanceTicketNumber;
	private boolean used;
	private Timestamp expiresAt;
	private Timestamp issuedAt;
	private Timestamp usedAt;
	private Integer usedByMemberId;
	private String formattedExpiresAt;
	// usedByMemberId는 null 허용이 필요해 Integer로 처리
}
