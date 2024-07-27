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

/*예매권*/
CREATE TABLE advance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매권 고유번호',
    adminId INT NOT NULL COMMENT '예매권 생성한 관리자 고유번호',
    advanceTicketNumber VARCHAR(16) NOT NULL COMMENT '예매권 번호',
    used BOOLEAN DEFAULT FALSE COMMENT '예매권 사용 여부',
    expiresAt TIMESTAMP NOT NULL COMMENT '예매권 만료일시',
    issuedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매권 발행일시',
    usedAt TIMESTAMP NULL COMMENT '예매권 사용일시',
    usedByMemberId INT NULL COMMENT '예매권 사용한 회원 고유번호',
    FOREIGN KEY (adminId) REFERENCES members(id),
    FOREIGN KEY (usedByMemberId) REFERENCES members(id),
    UNIQUE KEY (advanceTicketNumber)
);

/* 예매권 등록*/
CREATE TABLE registered_advance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '등록 고유번호',
    memberId INT NOT NULL COMMENT '예매권 등록한 회원 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    registeredAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매권 등록일시',
    FOREIGN KEY (memberId) REFERENCES members(id),d
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    UNIQUE KEY (advanceTicketId)
);

/* 경기 */
CREATE TABLE games (
    id INT NOT NULL AUTO_INCREMENT COMMENT '경기 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    homeTeamId INT NOT NULL COMMENT '홈팀 고유번호',
    awayTeamId INT NOT NULL COMMENT '원정팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    gameDate DATE NOT NULL COMMENT '경기 날짜',
    gameTime TIME NOT NULL COMMENT '경기 시작 시간',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '경기 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '경기 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (homeTeamId) REFERENCES teams(id),
    FOREIGN KEY (awayTeamId) REFERENCES teams(id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    INDEX idx_game_date (gameDate, gameTime)
);

/* 스포츠별 예매 정책 */
CREATE TABLE sport_booking_policies (
    id INT NOT NULL AUTO_INCREMENT COMMENT '정책 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    bookingOpenDaysBefore INT NOT NULL DEFAULT 7 COMMENT '예매 오픈일',
    bookingOpenTime TIME NOT NULL DEFAULT '11:00:00' COMMENT '예매 오픈 시간',
    bookingCloseMinutesAfterStart INT NOT NULL DEFAULT 60 COMMENT '예매 마감 시간(경기 시작 후 분)',
    cancellationDeadlineMinutesBeforeStart INT NOT NULL DEFAULT 120 COMMENT '취소 가능 시간(경기 시작 전 분)',
    maxTicketsPerBooking INT NOT NULL DEFAULT 8 COMMENT '1회 예매 시 최대 구매 가능 티켓 수',
    maxTotalTickets INT NOT NULL DEFAULT 16 COMMENT '경기당 총 구매 가능 티켓 수',
    bookingFeePerTicket DECIMAL(10,2) NOT NULL DEFAULT 1000 COMMENT '예매수수료',
    cancellationFeeRate DECIMAL(5,2) NOT NULL DEFAULT 10 COMMENT '취소수수료',
    fullRefundUntilMidnight BOOLEAN NOT NULL DEFAULT TRUE COMMENT '예매 당일 자정까지 전액 환불 가능 여부',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '정책 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '정책 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    UNIQUE KEY (sportId)
);

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