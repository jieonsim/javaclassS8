package com.spring.javaclassS8.vo.reserve;

import lombok.Data;

@Data
public class TempReservation {
	private int gameId;
	private String seatName;
	private int quantity;
	private int currentDepth;
	private long expirationTime;

	public TempReservation(int gameId, String seatName, int quantity, int currentDepth, long expirationTime) {
		this.gameId = gameId;
		this.seatName = seatName;
		this.quantity = quantity;
		this.currentDepth = currentDepth;
		this.expirationTime = expirationTime;
	}
}
