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
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<div class="sportsRankingNews mt-5">
			<span class="hotIssue-title">스포츠 랭킹 뉴스</span>
			<table class="table news-table">
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="row my-5">
			<div class="col majorGameSchedule">
				<span class="hotIssue-title">주요 경기 일정</span>
				<table class="table">
					<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="promotion">
					<a href="${ctp}/event/main">
						<div class="card" style="border: none">
							<div class="card-body d-flex justify-content-start">
								<img src="${ctp}/images/icon/tickets.png" />
								<div class="card-text m-3 pt-3">
									<p>직관 보러가고싶은 사람?</p>
									<p>이벤트 응모하고 예매권 받으러가기</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="col kboTeamRanking">
				<div class="text-right">
					<small class="hotIssue-title">2024년 7월 14일 기준</small>#lblTeamRank
				</div>
				<table class="table team-ranking">
					<thead>
						<tr>
							<th>순위</th>
							<th>팀명</th>
							<th>경기</th>
							<th>승</th>
							<th>패</th>
							<th>무</th>
							<th>승률</th>
							<th>게임차</th>
							<th>연속</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>KIA</td>
							<td>89</td>
							<td>52</td>
							<td>35</td>
							<td>2</td>
							<td>0.598</td>
							<td>-</td>
							<td>1승</td>
						</tr>
						<tr>
							<td>2</td>
							<td>삼성</td>
							<td>90</td>
							<td>48</td>
							<td>40</td>
							<td>2</td>
							<td>0.545</td>
							<td>4.5</td>
							<td>1승</td>
						</tr>
						<tr>
							<td>3</td>
							<td>LG</td>
							<td>92</td>
							<td>48</td>
							<td>42</td>
							<td>2</td>
							<td>0.533</td>
							<td>5.5</td>
							<td>2승</td>
						</tr>
						<tr>
							<td>4</td>
							<td>두산</td>
							<td>92</td>
							<td>48</td>
							<td>42</td>
							<td>2</td>
							<td>0.533</td>
							<td>5.5</td>
							<td>1패</td>
						</tr>
						<tr>
							<td>5</td>
							<td>SSG</td>
							<td>90</td>
							<td>45</td>
							<td>44</td>
							<td>1</td>
							<td>0.506</td>
							<td>8</td>
							<td>2승</td>
						</tr>
						<tr>
							<td>6</td>
							<td>NC</td>
							<td>87</td>
							<td>42</td>
							<td>43</td>
							<td>2</td>
							<td>0.494</td>
							<td>9</td>
							<td>2승</td>
						</tr>
						<tr>
							<td>7</td>
							<td>KT</td>
							<td>88</td>
							<td>41</td>
							<td>45</td>
							<td>2</td>
							<td>0.477</td>
							<td>10.5</td>
							<td>2승</td>
						</tr>
						<tr>
							<td>8</td>
							<td>한화</td>
							<td>88</td>
							<td>39</td>
							<td>49</td>
							<td>2</td>
							<td>0.442</td>
							<td>13.5</td>
							<td>2패</td>
						</tr>
						<tr>
							<td>9</td>
							<td>롯데</td>
							<td>86</td>
							<td>36</td>
							<td>48</td>
							<td>2</td>
							<td>0.430</td>
							<td>13.5</td>
							<td>3패</td>
						</tr>
						<tr>
							<td>10</td>
							<td>키움</td>
							<td>86</td>
							<td>37</td>
							<td>49</td>
							<td>0</td>
							<td>0.430</td>
							<td>14.5</td>
							<td>2패</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<script src="${ctp}/js/news/news.js"></script>
</body>
</html>