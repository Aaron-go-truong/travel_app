import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  showAction(event) {
    let target = event.target.id.replace("-button", "");
    if (this.isEditing()) {
      if (target == "reset") {
        $(`#${target}-text`).addClass("d-none");
        $(`#${target}-des`).removeClass("d-none");
      }
      $(`#${event.target.id}`).addClass("d-none");
      $(`#${target}-tool`).removeClass("d-none");
    }
  }

  hideAction(event) {
    let target = event.target.id.replace("-cancel", "");
    if (target == "reset") {
      $(`#${target}-text`).removeClass("d-none");
      $(`#${target}-des`).addClass("d-none");
    }
    $(`#${target}-button`).removeClass("d-none");
    $(`#${target}-tool`).addClass("d-none");
  }

  isEditing() {
    let reset_btn = $("#reset-button");
    let delete_btn = $("#delete-button");
    if (reset_btn.hasClass("d-none") || delete_btn.hasClass("d-none"))
      return false;
    return true;
  }
}
