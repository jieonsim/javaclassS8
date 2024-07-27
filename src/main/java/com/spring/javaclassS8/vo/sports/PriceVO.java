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
	
	// 경기 관련 추가
	private String sportName;
	private String teamName;
	private String venueName;
	private String seatName;
	
	// 권종 관련 추가
	private String category; // 권종 카테고리
	private String ticketTypeName;
	private String description;
}
