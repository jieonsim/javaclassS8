
/* 이벤트 당첨자*/
CREATE TABLE winners (
    id INT NOT NULL AUTO_INCREMENT COMMENT '이벤트 당첨 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '당첨자 회원 고유번호',
    advanceTicektId NOT NULL COMMENT '예매권 고유번호',
    announcementAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '당첨자 추첨 일시'
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id),
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (advanceTicektId) REFERENCES advance_ticekts(id)
);
