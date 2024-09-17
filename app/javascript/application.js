// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// const autoScrollDiv = (scrollContainerSelector, speed = 1) => {
//   const scrollContainer = document.querySelector(scrollContainerSelector);

//   if (!scrollContainer) return;

//   let scrollPosition = 0;

//   const scrollInterval = setInterval(() => {
//     scrollPosition += speed
//     scrollContainer.scrollTop += speed
//     if (scrollContainer.scrollTop + scrollContainer.clientHeight >= scrollContainer.scrollHeight) {
//       clearInterval(scrollInterval);
//     }
//   }, 20);
// }

// document.addEventListener('DOMContentLoaded', () => {
//   autoScrollDiv('.scrollable-container', 1);
// });

document.addEventListener('DOMContentLoaded', () => {
  const scrollContainer = document.querySelector(".scrollable-container");

  if (!scrollContainer) return;

  const speed = 1.2;


  const autoScroll = () => {
    scrollContainer.scrollTop += speed
    console.log("Big Nyash")
    if (scrollContainer.scrollTop + scrollContainer.clientHeight >= scrollContainer.scrollHeight) {
      scrollContainer.scrollTop = 0
    }
  };

  setInterval(autoScroll, 50);
});
