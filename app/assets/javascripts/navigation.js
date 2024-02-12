$(document).ready(function() {
    // Function to toggle active class for smaller screens
    function toggleActiveClass() {
        var screenWidth = $(window).width();
        if (screenWidth <= 768) {
            $('.nav-links').toggleClass('active'); // Toggle active class for smaller screens
        } else {
            $('.nav-links').removeClass('active'); // Remove active class for larger screens
        }
    }

    // Toggle active class when hamburger icon is clicked
    $('.hamburger-icon').click(function() {
        toggleActiveClass();
    });

    // Remove active class if screen width exceeds 768px on window resize
    $(window).resize(function() {
        var screenWidth = $(window).width();
        if (screenWidth > 768) {
            $('.nav-links').removeClass('active'); // Remove active class if screen width exceeds 768px
        }
    });
});
