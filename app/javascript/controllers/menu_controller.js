import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon"];

  connect() {
    this.isOpen = false;
  }

  toggle() {
    this.isOpen = !this.isOpen;
    this.toogleMenu();
  }

  toogleMenu() {
    if (window.innerWidth < 640) {
      this.menuTarget.style.display = this.isOpen ? "block" : "none";
      this.openIconTarget.classList.toggle("hidden", this.isOpen);
      this.openIconTarget.classList.toggle('block', !this.isOpen);
      this.closeIconTarget.classList.toggle("hidden", !this.isOpen);
      this.closeIconTarget.classList.toggle('block', this.isOpen)
      this.element.querySelector("button").setAttribute("aria-expanded", this.isOpen);
    } else {
      this.menuTarget.style.display = "none";
    }
  }
}
