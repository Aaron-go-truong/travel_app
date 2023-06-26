import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  swap(event) {
    const container = document.querySelector(".registration-container");
    if (event.target.id == "sign-up-btn")
      container.classList.add("sign-up-mode");
    else container.classList.remove("sign-up-mode");
  }
}
