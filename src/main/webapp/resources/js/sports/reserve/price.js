/**
 * js/sports/reserve/price.js
 */
document.addEventListener('DOMContentLoaded', function() {
	// 매수 선택 셀렉트 박스 토글 처리
	document.querySelectorAll('.select._price_cnt').forEach(function(selectElement) {
		selectElement.addEventListener('click', function(e) {
			e.preventDefault();
			const selectBox = selectElement.closest('.selectbox');
			selectBox.classList.toggle('is-active');
		});
	});

	// 각 권종에서 선택한 매수를 누적하기
	function calculateTotalSelected() {
		let totalSelected = 0;
		document.querySelectorAll('.select._price_cnt').forEach(function(selectElement) {
			totalSelected += parseInt(selectElement.textContent, 10);
		});
		console.log("Total selected quantity: " + totalSelected);
		return totalSelected;
	}

	document.querySelectorAll('.select_list li').forEach(function(liElement) {
		// 선택한 매수를 .select _price_cnt에 value로 세팅, 매수 선택 시 _selected 클래스 추가
		liElement.addEventListener('click', function(e) {
			e.preventDefault();
			const selectedValue = parseInt(liElement.querySelector('a').textContent, 10);
			const selectBox = liElement.closest('.selectbox');
			const priceCnt = selectBox.querySelector('.select._price_cnt');
			const previousValue = parseInt(priceCnt.textContent, 10);

			// Attempt to get the quantity from the data attribute
			const selectList = selectBox.querySelector('.select_list');
			const quantityAttr = selectList ? selectList.getAttribute('data-limit-count') : null;
			const quantity = parseInt(quantityAttr, 10);

			console.log("quantityAttr: " + quantityAttr);
			console.log("quantity: " + quantity);
			console.log("Previous value: " + previousValue);
			console.log("Selected value: " + selectedValue);

			const totalSelected = calculateTotalSelected() - previousValue + selectedValue;
			console.log("New total after selection: " + totalSelected); // Debugging: Log new total

			// 각 권종의 매수 누적합이 depth1에서 선택한 매수보다 초과하였을 때
			if (totalSelected > quantity) {
				alert('좌석 매수를 초과하여 권종을 선택할 수 없습니다.');
				return;
			}

			priceCnt.textContent = selectedValue;
			selectBox.classList.remove('is-active');

			const listItems = selectBox.querySelectorAll('.select_list li');
			listItems.forEach(function(item) {
				item.classList.remove('_selected');
			});

			// 매수 선택 시 Add _selected class to the clicked li element
			liElement.classList.add('_selected');
		});
	});
});
