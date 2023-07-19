import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  onClick(event){
    event.target.classList.add("item-sidebar--active")
  }

}
