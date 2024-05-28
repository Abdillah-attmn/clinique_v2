import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  connect() {
    console.log("Slide Begin");

    // Swiper-Slider
    const swiper = new Swiper('.swiper', {
      // Optional parameters
      direction: 'horizontal',
      loop: true,
      slidesPerView: 2,
      slidesPerGroup: 2,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },


      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // And if we need scrollbar
      scrollbar: {
        el: '.swiper-scrollbar',
      },
    });

    swiper.slideNext();

  }

}
