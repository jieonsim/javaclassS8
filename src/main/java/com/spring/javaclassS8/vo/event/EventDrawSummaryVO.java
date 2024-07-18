package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventDrawSummaryVO {
	private int eventId;
	private EventVO.EventCategory eventCategory;
	private String title;
	private String startDate;
	private String endDate;
	private boolean announced;
	private WinnerVO.TicketSentStatus ticketSentStatus;
	private Timestamp drawAt;
}
