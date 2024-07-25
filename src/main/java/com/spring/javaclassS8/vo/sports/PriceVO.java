package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PriceVO {
	private int id;
	private int sportId;
	private int teamId;
	private int venueId;
	private int seatId;
	private int ticketTypeId;
	private int price;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	// 추가
	private String sportName;
	private String teamName;
	private String venueName;
	private String seatName;
	/* private String ticketTypeCategory; */
	private String ticketTypeName;
}
