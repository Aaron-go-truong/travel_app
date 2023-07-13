import $ from "jquery";

$(() => {
  const prev = document.querySelector(".prev");
  const next = document.querySelector(".next");
  const card = document.querySelector(".card-container");
  const track = document.querySelector(".track");
  let width = card.offsetWidth;
  let index = 0;
  window.addEventListener("resize", function () {
    width = card.offsetWidth;
  });
  next.addEventListener("click", function (e) {
    e.preventDefault();
    index = index + 1;
    prev.classList.add("show");
    track.style.transform = "translateX(" + index * -width + "px)";
    if (track.offsetWidth - index * width < index * width) {
      next.classList.add("hide");
    }
  });
  prev.addEventListener("click", function () {
    index = index - 1;
    next.classList.remove("hide");
    if (index === 0) {
      prev.classList.remove("show");
    }
    track.style.transform = "translateX(" + index * -width + "px)";
  });
});
