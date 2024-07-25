/* 요금 */
CREATE TABLE prices (
    id INT NOT NULL AUTO_INCREMENT COMMENT '요금 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    teamId INT NOT NULL COMMENT '팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    seatId INT NOT NULL COMMENT '좌석 등급 고유번호',
    ticketTypeId INT NOT NULL COMMENT '권종 고유번호',
	price INT NOT NULL COMMENT '요금',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '요금 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '요금 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (teamId) REFERENCES teams(id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    UNIQUE KEY (sportId, teamId, venueId, seatId, ticketTypeId)
);

