show tables;

/* 스포츠 종목 */
CREATE TABLE sports (
    id INT NOT NULL AUTO_INCREMENT COMMENT '스포츠 고유번호',
    sportName VARCHAR(30) NOT NULL COMMENT '스포츠 이름',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    UNIQUE KEY (sportName)
);