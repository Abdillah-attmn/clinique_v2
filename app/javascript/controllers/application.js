import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// document.addEventListener('DOMContentLoaded', function () {
//   const burgerButton = document.querySelector('.burger');
//   const mobileMenu = document.getElementById('mobile-menu');
//   const openIcon = burgerButton.querySelector('svg:nth-child(3)');
//   const closeIcon = burgerButton.querySelector('svg:nth-child(4)');

//   burgerButton.addEventListener('click', function () {
//       const isExpanded = burgerButton.getAttribute('aria-expanded') === 'true';
//       if (isExpanded) {
//           // Close the menu
//           burgerButton.setAttribute('aria-expanded', 'false');
//           mobileMenu.style.display = 'none';
//           openIcon.classList.remove('hidden');
//           openIcon.classList.add('block');
//           closeIcon.classList.remove('block');
//           closeIcon.classList.add('hidden');
//       } else {
//           // Open the menu
//           burgerButton.setAttribute('aria-expanded', 'true');
//           mobileMenu.style.display = 'block';
//           openIcon.classList.remove('block');
//           openIcon.classList.add('hidden');
//           closeIcon.classList.remove('hidden');
//           closeIcon.classList.add('block');
//       }
//   });
// });
