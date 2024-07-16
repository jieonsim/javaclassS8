document.addEventListener('DOMContentLoaded', function() {
	const newsTable = document.querySelector('.news-table tbody');

	// 서버에서 뉴스 데이터를 가져오는 함수
	function fetchNewsData() {
		fetch(`${ctp}/api/news`)  // 서버의 API 엔드포인트
			.then(response => response.json())
			.then(newsItems => {
				displayNewsItems(newsItems);
			})
			.catch(error => console.error('Error fetching news:', error));
	}

	// 뉴스 아이템을 화면에 표시하는 함수
	/*function displayNewsItems(newsItems) {
		newsItems.forEach(item => {
			const tr = document.createElement('tr');

			const tdImg = document.createElement('td');
			const imgLink = document.createElement('a');
			imgLink.href = item.link;
			const img = document.createElement('img');
			img.src = item.imgSrc;
			img.alt = "News Image";
			imgLink.appendChild(img);
			tdImg.appendChild(imgLink);

			const tdContent = document.createElement('td');
			tdContent.className = 'news-content';

			const titleDiv = document.createElement('div');
			titleDiv.className = 'news-title';
			const titleLink = document.createElement('a');
			titleLink.href = item.link;
			titleLink.textContent = item.title;
			titleDiv.appendChild(titleLink);

			const descDiv = document.createElement('div');
			descDiv.className = 'news-desc';
			const descLink = document.createElement('a');
			descLink.href = item.link;
			descLink.textContent = item.desc;
			descDiv.appendChild(descLink);

			const infoDiv = document.createElement('div');
			infoDiv.className = 'news-info';
			const timeSpan = document.createElement('span');
			timeSpan.textContent = item.time;
			const sourceSpan = document.createElement('span');
			sourceSpan.textContent = item.source;
			infoDiv.appendChild(timeSpan);
			infoDiv.appendChild(document.createTextNode(' | '));
			infoDiv.appendChild(sourceSpan);

			tdContent.appendChild(titleDiv);
			tdContent.appendChild(descDiv);
			tdContent.appendChild(infoDiv);

			tr.appendChild(tdImg);
			tr.appendChild(tdContent);

			newsTable.appendChild(tr);
		});
	}*/

	// 뉴스 데이터 가져오기 실행
	fetchNewsData();
});