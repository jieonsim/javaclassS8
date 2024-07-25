
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
