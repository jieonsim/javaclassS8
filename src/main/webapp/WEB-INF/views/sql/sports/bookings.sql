/* 예매 */
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매 고유번호',
    memberId INT NOT NULL COMMENT '회원 고유번호',
    gameId INT NOT NULL COMMENT '경기 고유번호',
    bookingStatus ENUM('예매완료', '취소') NOT NULL DEFAULT '예매완료' COMMENT '예매 상태',
    totalPrice DECIMAL(10, 2) NOT NULL COMMENT '총 결제 금액',
    bookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매 일시',
    cancelDate TIMESTAMP NULL COMMENT '취소 일시',
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (gameId) REFERENCES games(id)
);