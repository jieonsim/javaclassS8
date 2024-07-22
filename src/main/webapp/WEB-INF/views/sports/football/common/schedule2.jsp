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
<link rel="stylesheet" href="${ctp}/css/sports/common.css">
<link rel="stylesheet" href="${ctp}/css/sports/layout.css">
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/football/common/sports_cont_top.jsp" />
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/football/common/cont_left.jsp" />
					<div class="cont_right">
						<div class="rightcont_inner">
							<div class="sch_date">
								<a href="#" class="prev">이전달</a>
								<a href="#" class="next">다음달</a>
								<span class="_monthText"></span>
							</div>
							<div class="sch_tbl">
								<table>
									<caption>전체 일정</caption>
									<colgroup>
										<col style="width: 100px;">
										<col>
										<col style="width: 135px;">
										<col style="width: 120px;">
									</colgroup>
									<thead>
										<tr>
											<th>날짜</th>
											<th>
												경기
												<span>(홈 vs 어웨이)</span>
											</th>
											<th>장소</th>
											<th>예매</th>
										</tr>
									</thead>
									<tbody>
										<tr class="">
											<td rowspan="4" class="date">
												<em>07.10</em>(수)
											</td>
											<td class="match">
												<span>울산 HD FC</span>
												vs
												<span>광주FC</span>
											</td>
											<td>울산 문수 월드컵경기장</td>
											<td class="_game_list" saleontime="1720321200000" saleofftime="1720610100000" salestatus="END">
												<a href="#" data-scheduleid="1241361925" data-productid="48648" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>포항 스틸러스</span>
												vs
												<span>강원FC</span>
											</td>
											<td>포항스틸야드</td>
											<td class="_game_list" saleontime="1720256400000" saleofftime="1720610400000" salestatus="END">
												<a href="#" data-scheduleid="24219750" data-productid="48948" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>전북 현대모터스</span>
												vs
												<span>제주유나이티드</span>
											</td>
											<td>전주 월드컵경기장</td>
											<td class="_game_list" saleontime="1720148400000" saleofftime="1720610100000" salestatus="END">
												<a href="#" data-scheduleid="79200055" data-productid="48644" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>FC서울</span>
												vs
												<span>대전하나시티즌</span>
											</td>
											<td>서울월드컵경기장</td>
											<td class="_game_list" saleontime="1720170000000" saleofftime="1720611000000" salestatus="END">
												<a href="#" data-scheduleid="2056447408" data-productid="48751" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="2" class="date">
												<em>07.13</em>(토)
											</td>
											<td class="match">
												<span>울산 HD FC</span>
												vs
												<span>FC서울</span>
											</td>
											<td>울산 문수 월드컵경기장</td>
											<td class="_game_list on" saleontime="1720580400000" saleofftime="1720867500000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="206615137" data-productid="48648" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.10 12:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>충북청주프로축구단</span>
												vs
												<span>안산 그리너스 FC</span>
											</td>
											<td>청주종합경기장</td>
											<td class="_game_list on" saleontime="1720231200000" saleofftime="1720868400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="215140449" data-productid="48639" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.06 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="3" class="date">
												<em>07.14</em>(일)
											</td>
											<td class="match">
												<span>광주FC</span>
												vs
												<span>인천 유나이티드</span>
											</td>
											<td>광주축구전용구장</td>
											<td class="_game_list on" saleontime="1720490400000" saleofftime="1720953000000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="258384798" data-productid="48629" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.09 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>김천상무프로축구단</span>
												vs
												<span>전북 현대모터스</span>
											</td>
											<td>김천종합운동장</td>
											<td class="_game_list on" saleontime="1720317600000" saleofftime="1720953900000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1868084395" data-productid="48847" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.07 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>FC안양</span>
												vs
												<span>부산 아이파크</span>
											</td>
											<td>안양종합운동장</td>
											<td class="_game_list on" saleontime="1720587600000" saleofftime="1720955700000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1889243444" data-productid="48804" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.10 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="4" class="date">
												<em>07.17</em>(수)
											</td>
											<td class="match">
												<span>울산 HD FC</span>
												vs
												<span>인천 유나이티드</span>
											</td>
											<td>울산 문수 월드컵경기장</td>
											<td class="_game_list" saleontime="1720926000000" saleofftime="1721213100000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1785804323" data-productid="50471" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>포항 스틸러스</span>
												vs
												<span>FC서울</span>
											</td>
											<td>포항스틸야드</td>
											<td class="_game_list" saleontime="1720861200000" saleofftime="1721213400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1164564148" data-productid="50518" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.13 18:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>광주FC</span>
												vs
												<span>성남FC</span>
											</td>
											<td>광주축구전용구장</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721212200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="434832839" data-productid="48629" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>김포FC</span>
												vs
												<span>제주유나이티드</span>
											</td>
											<td>솔터축구장</td>
											<td class="_game_list" saleontime="1720663200000" saleofftime="1721213400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="809357625" data-productid="49716" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.11 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="2" class="date">
												<em>07.20</em>(토)
											</td>
											<td class="match">
												<span>전북 현대모터스</span>
												vs
												<span>울산 HD FC</span>
											</td>
											<td>전주 월드컵경기장</td>
											<td class="_game_list" saleontime="1721012400000" saleofftime="1721472300000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1789324902" data-productid="48644" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.15 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>경남FC</span>
												vs
												<span>부천FC1995</span>
											</td>
											<td>창원축구센터</td>
											<td class="_game_list" saleontime="1721106000000" saleofftime="1721473200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2073056485" data-productid="48967" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="5" class="date">
												<em>07.21</em>(일)
											</td>
											<td class="match">
												<span>인천 유나이티드</span>
												vs
												<span>수원FC</span>
											</td>
											<td>인천축구전용경기장</td>
											<td class="_game_list" saleontime="1721192400000" saleofftime="1721560500000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2107013125" data-productid="48693" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 14:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>대구FC</span>
												vs
												<span>광주FC</span>
											</td>
											<td>DGB대구은행파크</td>
											<td class="_game_list" saleontime="1720933200000" saleofftime="1721559600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="350499981" data-productid="48697" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>FC서울</span>
												vs
												<span>김천상무프로축구단</span>
											</td>
											<td>서울월드컵경기장</td>
											<td class="_game_list" saleontime="1721120400000" saleofftime="1721559600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1795304156" data-productid="48751" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 18:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>김포FC</span>
												vs
												<span>FC안양</span>
											</td>
											<td>솔터축구장</td>
											<td class="_game_list" saleontime="1721008800000" saleofftime="1721559000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="992895530" data-productid="49716" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.15 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>충남 아산 프로축구단</span>
												vs
												<span>안산 그리너스 FC</span>
											</td>
											<td>이순신종합운동장</td>
											<td class="_game_list" saleontime="1720922400000" saleofftime="1721560500000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1441607546" data-productid="48569" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="1" class="date">
												<em>07.23</em>(화)
											</td>
											<td class="match">
												<span>부산 아이파크</span>
												vs
												<span>경남FC</span>
											</td>
											<td>부산구덕운동장</td>
											<td class="_game_list" saleontime="1721365200000" saleofftime="1721734200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="798223013" data-productid="48777" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.19 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="2" class="date">
												<em>07.24</em>(수)
											</td>
											<td class="match">
												<span>김포FC</span>
												vs
												<span>서울 이랜드FC</span>
											</td>
											<td>솔터축구장</td>
											<td class="_game_list" saleontime="1721268000000" saleofftime="1721820000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="98906476" data-productid="49716" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.18 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>충북청주프로축구단</span>
												vs
												<span>충남 아산 프로축구단</span>
											</td>
											<td>청주종합경기장</td>
											<td class="_game_list" saleontime="1721181600000" saleofftime="1721818800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1719961936" data-productid="48639" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="4" class="date">
												<em>07.27</em>(토)
											</td>
											<td class="match">
												<span>광주FC</span>
												vs
												<span>수원FC</span>
											</td>
											<td>광주축구전용구장</td>
											<td class="_game_list" saleontime="1721613600000" saleofftime="1722076200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1106276345" data-productid="48629" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.22 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>인천 유나이티드</span>
												vs
												<span>FC서울</span>
											</td>
											<td>인천축구전용경기장</td>
											<td class="_game_list" saleontime="1721710800000" saleofftime="1722080700000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1816561858" data-productid="48693" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>대구FC</span>
												vs
												<span>대전하나시티즌</span>
											</td>
											<td>DGB대구은행파크</td>
											<td class="_game_list" saleontime="1721451600000" saleofftime="1722079800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1724849844" data-productid="48697" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.20 14:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>FC안양</span>
												vs
												<span>충남 아산 프로축구단</span>
											</td>
											<td>안양종합운동장</td>
											<td class="_game_list" saleontime="1721797200000" saleofftime="1722078900000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1945526683" data-productid="48804" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="2" class="date">
												<em>07.28</em>(일)
											</td>
											<td class="match">
												<span>포항 스틸러스</span>
												vs
												<span>김천상무프로축구단</span>
											</td>
											<td>포항스틸야드</td>
											<td class="_game_list" saleontime="1721811600000" saleofftime="1722163800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1534314528" data-productid="48948" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 18:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>경남FC</span>
												vs
												<span>천안시티FC</span>
											</td>
											<td>창원축구센터</td>
											<td class="_game_list" saleontime="1721797200000" saleofftime="1722164400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="112861688" data-productid="48967" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 14:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="2" class="date">
												<em>07.29</em>(월)
											</td>
											<td class="match">
												<span>부산 아이파크</span>
												vs
												<span>충북청주프로축구단</span>
											</td>
											<td>부산구덕운동장</td>
											<td class="_game_list" saleontime="1721883600000" saleofftime="1722252600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="636598013" data-productid="48777" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.25 14:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>김포FC</span>
												vs
												<span>수원 삼성블루윙즈</span>
											</td>
											<td>솔터축구장</td>
											<td class="_game_list" saleontime="1721700000000" saleofftime="1722252000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1355205803" data-productid="49716" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 11:00오픈</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<button type="button" id="back_to_top" class="btn_move_top is-active is-stuck" onclick="window.scrollTo(0,0);">
			<span class="blind">맨 위로 이동하기</span>
		</button>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>