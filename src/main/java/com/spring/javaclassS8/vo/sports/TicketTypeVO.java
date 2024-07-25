package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TicketTypeVO {
	private int id;
	private String category;
	private String name;
	private String description;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}
