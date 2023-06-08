import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["flbutton"];

  // flbuttonTargetConnected(currentAlert) {

  // }
  show() {
    let url = `/users/index_${this.flbuttonTarget.textContent.toLowerCase()}`;
    let user_id = this.flbuttonTarget.id;
    let isFollow = this.flbuttonTarget.textContent == "Follow";
    $.ajax({
      type: isFollow ? "POST" : "DELETE",
      url: url,
      dataType: "html",
      data: { user_id: user_id },
      success(data) {
        isFollow ? $(`#${user_id}`).text("Unfollow") : $(`#${user_id}`).text("Follow");
      },
      error(data) {
        return false;
      },
    });
  }
}
