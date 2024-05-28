import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-on-click"
export default class extends Controller {
  static targets = ["about", "contact", "treatment"];

  connect() {
    console.log("Hello from scroll on click controller");
  }

  propos(){
    console.log(this.aboutTarget);
    this.aboutTarget.scrollIntoView();
  }

  contact(){
    console.log(this.contactTarget);
    this.contactTarget.scrollIntoView();
  }

  details(){
    console.log(this.treatmentTarget);
    this.treatmentTarget.scrollIntoView();
  }
}
