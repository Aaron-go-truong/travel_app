import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  show_options(event) {
    $(()=>{
      $('.user-options').toggleClass('d-none');
    })
  }
}
