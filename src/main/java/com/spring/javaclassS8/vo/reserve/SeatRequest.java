package com.spring.javaclassS8.vo.reserve;

import lombok.Data;

@Data
public class SeatRequest {
    private int seatId;
    private int ticketTypeId;
    private int price;
}
