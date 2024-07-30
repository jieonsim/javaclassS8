/* 권종 */
CREATE TABLE ticket_types (
    id INT NOT NULL AUTO_INCREMENT COMMENT '권종 고유번호',
    category VARCHAR(20) NOT NULL COMMENT '권종 카테고리',
    name VARCHAR(50) NOT NULL COMMENT '권종 이름',
    description TEXT COMMENT '권종 설명',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);

desc ticket_types;
 Field       Type        Null Key Default           Extra
 ----------- ----------- ---- --- ----------------- ---------------------------
 id          int(11)     NO   PRI NULL              auto_increment
 category    varchar(20) NO       NULL              
 name        varchar(50) NO   UNI NULL              
 description text        YES      NULL              
 createdAt   timestamp   NO       CURRENT_TIMESTAMP 
 updatedAt   timestamp   NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
 
select * from ticket_types;
 id category name    description                                                                                                 createdAt             updatedAt
 -- -------- ------- ----------------------------------------------------------------------------------------------------------- --------------------- ---------------------
  1 일반(정가)   일반      NULL                                                                                                        2024-07-25 18:15:52.0 2024-07-25 22:27:22.0
  2 일반(정가)   청소년     청소년(2024년 기준 2006년~2011년)만 입장 가능합니다.(청소년 입장권으로 성인 입장 불가) - 권종 선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 차액결제 불가) 2024-07-25 18:15:52.0 2024-07-25 18:15:52.0
  3 일반(정가)   어린이     어린이(36개월이상~초등학생)만 입장 가능합니다.(어린이 입장권으로 청소년/성인 입장 불가) - 권종 선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 차액결제 불가)      2024-07-25 18:15:52.0 2024-07-25 18:15:52.0
  4 일반할인     경로      본인만 할인되며 매표소에서 신분증 제출 후 발권 가능합니다.(무인발권기 불가)                                                                 2024-07-25 18:15:52.0 2024-07-25 18:15:52.0
  5 일반할인     국가유공자   본인만 할인되며 매표소에서 국가유공자증 제출 후 발권 가능합니다.(무인발권기 불가)                                                              2024-07-25 18:15:52.0 2024-07-25 18:15:52.0
  6 일반할인     장애인     매표소에서 장애인증 확인 후 발권 가능합니다.(무인발권기 불가) 동반인은 추가 1인까지 할인되며 좌석 2개 선택 후 장애인 권종으로 2매 구매바랍니다.                        2024-07-25 18:15:52.0 2024-07-25 18:15:52.0
  8 인증할인     스포츠 예매권 스포츠 티켓을 무료로 예매할 수 있는 결제수단입니다. 보유한 예매권번호를 입력해야합니다.   
  




SELECT DISTINCT category FROM ticket_types;

INSERT INTO ticket_types (category, name, description) VALUES
-- 일반(정가) 카테고리
('일반(정가)', '성인/일반', NULL),
('일반(정가)', '청소년', '청소년(2024년 기준 2006년~2011년)만 입장 가능합니다.(청소년 입장권으로 성인 입장 불가) - 권종 선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 차액결제 불가)'),
('일반(정가)', '어린이', '어린이(36개월이상~초등학생)만 입장 가능합니다.(어린이 입장권으로 청소년/성인 입장 불가) - 권종 선택 실수로 인한 예매 건은 현장에서 교환/환불 불가합니다.(현장 차액결제 불가)'),
-- 일반할인 카테고리
('일반할인', '경로', '본인만 할인되며 매표소에서 신분증 제출 후 발권 가능합니다.(무인발권기 불가)'),
('일반할인', '국가유공자', '본인만 할인되며 매표소에서 국가유공자증 제출 후 발권 가능합니다.(무인발권기 불가)'),
('일반할인', '장애인', '매표소에서 장애인증 확인 후 발권 가능합니다.(무인발권기 불가) 동반인은 추가 1인까지 할인되며 좌석 2개 선택 후 장애인 권종으로 2매 구매바랍니다.'),
('일반할인', '복지할인', '65세 이상 경로, 국가유공, 장애인 본인에 한해 할인 적용됩니다. 매표소에서만 티켓으로 교환 가능하며, 증빙서류 확인 후 티켓으로 발권 가능합니다.(무인발권기 불가)'),
-- 인증할인 카테고리
('인증할인', '스포츠 예매권', '스포츠 티켓을 무료로 예매할 수 있는 결제수단입니다. 보유한 예매권번호를 입력해야합니다.');