import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  swap(event) {
    const container = document.querySelector(".container-registration");
    if (event.target.id == "sign-up-btn")
      container.classList.add("sign-up-mode");
    else container.classList.remove("sign-up-mode");
  }

  login() {
    $.ajax({
      type: "POST",
      url: "users/sign_in",
      dataType: "html",
      data: {
        like: {
          likeable_id: plan_id,
          likeable_type: "Plan",
        },
        plan_id: plan_id,
      },
      success(data) {
        if (is_liked) {
          like_elm.removeClass("heart--active");
          like_elm.addClass("heart");
        } else {
          like_elm.removeClass("heart");
          like_elm.addClass("heart--active");
        }
      },
      error(data) {
        return false;
      },
    });
  }
}
