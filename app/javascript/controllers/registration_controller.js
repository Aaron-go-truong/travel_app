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

  formSubmit() {
    let user_name = $("#su_username");
    let email = $("#su_email");
    let password = $("#su_password");
    let form = $(".sign-up-form");
    if (!user_name.val() || !email.val() || !password.val()) {
      if (!user_name.val()) {
        $("#input-field-username").addClass("input-warning");
        $("#username-message").removeClass("d-none");
      } else {
        $("#input-field-username").removeClass("input-warning");
        $("#username-message").addClass("d-none");
      }
      if (!email.val()) {
        $("#input-field-email").addClass("input-warning");
        $("#email-message").removeClass("d-none");
      } else {
        $("#input-field-email").removeClass("input-warning");
        $("#email-message").addClass("d-none");
      }
      if (!password.val()) {
        $("#input-field-password").addClass("input-warning");
        $("#password-message").removeClass("d-none");
      } else {
        $("#input-field-password").removeClass("input-warning");
        $("#password-message").addClass("d-none");
      }
    } else form.submit();
  }
}
