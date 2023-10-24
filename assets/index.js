document.querySelector(".js-btn-schedule").addEventListener("click", function (e) {
  e.preventDefault();
  var offset = document.querySelector(".js-landing-schedule").offsetTop;
  window.scrollTo({ top: offset, behavior: "smooth" });
});
