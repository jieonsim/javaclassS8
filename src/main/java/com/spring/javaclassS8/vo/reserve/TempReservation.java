package com.spring.javaclassS8.vo.reserve;

import java.util.List;

import lombok.Data;

@Data
public class TempReservation {
	private int gameId;
	private int seatId;
	private int quantity;
	private int currentDepth;
	private long expirationTime;

	public TempReservation(int gameId, int seatId, int quantity, int currentDepth, long expirationTime) {
		this.gameId = gameId;
		this.seatId = seatId;
		this.quantity = quantity;
		this.currentDepth = currentDepth;
		this.expirationTime = expirationTime;
	}
	
    private List<TicketVO> selectedTickets;
    private List<String> selectedAdvanceTickets;
}
