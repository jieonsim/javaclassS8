package com.spring.javaclassS8.vo.sport;

import lombok.Data;

@Data
public class VenueVO {
	private int id;
	private int sportId;
	private int teamId;
	private String venueName;
	private String address;
	private int capacity;
	
	private String sportName;
	private String teamName;
}
