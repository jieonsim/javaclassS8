<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓챔프</title>
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<link rel="stylesheet" href="${ctp}/css/news/news.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
    <style>
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .loading-container {
            margin-top: 120px;
            margin-bottom: 150px;
            text-align: center;
            font-family: 'Arial', sans-serif;
        }
        .loading-text {
            font-size: 24px;
            margin-bottom: 20px;
            font-family: 'Pretendard-SemiBold'
        }
        .loading-text2 {
            font-family: 'Pretendard-Regular'
        }
        .loading-image {
            animation: bounce 1s infinite;
        }
        .progress-bar {
            width: 300px;
            height: 20px;
            background-color: #f0f0f0;
            border-radius: 10px;
            margin: 20px auto;
            overflow: hidden;
        }
        .progress {
            width: 0%;
            height: 100%;
            background-color: #fa2828;
            transition: width 0.5s;
        }
        .fun-fact {
            font-style: italic;
            color: #666;
            margin-top: 50px;
            font-family: 'Pretendard-Light';
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="loading-container">
		<p class="loading-text">최신 스포츠 핫이슈를 실시간으로 불러오고 있어요!</p>
		<img src="${ctp}/images/icon/news.png" alt="스포츠 뉴스" class="loading-image">
		<div class="progress-bar">
			<div class="progress" id="progressBar"></div>
		</div>
		<p class="loading-text2">스포츠 트렌드 분석 중...</p>
		<p class="fun-fact" id="funFact"></p>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script>
		const funFacts = [ "축구 경기에서 선수들은 평균 10km 이상을 뛰어다닙니다!",
				"NBA 농구공의 무게는 약 620g입니다.",
				"테니스 라켓의 줄은 약 16-18kg의 장력으로 당겨져 있습니다.",
				"야구 투수가 던진 공의 최고 속도는 시속 169km를 넘습니다!",
				"수영선수 마이클 펠프스의 하루 칼로리 섭취량은 약 12,000kcal였습니다." ];

		let progress = 0;
		const progressBar = document.getElementById('progressBar');
		const funFactElement = document.getElementById('funFact');

		function updateProgress() {
			if (progress < 100) {
				progress += Math.random() * 10;
				progressBar.style.width = Math.min(progress, 100) + '%';
				setTimeout(updateProgress, 500);
			}
		}

		function changeFunFact() {
			const randomFact = funFacts[Math.floor(Math.random()
					* funFacts.length)];
			funFactElement.textContent = randomFact;
		}

		updateProgress();
		changeFunFact();
		setInterval(changeFunFact, 5000);
	</script>
</body>
</html>