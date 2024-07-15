package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventParticipantVO {
	private int id;
	private int eventId;
	private int memberId;
	private Status status;
	private Timestamp participatedAt;
	private Timestamp cancelledAt;
	
	public enum Status {
		ACTIVE, CANCELLED
	}
}
