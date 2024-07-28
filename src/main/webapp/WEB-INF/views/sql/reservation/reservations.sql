CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservationNumber CHAR(10) NOT NULL,  -- 10자리 고정 길이 숫자
    memberId INT NOT NULL,
    gameId INT NOT NULL,
    totalAmount INT NOT NULL,
    ticketAmount INT NOT NULL,
    bookingFee INT NOT NULL,
    status ENUM('예매완료', '취소완료') NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    canceledAt TIMESTAMP NULL,
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    UNIQUE KEY (reservationNumber)
);

CREATE TABLE reservation_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservationId INT NOT NULL,
    seatId INT NOT NULL,
    ticketTypeId INT NOT NULL,
    seatBlock INT NOT NULL,  -- 101~109 사이의 블록 번호
    seatRow INT NOT NULL,    -- 1~10 사이의 열 번호
    seatNumber INT NOT NULL, -- 1~99 사이의 좌석 번호
    price INT NOT NULL,
    FOREIGN KEY (reservationId) REFERENCES reservations(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    FOREIGN KEY (ticketTypeId) REFERENCES ticket_types(id)
);