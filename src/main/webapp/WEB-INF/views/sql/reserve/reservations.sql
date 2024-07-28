/* 예매 테이블 */
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
