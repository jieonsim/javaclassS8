package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SeatVO {
	private int id;
	private int sportId;
	private int teamId;
	private int venueId;
	private String seatName;
	private int capacity;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	// 추가
	private String sportName;
	private String teamName;
	private String venueName;
	private String seatColor;
}
