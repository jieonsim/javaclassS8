package com.spring.javaclassS8.vo.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int id;
	private String email;
	private String password;
	private String name;
	private String phone;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Role role;
	private Timestamp lastLoginAt;
	private int status;
	private Timestamp statusChangedAt;
	private String suspensionReason;
	
	public enum Role {
		USER, ADMIN
	}
}
