import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["flbutton"];

  follow_action() {
    let url = `/users/index_${this.flbuttonTarget.textContent.toLowerCase()}`;
    let user_id = this.flbuttonTarget.id;
    let followbtnElm = $(`#${user_id}`)
    let isFollow = this.flbuttonTarget.textContent == "Follow";
    $.ajax({
      type: isFollow ? "POST" : "DELETE",
      url: url,
      dataType: "html",
      data: { id: user_id },
      success(data) {
        if (isFollow) {
          followbtnElm.text("Unfollow");
          followbtnElm.toggleClass("btn-primary btn-light");
        } else {
          followbtnElm.text("Follow");
          followbtnElm.toggleClass("btn-light btn-primary ");
        }
      },
      error(data) {
        return false;
      },
    });
  }
}
