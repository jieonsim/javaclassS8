
/* 좌석 등급 */
CREATE TABLE seat_categories (
    id INT NOT NULL AUTO_INCREMENT COMMENT '좌석 등급 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    categoryName INT NOT NULL COMMENT '등급 이름',
    capacity INT NOT NULL COMMENT '좌석 수',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '좌석 등급 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '좌석 등급 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    UNIQUE(categoryName);
);