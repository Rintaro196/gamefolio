// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('DOMContentLoaded', function () {
    const openButton = document.querySelector('[data-drawer-show="drawer-navigation"]');
    const closeButton = document.querySelector('[data-drawer-hide="drawer-navigation"]');
    const drawer = document.getElementById('drawer-navigation');
    const hrefLinks = document.querySelectorAll('linklist');
  
    if (openButton) {
      openButton.addEventListener('click', function () {
        drawer.classList.remove('-translate-x-full');
      });
    }
  
    if (closeButton) {
      closeButton.addEventListener('click', function () {
        drawer.classList.add('-translate-x-full');
      });
    }

    hrefLinks.forEach(link => {
        link.addEventListener('click', function () {
          drawer.classList.add('-translate-x-full');
        });
    }
  });
