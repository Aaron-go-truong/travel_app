import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from 'stimulus-use'
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  connect() {
    useClickOutside(this)
  }

  close(event) {
    $('.user-options').addClass('d-none')
    $('.sidebar').addClass('d-none')
  }

  show_options(event) {
    $(()=>{
      $('.user-options').toggleClass('d-none');
    })
  }

  show_sidebar(){
    $(()=>{
      $('.sidebar').toggleClass('d-none');
    })
  }
}
