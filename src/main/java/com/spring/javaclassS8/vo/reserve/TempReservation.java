package com.spring.javaclassS8.vo.reserve;

import java.util.List;

import lombok.Data;

@Data
public class TempReservation {
	private int gameId;
	private int seatId;
	private int ticketAmount;
	private int currentDepth;
	private long expirationTime;
    private List<TicketVO> selectedTickets;
    private List<String> selectedAdvanceTickets;
    private int totalAmount;
    private int bookingFee;
    private List<SeatDetailVO> seatDetails;
    private List<Integer> advanceTicketIds;

	public TempReservation(int gameId, int seatId, int ticketAmount, int currentDepth, long expirationTime) {
		this.gameId = gameId;
		this.seatId = seatId;
		this.ticketAmount = ticketAmount;
		this.currentDepth = currentDepth;
		this.expirationTime = expirationTime;
	}
}
