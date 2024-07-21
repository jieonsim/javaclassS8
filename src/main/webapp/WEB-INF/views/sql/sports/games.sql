/* 경기 */
CREATE TABLE games (
    id INT NOT NULL AUTO_INCREMENT COMMENT '경기 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    homeTeamId INT NOT NULL COMMENT '홈팀 고유번호',
    awayTeamId INT NOT NULL COMMENT '원정팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    gameDate DATE NOT NULL COMMENT '경기 날짜',
    gameTime TIME NOT NULL COMMENT '경기 시작 시간',
    status ENUM('판매예정', '판매중', '판매종료') NOT NULL DEFAULT '판매예정' COMMENT '경기 상태',
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

SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT update_game_status
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    -- 판매 예정에서 판매중으로 변경
    UPDATE games g
    JOIN sportBookingPolicies p ON g.sportId = p.sportId
    SET g.status = '판매중'
    WHERE g.status = '판매예정'
    AND NOW() >= DATE_SUB(TIMESTAMP(g.gameDate, g.gameTime), 
                          INTERVAL p.bookingOpenDaysBefore DAY) + INTERVAL p.bookingOpenTime HOUR_SECOND;

    -- 판매중에서 판매종료로 변경
    UPDATE games g
    JOIN sportBookingPolicies p ON g.sportId = p.sportId
    SET g.status = '판매종료'
    WHERE g.status = '판매중'
    AND NOW() >= TIMESTAMP(g.gameDate, g.gameTime) + INTERVAL p.bookingCloseMinutesAfterStart MINUTE;
END //

DELIMITER ;


SHOW EVENTS;

SHOW VARIABLES LIKE 'event_scheduler';

SHOW GRANTS FOR CURRENT_USER;

CREATE EVENT test_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
  SELECT 1;
  
  DROP EVENT IF EXISTS test_event;
  
  
DELIMITER //

CREATE EVENT update_game_status_to_on_sale
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    UPDATE games g
    JOIN sportBookingPolicies p ON g.sportId = p.sportId
    SET g.status = '판매중'
    WHERE g.status = '판매예정'
    AND NOW() >= DATE_SUB(TIMESTAMP(g.gameDate, g.gameTime), 
                          INTERVAL p.bookingOpenDaysBefore DAY) + INTERVAL p.bookingOpenTime HOUR_SECOND;
END //

DELIMITER ;

DESCRIBE games;
DESCRIBE sportBookingPolicies;
SELECT COUNT(*) FROM games;
SELECT COUNT(*) FROM sportBookingPolicies;

DELIMITER //

CREATE EVENT update_game_status_simple
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    UPDATE games
    SET status = '판매중'
    WHERE status = '판매예정'
    AND gameDate = CURDATE();  -- 오늘 날짜의 게임만 업데이트
END //

DELIMITER ;

SELECT NOW();

SHOW CREATE TABLE games;
SHOW CREATE TABLE sportBookingPolicies;

SHOW VARIABLES LIKE 'log_error';