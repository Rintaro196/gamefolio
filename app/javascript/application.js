// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

import "./sidebar";

$(document).ready(function() {
    new Swiper('.swiper-container', {
      loop: true,
      direction: 'horizontal',
      mousewheel: {
          forceToAxis: false,
          invert: false
      },

      keyboard: true,

      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
      },

      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
      },
    });
  });