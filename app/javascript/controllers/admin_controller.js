import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];
  connect() {}
  updateStatusAction(event) {
    let status_element = $(`#status_${event.target.id}`);
    $.ajax({
      type: "PATCH",
      url: "/users/update_status",
      dataType: "json",
      data: {
        user_id: event.target.id,
      },
      success(data) {
        $(`#td_${event.target.id}`).load(` #status_${event.target.id}`);
      },
      error(data) {
        return false;
      },
    });
  }
}
