package com.spring.javaclassS8.vo.reserve;

import lombok.Data;

@Data
public class ReservationDetailVO {
    private int id;
    private int reservationId;
    private int seatId;
    private int ticketTypeId;
    private int seatBlock;
    private int seatRow;
    private int seatNumber;
    private int ticketPrice;
}
