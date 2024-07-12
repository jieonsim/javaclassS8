
/* 이벤트 댓글 */
CREATE TABLE events_comments (
    id INT NOT NULL AUTO_INCREMENT COMMENT '이벤트 댓글 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '댓글 작성자 고유번호',
    comment TEXT NOT NULL COMMENT '댓글 내용',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 업로드 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '이벤트 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id),
    FOREIGN KEY (memberId) REFERENCES members(id),
);