import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["notification"];

  navigate() {
     window.location.href = `${$("#url_noti").val().replace("value ","")}`;
  }
}
