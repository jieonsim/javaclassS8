
/*이벤트 참여 관리*/
CREATE TABLE event_participants (
    id INT NOT NULL AUTO_INCREMENT COMMENT '참여 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '참여자 회원 고유번호',
    participatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '참여 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id),
    FOREIGN KEY (memberId) REFERENCES members(id)
);