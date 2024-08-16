# ⚾ 티켓챔프 🏀
티켓챔프는 스포츠 티켓을 예매할 수 있는 웹 서비스로,<br>
예매는 물론 이벤트 및 예매권을 통한 사용자 참여 독려 및 어드민 운영 관리 기능을 제공합니다.

> 제작 기간 : 2024.06.24 - 2024.08.06<br>
> 인원 : 1명 (개인 프로젝트)

👉🏻 [사이트 바로가기](http://49.142.157.251:9090/javaclassS8/)
- Test ID : `zieonsim@gmail.com`
- Test PW : `zieonsim1`
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
#### 1. 회원
- 회원가입
- 로그인
- 계정 찾기 (아이디 찾기 / 비밀번호 찾기)
- 마이페이지(예매확인, 예매취소, 예매권 등록, 예매권 사용내역 확인, 참여 이벤트 확인, 회원정보수정, 회원탈퇴)
#### 2. 스포츠
- 각 스포츠별 경기 및 예매 전체일정 리스트
- 각 구단별 경기 및 예매 일정 리스트
#### 3. 이벤트
- 이벤트 CRUD
- 이벤트 당첨자 추첨
- 이벤트 당첨자 대상으로 예매권 발행 및 안내 메일 발송
#### 4. 예매
- 각 경기별 예매
- 발행된 예매권 사용 가능
- 포트원 결제 모듈 및 KG 이니시스를 이용한 결제 지원
#### 5. 어드민
- 스포츠, 구단, 경기장, 좌석 등급, 요금, 경기 관리
- 회원 관리
- 이벤트 관리
- 예매권 관리
- 통계 관리(차트)
<hr>

## 3️⃣ 기능별 화면 및 소개
### ✔ 메인 화면
- 오늘 날짜 기준으로 아직 예매가 오픈되지 않은 경기와 예매 일정을 종목별로 보여줌
- 오픈 일시가 경과될 경우 예매하기 버튼으로 활성화됨
<p align="center">
  <img src="https://github.com/user-attachments/assets/38212d84-73c3-4934-9ae0-1987014aa67a" alt="메인화면" width="70%">
  <img src="https://github.com/user-attachments/assets/802ba981-0270-4119-a803-1a6247151868" alt="메인화면GIF" width="70%">
</p>

### ✔ 회원가입
- 이메일, 비밀번호, 이름, 휴대폰 번호 입력
- 프론트엔드 유효성 검사 처리
- 입력한 이메일로 인증번호 발송(SMTP)
- 이메일 인증번호 발송 전 중복 체크
<p align="center">
<img src="https://github.com/user-attachments/assets/83426e4e-da98-48a0-9633-f5f65972abd6" alt="회원가입GIF" width="70%">
</p>

### ✔ 로그인
- 아이디 / 비밀번호 일치여부 확인
- 자동 로그인 구현
- 로그인 성공 시 홈화면으로 이동 및 헤더에 로그인한 이메일 아이디 노출
<p align="center">
<img src="https://github.com/user-attachments/assets/ef1cae58-b8b0-47d7-9d0e-5c4f1a4ecad4" alt="로그인GIF" width="70%">
</p>


### ✔ 계정 찾기 - 아이디 찾기
### ✔ 계정 찾기 - 비밀번호 찾기
### ✔ 이벤트
### ✔ 로그인

