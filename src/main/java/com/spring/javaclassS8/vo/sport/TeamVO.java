package com.spring.javaclassS8.vo.sport;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TeamVO {
	private int id;
	private int sportId;
	private String teamName;
	private String shortName;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	private String sportName; // 해당하는 스포츠에 따른 팀 이름 가져오기 위해 추가
}
