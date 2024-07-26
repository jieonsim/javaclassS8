/* 예매 상세 */
CREATE TABLE booking_details (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매 상세 고유번호',
    bookingId INT NOT NULL COMMENT '예매 고유번호',
    seatId INT NOT NULL COMMENT '좌석 등급 고유번호',
    ticketTypeId INT NOT NULL COMMENT '권종 고유번호',
    quantity INT NOT NULL COMMENT '수량',
    price DECIMAL(10, 2) NOT NULL COMMENT '단가',
    FOREIGN KEY (bookingId) REFERENCES bookings(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    FOREIGN KEY (ticketTypeId) REFERENCES ticket_types(id)
);


CREATE TABLE booking_details (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매 상세 고유번호',
    bookingId INT NOT NULL COMMENT '예매 고유번호',
    seatId INT NOT NULL COMMENT '좌석 등급 고유번호',
    ticketTypeId INT NOT NULL COMMENT '권종 고유번호',
    quantity INT NOT NULL COMMENT '수량',
    ticketPrice DECIMAL(10, 2) NOT NULL COMMENT '티켓 단가',
    FOREIGN KEY (bookingId) REFERENCES bookings(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    FOREIGN KEY (ticketTypeId) REFERENCES ticket_types(id)
);