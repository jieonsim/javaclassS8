<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="tab_content">
	<div class="sch_date">
		<a href="#" class="prev">이전달</a>
		<a href="#" class="next">다음달</a>
		<span class="_date">2024.07</span>
		<div class="match_info">한화이글스 vs 상대팀</div>
		<div class="only_home">
			<span class="checkbox"></span>
			<label for="only_home">홈경기만 보기</label>
		</div>
	</div>
	<div class="sch_tbl sch_tbl_v2">
		<table>
			<caption>구단 월별 경기일정</caption>
			<colgroup>
				<col>
				<col>
				<col>
				<col>
				<col>
				<col>
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>
						<span class="mon">월요일</span>
					</th>
					<th>
						<span class="tue">화요일</span>
					</th>
					<th>
						<span class="wed">수요일</span>
					</th>
					<th>
						<span class="thu">목요일</span>
					</th>
					<th>
						<span class="fri">금요일</span>
					</th>
					<th>
						<span class="sat">토요일</span>
					</th>
					<th>
						<span class="sun">일요일</span>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
					<td>
						<div class="frame"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const table = document.querySelector('.sch_tbl_v2 table tbody');
    const dateSpan = document.querySelector('._date');
    const prevButton = document.querySelector('.prev');
    const nextButton = document.querySelector('.next');

    let currentDate = new Date();

    function createCalendar(year, month) {
        table.innerHTML = ''; // 기존 달력 내용을 지웁니다.
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        
        let date = 1;
        let dayOfWeek = firstDay.getDay(); // 0 (일요일)부터 6 (토요일)

        for (let i = 0; i < 6; i++) {
            const row = document.createElement('tr');
            for (let j = 0; j < 7; j++) {
                const cell = document.createElement('td');
                const frame = document.createElement('div');
                frame.className = 'frame';

                if ((i === 0 && j < dayOfWeek) || date > lastDay.getDate()) {
                    // 이전 달의 날짜나 다음 달의 날짜
                    cell.appendChild(frame);
                } else {
                    const dateDiv = document.createElement('div');
                    dateDiv.className = 'date';
                    dateDiv.textContent = date;
                    frame.appendChild(dateDiv);
                    date++;
                }

                cell.appendChild(frame);
                row.appendChild(cell);
            }
            table.appendChild(row);
            if (date > lastDay.getDate()) break;
        }

        // 년월 표시 업데이트
        dateSpan.textContent = year + '.' + (month < 9 ? '0' : '') + (month + 1);
    }

    function updateCalendar() {
        createCalendar(currentDate.getFullYear(), currentDate.getMonth());
    }

    // 이전 달 버튼 클릭 이벤트
    prevButton.addEventListener('click', function(e) {
        e.preventDefault();
        currentDate.setMonth(currentDate.getMonth() - 1);
        updateCalendar();
    });

    // 다음 달 버튼 클릭 이벤트
    nextButton.addEventListener('click', function(e) {
        e.preventDefault();
        currentDate.setMonth(currentDate.getMonth() + 1);
        updateCalendar();
    });

    // 초기 달력 생성
    updateCalendar();
});
</script>