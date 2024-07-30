/*좌석 재고*/
CREATE TABLE seat_inventory (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '좌석 재고 고유번호',
    gameId INT NOT NULL COMMENT '경기 고유번호',
    seatId INT NOT NULL COMMENT '좌석 등급 고유번호',
    totalCapacity INT NOT NULL COMMENT '총 좌석 수',
    availableCapacity INT NOT NULL COMMENT '잔여 좌석 수',
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '마지막 업데이트 시간',
    FOREIGN KEY (gameId) REFERENCES games(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    UNIQUE KEY (gameId, seatId) COMMENT '한 경기의 특정 좌석 등급은 하나의 재고만 가질 수 있음'
);

INSERT INTO seat_inventory (gameId, seatId, totalCapacity, availableCapacity)
SELECT 
    g.id AS gameId, 
    s.id AS seatId, 
    s.capacity AS totalCapacity, 
    s.capacity AS availableCapacity
FROM 
    games g
JOIN 
    venues v ON g.venueId = v.id
JOIN 
    seats s ON v.id = s.venueId
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM seat_inventory si 
        WHERE si.gameId = g.id AND si.seatId = s.id
    );