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

desc games;
 Field      Type      Null Key Default           Extra
 ---------- --------- ---- --- ----------------- ---------------------------
 id         int(11)   NO   PRI NULL              auto_increment
 sportId    int(11)   NO   MUL NULL              
 homeTeamId int(11)   NO   MUL NULL              
 awayTeamId int(11)   NO   MUL NULL              
 venueId    int(11)   NO   MUL NULL              
 gameDate   date      NO   MUL NULL              
 gameTime   time      NO       NULL              
 createdAt  timestamp NO       CURRENT_TIMESTAMP 
 updatedAt  timestamp NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP