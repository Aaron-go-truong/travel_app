import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from 'stimulus-use'
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  connect() {
    useClickOutside(this)
  }

  close(event) {
    $('.user-options').hide()
  }

  show_options(event) {
    $(()=>{
      $('.user-options').toggleClass('d-none');
    })
  }
}
