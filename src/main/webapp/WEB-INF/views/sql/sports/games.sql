/* 경기 */
CREATE TABLE games (
    id INT NOT NULL AUTO_INCREMENT COMMENT '경기 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    homeTeamId INT NOT NULL COMMENT '홈팀 고유번호',
    awayTeamId INT NOT NULL COMMENT '원정팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    gameDate DATE NOT NULL COMMENT '경기 날짜',
    gameTime TIME NOT NULL COMMENT '경기 시작 시간',
    status ENUM('판매예정', '판매중', '판매종료', '경기중', '경기종료') NOT NULL DEFAULT '판매예정' COMMENT '경기 상태',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '경기 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '경기 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (homeTeamId) REFERENCES teams(id),
    FOREIGN KEY (awayTeamId) REFERENCES teams(id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    INDEX idx_game_date (gameDate, gameTime)
);

show tables;