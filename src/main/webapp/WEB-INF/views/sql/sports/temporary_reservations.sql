CREATE TABLE temporary_reservations (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '임시 예약 고유번호',
    memberId INT NOT NULL COMMENT '회원 고유번호',
    gameId INT NOT NULL COMMENT '경기 고유번호',
    seatId INT NOT NULL COMMENT '좌석 등급 고유번호',
    quantity INT NOT NULL COMMENT '선택한 매수',
    currentDepth INT NOT NULL COMMENT '현재 진행 중인 depth',
    reservationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '임시 예약 시작 시간',
    expirationTime TIMESTAMP COMMENT '임시 예약 만료 시간',
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    FOREIGN KEY (seatId) REFERENCES seats(id)
);