$(document).ready(function() {
    var slideIndex = 1;
    showSlides(slideIndex);
  
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }
  
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }
  
    function showSlides(n) {
      var i;
      var slides = $(".mySlides-quote");
      var dots = $(".quote-dot");
      if (n > slides.length) { slideIndex = 1; }
      if (n < 1) { slideIndex = slides.length; }
      slides.hide();
      dots.removeClass("active");
      slides.eq(slideIndex - 1).show();
      dots.eq(slideIndex - 1).addClass("active");
    }
  
    $(".quote-prev").click(function() {
      plusSlides(-1);
    });
  
    $(".quote-next").click(function() {
      plusSlides(1);
    });
  
    $(".quote-dot").click(function() {
      currentSlide($(this).index() + 1);
    });
  });
  