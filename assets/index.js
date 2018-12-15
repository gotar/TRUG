import $ from 'jquery';
window.jQuery = $; window.$ = $;

$(function() {
  $(".js-btn-schedule").on("click", function(e) {
    e.preventDefault();
    var offset = $(".js-landing-schedule").offset();
    $("html, body").animate({scrollTop: offset.top}, 500);
  });
});
