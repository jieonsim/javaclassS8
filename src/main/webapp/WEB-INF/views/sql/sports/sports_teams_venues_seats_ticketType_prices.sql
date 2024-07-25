/* 스포츠 종목 */
CREATE TABLE sports (
    id INT NOT NULL AUTO_INCREMENT COMMENT '스포츠 고유번호',
    sportName VARCHAR(30) NOT NULL COMMENT '스포츠 이름',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    UNIQUE KEY (sportName)
);

/* 팀 */
CREATE TABLE teams (
    id INT NOT NULL AUTO_INCREMENT COMMENT '팀 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    teamName VARCHAR(50) NOT NULL COMMENT '팀 이름',
    shortName VARCHAR(20) NOT NULL COMMENT '팀 축약 이름',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    UNIQUE KEY (teamName),
    UNIQUE KEY (shortName)
);

/* 경기장 */
CREATE TABLE venues (
    id INT NOT NULL AUTO_INCREMENT COMMENT '경기장 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    teamId INT COMMENT '홈팀 고유번호',
    venueName VARCHAR(50) NOT NULL COMMENT '경기장 이름',
    address VARCHAR(255) COMMENT '경기장 주소',
    capacity INT COMMENT '수용 인원',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (teamId) REFERENCES teams(id),
    UNIQUE KEY (venueName)
);

/* 좌석 등급 */
CREATE TABLE seats (
    id INT NOT NULL AUTO_INCREMENT COMMENT '좌석 등급 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    teamId INT NOT NULL COMMENT '팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    seatName VARCHAR(50) NOT NULL COMMENT '좌석 등급 이름',
    capacity INT NOT NULL COMMENT '좌석 수',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '좌석 등급 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '좌석 등급 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (teamId) REFERENCES teams(id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    UNIQUE KEY (sportId, teamId, venueId, seatName)
);

/* 권종 */
CREATE TABLE ticket_types (
    id INT NOT NULL AUTO_INCREMENT COMMENT '권종 고유번호',
    category VARCHAR(20) NOT NULL COMMENT '권종 카테고리',
    name VARCHAR(50) NOT NULL COMMENT '권종 이름',
    description TEXT COMMENT '권종 설명',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);

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