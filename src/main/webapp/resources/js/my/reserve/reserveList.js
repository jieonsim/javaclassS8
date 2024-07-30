/**
 * js/my/reserve/reserveList.js
 */
document.addEventListener('DOMContentLoaded', function() {
    const pagination = document.getElementById('pagination');
    pagination.addEventListener('click', function(e) {
        if (e.target.classList.contains('disabled')) {
            e.preventDefault();
        }
    });
});