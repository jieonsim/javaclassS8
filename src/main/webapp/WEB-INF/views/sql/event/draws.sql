CREATE TABLE draws (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '추첨 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    drawDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '추첨일시',
    numWinners INT NOT NULL COMMENT '당첨자 수',
    isAnnounced BOOLEAN DEFAULT FALSE  COMMENT '당첨자 발표 여부',
    FOREIGN KEY (eventId) REFERENCES events(id)
);