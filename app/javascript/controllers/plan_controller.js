import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["plancard"];

  navigate() {
    window.location.href = `/plans/${this.plancardTarget.id}`;
  }
}
