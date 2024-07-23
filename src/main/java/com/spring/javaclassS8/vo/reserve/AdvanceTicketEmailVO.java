package com.spring.javaclassS8.vo.reserve;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdvanceTicketEmailVO {
	private int id;
	private int advanceTicketId;
	private int adminId;
	private String recipientEmail;
	private Integer recipientMemberId;
	private AdvanceTicketEmailStatus status;
	private int retryCount;
	private Timestamp sentAt;
	private Timestamp lastAttemptAt;
	private String emailContent;

	public enum AdvanceTicketEmailStatus {
		SENT, FAILED, PENDING
	}
}
