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
<link rel="stylesheet" href="${ctp}/css/common/common.css">
<link rel="stylesheet" href="${ctp}/css/common/layout.css">
<link rel="stylesheet" href="${ctp}/css/sports/sports.css">
<link rel="stylesheet" href="${ctp}/css/common/button.css">
<link rel="icon" href="${ctp}/images/common/favicon.ico">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<div class="container">
		<main id="content" class="common_container sports_sub" role="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/sports/baseball/common/sports_cont_top.jsp" />
				<div class="sports_cont">
					<jsp:include page="/WEB-INF/views/sports/baseball/common/cont_left.jsp" />
					<div class="cont_right">
						<div class="rightcont_inner">
							<div class="sch_date">
								<a href="#" class="prev">이전달</a>
								<a href="#" class="next">다음달</a>
								<span class="_monthText">2024.07</span>
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
												<em>07.09</em>(화)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1719885600000" saleofftime="1720521000000" salestatus="END">
												<a href="#" data-scheduleid="1852022230" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1719896400000" saleofftime="1720510200000" salestatus="END">
												<a href="#" data-scheduleid="793027913" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1720144800000" saleofftime="1720521000000" salestatus="END">
												<a href="#" data-scheduleid="2039966089" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1719885600000" saleofftime="1720509180000" salestatus="END">
												<a href="#" data-scheduleid="653623355" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">경기종료</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="4" class="date">
												<em>07.10</em>(수)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list on" saleontime="1719972000000" saleofftime="1720607400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1004010406" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.03 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list on" saleontime="1719982800000" saleofftime="1720607400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="2093311938" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.03 14:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list on" saleontime="1720231200000" saleofftime="1720607400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="352044377" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.06 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list on" saleontime="1719885600000" saleofftime="1720607400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1700867034" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.02 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="4" class="date">
												<em>07.11</em>(목)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list on" saleontime="1720058400000" saleofftime="1720693800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="389228012" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.04 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list on" saleontime="1720069200000" saleofftime="1720693800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="711165847" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.04 14:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list on" saleontime="1720317600000" saleofftime="1720693800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="345267727" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.07 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list on" saleontime="1719885600000" saleofftime="1720693800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="820474730" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.02 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="3" class="date">
												<em>07.12</em>(금)
											</td>
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720144800000" saleofftime="1720782000000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="651414543" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.05 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>LG트윈스</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list on" saleontime="1720144800000" saleofftime="1720776600000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1811165280" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.05 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720144800000" saleofftime="1720778400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="320336694" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.05 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="3" class="date">
												<em>07.13</em>(토)
											</td>
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720231200000" saleofftime="1720866600000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1054249330" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.06 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>LG트윈스</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list on" saleontime="1720231200000" saleofftime="1720861200000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="988537582" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.06 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720231200000" saleofftime="1720863000000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="222426727" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.06 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="3" class="date">
												<em>07.14</em>(일)
											</td>
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720317600000" saleofftime="1720949400000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="173241237" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.07 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>LG트윈스</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list on" saleontime="1720317600000" saleofftime="1720944000000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1603718604" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.07 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720317600000" saleofftime="1720945800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="619506920" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.07 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="3" class="date">
												<em>07.16</em>(화)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list on" saleontime="1720490400000" saleofftime="1721125800000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1157616104" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.09 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720490400000" saleofftime="1721127600000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="341890871" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.09 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list on" saleontime="1720490400000" saleofftime="1721124000000" salestatus="ON_SALE">
												<a href="#" data-scheduleid="1174890571" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.09 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="3" class="date">
												<em>07.17</em>(수)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1720576800000" saleofftime="1721212200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1386328208" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.10 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1720576800000" saleofftime="1721214000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1783766349" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.10 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1720576800000" saleofftime="1721210400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1313509277" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.10 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="3" class="date">
												<em>07.18</em>(목)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1720663200000" saleofftime="1721298600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1620107655" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.11 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1720663200000" saleofftime="1721300400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="239359090" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.11 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1720663200000" saleofftime="1721296800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="686315817" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.11 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="5" class="date">
												<em>07.19</em>(금)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721385000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1734517386" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1720753200000" saleofftime="1721385000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="837172310" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>키움히어로즈</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721008800000" saleofftime="1721385000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1822579352" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.15 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721385000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1436850161" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721381400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2090748269" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="5" class="date">
												<em>07.20</em>(토)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1720836000000" saleofftime="1721469600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1319587695" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.13 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1720839600000" saleofftime="1721469600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1794677111" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.13 12:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>키움히어로즈</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721095200000" saleofftime="1721469600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="433766355" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721469600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1326803553" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1720836000000" saleofftime="1721466000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="673790847" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.13 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="5" class="date">
												<em>07.21</em>(일)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1720922400000" saleofftime="1721552400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2145463710" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1720926000000" saleofftime="1721552400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1924304898" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>키움히어로즈</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721181600000" saleofftime="1721552400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1215177257" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1720749600000" saleofftime="1721552400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1045730792" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.12 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>KIA 타이거즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1720922400000" saleofftime="1721548800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1849142331" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.14 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="4" class="date">
												<em>07.23</em>(화)
											</td>
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1721098800000" saleofftime="1721730600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="546202824" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721095200000" saleofftime="1721732400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="195597617" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1721095200000" saleofftime="1721727000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="352095511" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721095200000" saleofftime="1721728800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1127223436" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.16 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="4" class="date">
												<em>07.24</em>(수)
											</td>
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1721185200000" saleofftime="1721817000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="358418964" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721181600000" saleofftime="1721818800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="927696992" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1721181600000" saleofftime="1721813400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1598981288" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721181600000" saleofftime="1721815200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="904437500" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.17 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="4" class="date">
												<em>07.25</em>(목)
											</td>
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>SSG 랜더스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1721271600000" saleofftime="1721903400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1361466849" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.18 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721268000000" saleofftime="1721905200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1866863084" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.18 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>한화이글스</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>한화생명 Eagles Park</td>
											<td class="_game_list" saleontime="1721268000000" saleofftime="1721899800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1894669164" data-productid="49214" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.18 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>NC 다이노스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721268000000" saleofftime="1721901600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1446700404" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.18 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="3" class="date">
												<em>07.26</em>(금)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>한화이글스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1721354400000" saleofftime="1721989800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="23537254" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.19 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721613600000" saleofftime="1721989800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2115776415" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.22 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>kt wiz</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1721354400000" saleofftime="1721989800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="843512383" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.19 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="3" class="date">
												<em>07.27</em>(토)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>한화이글스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1721440800000" saleofftime="1722074400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2121406024" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.20 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721700000000" saleofftime="1722074400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="61492098" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>kt wiz</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1721354400000" saleofftime="1722074400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1328773838" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.19 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="3" class="date">
												<em>07.28</em>(일)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>한화이글스</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1721527200000" saleofftime="1722157200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="590467511" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.21 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721786400000" saleofftime="1722157200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1495682860" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>삼성 라이온즈</span>
												vs
												<span>kt wiz</span>
											</td>
											<td>대구 삼성라이온즈파크</td>
											<td class="_game_list" saleontime="1721354400000" saleofftime="1722157200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1676336845" data-productid="49073" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.19 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td rowspan="5" class="date">
												<em>07.30</em>(화)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1721700000000" saleofftime="1722335400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="350566579" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>한화이글스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1721703600000" saleofftime="1722335400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1147951657" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 12:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1721959200000" saleofftime="1722335400000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1808249308" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.26 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721700000000" saleofftime="1722337200000" salestatus="BEFORE">
												<a href="#" data-scheduleid="177729591" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721700000000" saleofftime="1722333600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1366520515" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.23 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td rowspan="5" class="date">
												<em>07.31</em>(수)
											</td>
											<td class="match">
												<span>LG트윈스</span>
												vs
												<span>삼성 라이온즈</span>
											</td>
											<td>잠실야구장</td>
											<td class="_game_list" saleontime="1721786400000" saleofftime="1722421800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="355884968" data-productid="49070" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>kt wiz</span>
												vs
												<span>한화이글스</span>
											</td>
											<td>수원 케이티위즈파크</td>
											<td class="_game_list" saleontime="1721790000000" saleofftime="1722421800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="522120737" data-productid="48918" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 12:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>SSG 랜더스</span>
												vs
												<span>롯데자이언츠</span>
											</td>
											<td>인천 SSG 랜더스 필드</td>
											<td class="_game_list" saleontime="1722045600000" saleofftime="1722421800000" salestatus="BEFORE">
												<a href="#" data-scheduleid="773109630" data-productid="48921" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.27 11:00오픈</span>
											</td>
										</tr>
										<tr class="">
											<td class="match">
												<span>KIA 타이거즈</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721786400000" saleofftime="1722423600000" salestatus="BEFORE">
												<a href="#" data-scheduleid="1991655492" data-productid="49034" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 11:00오픈</span>
											</td>
										</tr>
										<tr class="even">
											<td class="match">
												<span>KIA타이거즈 비스트로펍</span>
												vs
												<span>두산베어스</span>
											</td>
											<td>KIA 챔피언스필드</td>
											<td class="_game_list" saleontime="1721786400000" saleofftime="1722420000000" salestatus="BEFORE">
												<a href="#" data-scheduleid="2130984212" data-productid="49136" class="btn btn_reserve">예매하기</a>
												<span class="_sale_time">2024.07.24 11:00오픈</span>
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