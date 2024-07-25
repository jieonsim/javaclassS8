document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('insertPriceForm');
    const sportSelect = document.getElementById('inputSportName');
    const teamSelect = document.getElementById('inputTeamName');
    const venueSelect = document.getElementById('inputVenueName');
    const seatSelect = document.getElementById('inputSeatName');
    const categorySelect = document.getElementById('inputTicketTypeCategory');
    const nameSelect = document.getElementById('inputTicketTypeName');
    
    function updateTeamOptions(teamSelect, teams) {
        teamSelect.innerHTML = '<option value="">팀 선택</option>';
        teams.forEach(team => {
            const option = document.createElement('option');
            option.value = team;
            option.textContent = team;
            teamSelect.appendChild(option);
        });
    }

    function updateVenueOptions(venues) {
        venueSelect.innerHTML = '<option value="">경기장 선택</option>';
        venues.forEach(venue => {
            const option = document.createElement('option');
            option.value = venue;
            option.textContent = venue;
            venueSelect.appendChild(option);
        });
    }

    sportSelect.addEventListener('change', function() {
        const selectedSport = this.value;
        fetch(`${ctp}/admin/sports/teams?sportName=${selectedSport}`)
            .then(response => response.json())
            .then(teams => {
                updateTeamOptions(teamSelect, teams);
                venueSelect.innerHTML = '<option value="">경기장 선택</option>';
                seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
            });
    });

    teamSelect.addEventListener('change', function() {
        const selectedTeam = this.value;
        fetch(`${ctp}/admin/sports/venues?teamName=${selectedTeam}`)
            .then(response => response.json())
            .then(venues => {
                updateVenueOptions(venues);
                seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
            });
    });

    venueSelect.addEventListener('change', function() {
        const selectedVenue = this.value;
        const selectedTeam = teamSelect.value;
        fetch(`${ctp}/admin/sports/seats?teamName=${selectedTeam}&venueName=${selectedVenue}`)
            .then(response => response.json())
            .then(seats => {
                seatSelect.innerHTML = '<option value="">좌석 등급 선택</option>';
                seats.forEach(seat => {
                    const option = document.createElement('option');
                    option.value = seat.seatName;
                    option.textContent = seat.seatName;
                    seatSelect.appendChild(option);
                });
            });
    });

    categorySelect.addEventListener('change', function() {
        const selectedCategory = this.value;
        fetch(`${ctp}/admin/sports/ticketTypeNames?category=${selectedCategory}`)
            .then(response => response.json())
            .then(names => {
                nameSelect.innerHTML = '<option value="">권종명 선택</option>';
                names.forEach(name => {
                    const option = document.createElement('option');
                    option.value = name;
                    option.textContent = name;
                    nameSelect.appendChild(option);
                });
            });
    });

    // 폼 제출 이벤트 처리
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        if (validateForm()) {
            submitForm();
        }
    });

    function validateForm() {
        const requiredFields = [sportSelect, teamSelect, venueSelect, seatSelect, categorySelect, nameSelect, document.getElementById('inputPrice')];
        for (let field of requiredFields) {
            if (!field.value) {
                alert(`${field.previousElementSibling.textContent}을(를) 선택해주세요.`);
                return false;
            }
        }
        return true;
    }

    function submitForm() {
        const formData = new FormData(form);
        fetch(`${ctp}/admin/sports/price/register`, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('가격이 성공적으로 등록되었습니다.');
                updatePriceList(data.prices);
                form.reset();
            } else {
                alert(data.message || '가격 등록에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('가격 등록 중 오류가 발생했습니다.');
        });
    }

    function updatePriceList(newPrices) {
        const priceList = document.getElementById('priceList');
        newPrices.forEach(price => {
            const li = document.createElement('li');
            li.textContent = `${price.sportName} - ${price.teamName} - ${price.venueName} - ${price.seatName} - ${price.ticketTypeCategory} - ${price.ticketTypeName}: ${price.price}원`;
            li.classList.add('list-group-item', 'new-price');
            priceList.insertBefore(li, priceList.firstChild);
        });
    }
});