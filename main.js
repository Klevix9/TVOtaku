/*preloader */
window.addEventListener("load", function () {
    const loader = document.querySelector(".preloader");
    loader.className += " hidden";
    setTimeout(() => {
      loader.style.display = "none";
    }, 1000);
  });
  


/* burger menu on navbar appear and dissapear*/
const menu = document.querySelector('.menu');
const burgerMenu = document.querySelector('.burger-menu');

burgerMenu.addEventListener('click', function() {
  menu.classList.toggle('open');
});

/*hero slider*/
const slides = document.querySelectorAll('.slider-slide');
const prevBtn = document.querySelector('.hero-right');
const nextBtn = document.querySelector('.hero-left');
let currentSlide = 0;

function showSlide(slideIndex) {
  slides[currentSlide].classList.remove('active');
  slides[slideIndex].classList.add('active');
  currentSlide = slideIndex;
}

function nextSlide() {
  let nextSlideIndex = currentSlide + 1;
  if (nextSlideIndex >= slides.length) {
    nextSlideIndex = 0;
  }
  showSlide(nextSlideIndex);
}

function prevSlide() {
  let prevSlideIndex = currentSlide - 1;
  if (prevSlideIndex < 0) {
    prevSlideIndex = slides.length - 1;
  }
  showSlide(prevSlideIndex);
}

let slideTimer = setInterval(nextSlide, 5000);

prevBtn.addEventListener('click', prevSlide);
nextBtn.addEventListener('click', nextSlide);


/*trending swiper */


/* Latest */
