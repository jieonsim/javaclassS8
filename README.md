# ⚾ 티켓챔프 Ticket Champ 🏀
티켓챔프는 스포츠 티켓을 예매할 수 있는 웹 애플리케이션으로,<br>
예매는 물론 이벤트 및 예매권을 통한 사용자 참여 독려 및 어드민 운영 관리 기능을 제공합니다.

> 제작 기간 : 2024.06.24 - 2024.08.06<br>
> 인원 : 1명 (개인 프로젝트)

👉🏻 [사이트 바로가기](http://49.142.157.251:9090/javaclassS8/)
- Test ID : `zieonsim@gmail.com`
- Test PW : `zieonsim1`

💁🏻 [프로젝트 PPT - PDF로 바로보기](https://drive.google.com/file/d/1bmj5CtD9-SUZuZjP3VzfuW1oEs7kOt9n/view?usp=sharing)
<br>

📹 [발표 영상 - 유튜브로 바로보기](https://youtu.be/gPB3dMz0ztY)

💭 [기획 및 제작과정 - PDF로 바로보기](https://docs.google.com/spreadsheets/d/1e1T5jBh-7tM7CjCwONiFs9F7OIGQVMUJmeAd8-6eK-Q/edit?usp=sharing)
<hr>

## 1️⃣ 사용 기술 스택
<div align="center">
<h4>Backend</h4>
<img src="https://img.shields.io/badge/Java8-007396?style=flat-square&logo=OpenJDK&logoColor=white">
<img src="https://img.shields.io/badge/Spring Framework-6DB33F?style=flat-square&logo=Spring&logoColor=white">
<img src="https://img.shields.io/badge/Spring Security-00AB77?style=flat-square&amp;logo=springsecurity&amp;logoColor=white">
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=flat-square&amp;logo=apachetomcat&amp;logoColor=black">
<br>
  
<h4>Database</h4>
<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/MyBatis-9EB0A2?style=flat-square&amp;logo=&amp;logoColor=white">
<br>
  
<h4>Frontend</h4>
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat-square&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=flat-square&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/JSP-BEFCFF?style=flat-square&amp;logo=&amp;logoColor=white">
<img src="https://img.shields.io/badge/html5-E34F26?style=flat-square&logo=html5&logoColor=white"> 
<img src="https://img.shields.io/badge/css-1572B6?style=flat-square&logo=css3&logoColor=white"> 
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white">
<br>

<h4>Library</h4>
<img src="https://img.shields.io/badge/ckeditor4-0287D0?style=flat-square&logo=ckeditor4&logoColor=white">
<img src="https://img.shields.io/badge/PortOne-FF6633?style=flat-square&logo=PortOne&logoColor=white">
<img src="https://img.shields.io/badge/chartjs-FF6384?style=flat-square&logo=chartdotjs&logoColor=white">
<img src="https://img.shields.io/badge/swiper-6332F6?style=flat-square&logo=swiper&logoColor=white">
</div>
<hr>

## 2️⃣ 주요 기능
<div align="center">

| **기능 구분** | **세부 기능** |
|:---------------:|---------------|
| **회원**   | - 회원가입 <br> - 로그인 <br> - 아이디 찾기 <br> - 비밀번호 찾기 <br> - 마이페이지 <ul><li>예매확인/취소</li><li>예매권 등록 및 사용내역 확인</li><li>참여 이벤트 확인</li><li>회원정보수정</li><li>회원탈퇴</li></ul>  |
| **스포츠** | - 각 스포츠별 경기 및 예매 전체일정 리스트 <br> - 각 구단별 경기 및 예매 일정 리스트 |
| **이벤트** | - 이벤트 CRUD <br> - 이벤트 당첨자 추첨 <br> - 이벤트 당첨자 대상으로 예매권 발행 및 안내 메일 발송 |
| **예매**   | - 각 경기별 예매 <br> - 발행된 예매권 사용 가능 <br> - 포트원 결제 모듈 및 KG 이니시스를 이용한 결제 지원 |
| **어드민** | - 스포츠, 구단, 경기장, 좌석 등급, 요금, 경기 관리 <br> - 회원 관리 <br> - 이벤트 관리 <br> - 예매권 관리 <br> - 통계 관리(차트) |

</div>

<hr>

## 3️⃣ 기능별 화면 및 소개
### ✔ 메인 화면
- 아직 예매가 오픈되지 않은 경기의 일정과 예매 오픈일시를 종목별로 확인
- 예매 오픈 시간이 지났을 경우 '예매하기' 버튼으로 활성화
- Swiper 라이브러리 이용
<p align="center">
  <img src="https://github.com/user-attachments/assets/dab1d89d-3304-4cbe-9e2c-109eea887f35" alt="메인화면 GIF" width="70%">
</p>

### ✔ 회원가입
- 이메일, 비밀번호, 이름, 휴대폰 번호 입력
- 프론트엔드 유효성 검사 처리
- 입력한 이메일로 인증번호 발송(SMTP)
- 이메일 인증번호 발송 전 중복 체크
- Spring security를 이용한 비밀번호 암호화
<p align="center">
<img src="https://github.com/user-attachments/assets/83426e4e-da98-48a0-9633-f5f65972abd6" alt="회원가입 GIF" width="70%">
</p>

### ✔ 로그인
- 아이디 / 비밀번호 일치여부 확인
- 자동 로그인 구현
- 로그인 성공 시 홈화면으로 이동 및 헤더에 로그인한 이메일 아이디 노출
<p align="center">
<img src="https://github.com/user-attachments/assets/543a0e88-00fe-4b25-a2a3-31df71a919ff" alt="로그인 GIF" width="70%">
</p>

### ✔ 아이디 찾기
- 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
- 계정이 존재할 경우 마스킹된 이메일 아이디와 가입일자를 안내
- 입력한 정보로 가입된 아이디가 여러 개일 경우 로그인할 아이디 선택 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/f30608e5-0fa8-46f3-a23a-1dcbf73e6102" alt="아이디찾기 GIF" width="70%">
</p>

### ✔ 비밀번호 찾기
- 이름 + 이메일 아이디 조합으로 계정 유무 확인
- 계정이 존재할 경우 입력한 이메일로 인증번호 발송
- 인증번호 일치 시 새로운 비밀번호 설정 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/f69b97a9-05c3-48db-b65e-c8c00770a63c" alt="비밀번호찾기 GIF" width="70%">
</p>

### ✔ 스포츠별 전체일정 / 구단별 예매하기 페이지
#### ☑️ 공통
예매가 오픈되기 전에는 오픈 예정 일시가 표시되며, 오픈 후에는 '예매하기' 버튼이 표시됨
#### ☑️ 스포츠별 전체 일정
오늘부터 이번 달 마지막 경기까지의 일정 확인
#### ☑️ 구단별 예매하기
- 오늘부터 다음 달 마지막 경기까지 선택한 구단의 홈 경기를 확인할 수 있음
- 오늘 경기의 경우, 예매 마감 시간이 지나면 일정에서 자동으로 제거
<p align="center">
<img src="https://github.com/user-attachments/assets/a8fe6727-eccf-4d1f-8911-1c6e4817e847" alt="스포츠별 전체일정 구단별 예매하기 페이지 GIF" width="70%">
</p>

#### ☑️ 실시간 예매 오픈 알림
당일 예매 오픈 경기 강조 표시로 신속한 티켓 구매 기회 제공
<p align="center">
<img src="https://github.com/user-attachments/assets/5ba397cf-7cca-4a98-9a7d-095127129bfc" alt="실시간 예매 오픈 알림" width="70%">
</p>

### ✔ 이벤트
- 이벤트 콘텐츠에 댓글 작성 시 이벤트 참여
- 본인 댓글만 수정 및 삭제 가능
- 댓글 삭제 시 이벤트 참여 철회
- 이벤트당 한 번만 댓글 작성 및 참여 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/d5114717-2f9c-41c7-9881-dc4d42e96758" alt="이벤트 댓글 작성 수정 삭제 GIF" width="70%">
</p>

- 당첨자 발표 게시판에서 마스킹된 이메일 아이디로 당첨자 확인 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/46ec10a6-3456-406f-9752-f664fbbc193b" alt="이벤트 당첨자 발표 확인 GIF" width="70%">
</p>

### ✔ 예매
#### ☑️ 날짜/회차 선택
1. 메인화면, 스포츠 전체일정, 구단별 예매 페이지에서 '예매하기' 클릭 시 새 창으로 예매 창 열림
2. 예매 창 접속 시 CAPTCHA 생성 및 검증
3. 보안문자 일치 시에만 다음 단계로 이동 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/1b29af2b-fa42-454d-8f40-9be4546cbff3" alt="예매1 GIF" width="70%">
</p>

#### ☑️ 등급/좌석 선택
4. 좌석 등급 리스트에서 좌석 선택
5. 매수 선택 후 다음 단계로 이동
<p align="center">
<img src="https://github.com/user-attachments/assets/dcd148a8-be67-4ef4-8826-9fdaddd12fac" alt="예매2 GIF" width="70%">
</p>

#### ☑️ 권종/할인/매수 선택
6. 매수에 맞춰 원하는 권종 선택
7. 티켓 금액과 예매 수수료(장당 1,000원) 누적
8. 스포츠 예매권 선택 시, 마이페이지에서 등록한 예매권 사용 또는 새로 등록 후 사용 가능
9. 스포츠 예매권은 티켓 금액과 수수료 누적 제외
<p align="center">
<img src="https://github.com/user-attachments/assets/8ed1f06a-aba0-4b2b-920e-640cde6f74e3" alt="예매3 GIF" width="70%">
</p>

#### ☑️ 예매확인
10. 예매자 확인 및 취소기한/수수료 동의 후 결제 가능
11. 약관 미동의 시 결제 불가
<p align="center">
<img src="https://github.com/user-attachments/assets/8d0ef359-b5b8-466b-9849-be3df33b3e97" alt="예매4 GIF" width="70%">
</p>

#### ☑️ 결제
12. 포트원 결제 API로 결제 및 예매 처리
13. 예매권으로 결제 금액이 0원일 경우 결제 없이 예매만 진행
<p align="center">
<img src="https://github.com/user-attachments/assets/958e1c61-5467-4431-ba98-38a7a6e96f5b" alt="예매5 GIF" width="70%">
</p>

#### ☑️ 예매완료
14. 결제 완료 후 생성된 예매번호, 상세 좌석번호 등 확인 가능
15. 내역 프린트 및 PDF 저장 가능
16. '예매확인' 버튼 시 마이페이지 > 예매관리 > 예매확인/취소 > 예매확인 리스트로 이동
17. 예매확인 리스트에서 예매번호 시 상세 예매내역으로 이동
<p align="center">
<img src="https://github.com/user-attachments/assets/2062bcfd-a542-49ad-92bf-4dcbe8d0e66d" alt="예매6 GIF">
</p>

#### ☑️ 예매완료 메일 발송
18. 회원 메일로 예매 완료 메일이 발송됨
19. 메일 본문 내 '예매내역보기' 클릭 시 마이페이지 예매확인으로 이동
<p align="center">
<img src="https://github.com/user-attachments/assets/ea6d19f4-f3bc-4195-b6e8-ec719a929a7d" alt="예매완료메일" width="70%">
</p>

### ✔ 마이페이지
#### ☑️ 예매관리 > 예매확인/취소
- 예매내역 확인 및 취소마감시간 내 취소 가능
- 예매 익일부터 취소수수료 부과 및 예매 수수료 미반환
<p align="center">
<img src="https://github.com/user-attachments/assets/bb14328d-1ffe-4bee-bd8f-bb9c84f6975c" alt="예매확인취소 GIF" width="70%">
</p>

#### ☑️ 할인혜택 > 예매권
- 이벤트 당첨 시 회원 메일로 당첨 축하 안내와 예매권 번호가 발송됨
<p align="center">
<img src="https://github.com/user-attachments/assets/5bf27361-6806-44b3-9ef6-74864a6cd45a" alt="이벤트당첨안내메일" width="70%">
</p>

- 메일로 전달받은 예매권 번호 마이페이지에서 등록 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/e8ee4c05-85ee-4aa0-9b63-a8536781597e" alt="예매권등록 GIF" width="70%">
</p>

#### ☑️ 회원정보관리 > 회원정보수정
- 비밀번호 확인 후 회원 정보 수정 가능, 불일치 시 변경 불가
- 이름과 휴대폰 번호만 수정할 수 있음
<p align="center">
<img src="https://github.com/user-attachments/assets/7bec0627-c708-4272-b125-8bab55606945" alt="회원정보수정 GIF" width="70%">
</p>

#### ☑️ 회원정보관리 > 회원정보수정 > 비밀번호 변경
- 현재 비밀번호와 신규 비밀번호, 신규 비밀번호 확인 입력 후 변경 가능
- 현재 비밀번호와 동일한 비밀번호로 변경 불가
<p align="center">
<img src="https://github.com/user-attachments/assets/92c9d11f-c4f7-48d0-93be-4b4dcbfe5b27" alt="비밀번호 변경 GIF" width="70%">
</p>

#### ☑️ 활동관리 > 참여 이벤트
- 본인이 응모한 이벤트와 응모일 확인 가능
<p align="center">
<img src="https://github.com/user-attachments/assets/7b305d1a-b2de-4a4c-8fbd-7d9ce9f217c3" alt="참여 이벤트" width="70%">
</p>

### ✔ 어드민
- 회원 등급 및 활동 상태 변경
- 스포츠 종목, 구단, 경기장, 경기, 요금, 좌석 등록 및 관리
- 예매 내역 확인 및 예매자가 아니더라도 예매 취소 가능
- 예매권 발행 및 사용 내역 확인
- 이벤트 콘텐츠 업로드 / 수정 / 삭제
- 이벤트 참여자 대상으로 추첨 및 당첨자 발표, 예매권 메일 발송

#### 1. 이벤트 업로드 ⬇️
<p align="center">
<img src="https://github.com/user-attachments/assets/afe49b34-9d69-4bd9-b80f-8fbc0e87d594" alt="이벤트업로드 GIF" width="70%">
</p>

#### 2. 이벤트 참여자 대상으로 추첨 및 당첨자 발표, 당첨 안내 및 예매권 메일 발송 ⬇️
<p align="center">
<img src="https://github.com/user-attachments/assets/0e181d89-7358-41ba-a082-c2fd03142d89" alt="추첨 및 당첨자 발표 GIF" width="70%">
</p>

#### 3. 이벤트 당첨자 발표 유저 페이지 ⬇️
<p align="center">
<img src="https://github.com/user-attachments/assets/4fdaa225-e2a9-4d8f-a2b5-065026390475" alt="당첨자 발표 유저 페이지 GIF" width="70%">
</p>


### ✔ 스포츠 핫이슈
- 실시간 스포츠 기사와 국내외 주요 경기 일정, KBO 팀 랭킹을 볼 수 있는 페이지
- 웹 크롤링을 위해 셀레니움 라이브러리 사용
- 진행 상황 표시와 재미있는 스포츠 사실들을 함께 제공하여 기다리는 동안 사용자의 관심을 유지
- 스포츠 기사 클릭 시 기사 링크로 이동함
<p align="center">
<img src="https://github.com/user-attachments/assets/d042d028-0b47-44b4-bf0b-f0dbcc0e97d4" alt="스포츠핫이슈 GIF" width="70%">
</p>
