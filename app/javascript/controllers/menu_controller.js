import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon"];

  connect() {
    this.isOpen = false;
  }

  toggle() {
    this.isOpen = !this.isOpen;
    this.updateMenuState();
  }

  updateMenuState() {
    if (window.innerWidth < 640) { // Tailwind's sm breakpoint
      this.menuTarget.style.display = this.isOpen ? "block" : "none";
      this.openIconTarget.classList.toggle("hidden", this.isOpen);
      this.closeIconTarget.classList.toggle("hidden", !this.isOpen);
      this.element.querySelector("button").setAttribute("aria-expanded", this.isOpen);
    } else {
      this.menuTarget.style.display = "none"; // Ensure it's hidden on larger screens
    }
  }
}
