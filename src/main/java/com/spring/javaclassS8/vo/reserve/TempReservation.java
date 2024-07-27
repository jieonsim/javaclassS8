package com.spring.javaclassS8.vo.reserve;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TempReservation {
	private int gameId;
	private int seatId;
	private int quantity;
	private int currentDepth;
	private long expirationTime;

}
