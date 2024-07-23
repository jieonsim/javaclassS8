
/*이벤트 추첨*/
CREATE TABLE draws (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '이벤트 추첨 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    drawDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '추첨 일시',
    numberOfWinners INT NOT NULL COMMENT '당첨자 수',
    status ENUM('PENDING', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING' COMMENT '추첨 상태',
    FOREIGN KEY (eventId) REFERENCES events(id)
);