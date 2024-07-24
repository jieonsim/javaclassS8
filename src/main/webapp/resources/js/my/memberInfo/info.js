/**
 * js/my/memberInfo/info.js
 */
document.addEventListener('DOMContentLoaded', function() {
    const phoneNumberElement = document.getElementById('formattedPhoneNumber');
    const phoneNumber = phoneNumberElement.textContent;
    
    function formatPhoneNumber(phone) {
        if (phone.length === 11) {
            return phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        } else if (phone.length === 10) {
            return phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        }
        return phone;
    }
    
    phoneNumberElement.textContent = formatPhoneNumber(phoneNumber);
});