package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventParticipationVO {
	private String eventTitle;
	private String startDate;
	private String endDate;
	private Timestamp participatedAt;
}
