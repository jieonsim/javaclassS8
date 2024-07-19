package com.spring.javaclassS8.vo.sport;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SportVO {
	private int id;
	private String sportName;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}
