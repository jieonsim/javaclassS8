package com.spring.javaclassS8.vo.reserve;

import lombok.Data;

@Data
public class ReservationResponse {
	private boolean success;
	private String reservationNumber;
	private String message;

	// success 필드를 포함하는 새로운 생성자
	public ReservationResponse(boolean success, String reservationNumber, String message) {
		this.success = success;
		this.reservationNumber = reservationNumber;
		this.message = message;
	}

	// 기존 생성자를 유지하되, success를 false로 설정
	public ReservationResponse(String reservationNumber, String message) {
		this(false, reservationNumber, message);
	}
}