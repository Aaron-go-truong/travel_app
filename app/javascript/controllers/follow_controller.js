import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["flbutton"];

  follow_action() {
    let url = `/users/index_${this.flbuttonTarget.textContent.toLowerCase()}`;
    let user_id = this.flbuttonTarget.id;
    let followbtnElm = $(`#${user_id}`)
    let isFollow = this.flbuttonTarget.textContent == "Follow";
    let followers_count = Number($(`#${user_id}-followers-count`).text())
    $.ajax({
      type: isFollow ? "POST" : "DELETE",
      url: url,
      dataType: "html",
      data: { id: user_id },
      success(data) {
        if (isFollow) {
          followbtnElm.text("Unfollow");
          followbtnElm.toggleClass("btn-primary btn-secondary");
          $(`#${user_id}-followers-count`).text(followers_count+1)
        } else {
          followbtnElm.text("Follow");
          followbtnElm.toggleClass("btn-secondary btn-primary ");
          $(`#${user_id}-followers-count`).text(followers_count-1)
        }
      },
      error(data) {
        return false;
      },
    });
  }
}
