CREATE TABLE prices (
    id INT NOT NULL AUTO_INCREMENT COMMENT '요금 고유번호',
    seatCategoryId INT NOT NULL COMMENT '좌석 등급 고유번호',
    sort VARCHAR(50) NOT NULL COMMENT '권종',
    weekdayPrice INT NOT NULL COMMENT '평일 가격',
    weekendPrice INT NOT NULL COMMENT '주말 가격',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '요금 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '요금 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (seatCategoryId) REFERENCES seat_categories(id),
    UNIQUE KEY (seatCategoryId, sort)
);