import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];
  connect() {
    console.log($("#table-users"))
    $("#table-users").removeClass(".table-bordered");
  }
}
