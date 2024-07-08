package com.spring.javaclassS8.vo.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AutoLoginTokenVO {
	private int id;
	private int memberId;
	private String token;
	private Timestamp expiresAt;
	private Timestamp createdAt;
}
