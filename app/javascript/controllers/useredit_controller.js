import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  show_edit(event) {
    let event_id = event.target.id

    $(`#${event_id}`).toggleClass("d-none")
    $(`#${event_id.replace("edit-button","tool")}`).toggleClass("d-none")
    $(`#${event_id.replace("edit-button","input")}`).toggleClass("d-none")
    $(`#${event_id.replace("-edit-button","")}`).toggleClass("d-none")
  }

  hide_edit(event) {
    let selected_id = event.target.id
    alert(selected_id)
    // $(`#${selected_id.replace("-cancel","")}`).addClass("d-none")
    // $(`#${selected_id.replace("tool-cancel","edit-button")}`).removeClass("d-none")
    // $(`#${selected_id.replace("tool-cancel","input")}`).addClass("d-none")
    // $(`#${event_id.replace("-edit-button","")}`).toggleClass("d-none")
  }
}
