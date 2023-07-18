import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["notification", "noti_content"];

  navigate() {
    let notification_id = this.notificationTarget.id;
    let url_target = $(`#url_${notification_id}`).val().replace("value ", "");
    if (this.noti_contentTarget.attributes.class.nodeValue == "noti-content") {
      $.ajax({
        type: "PATCH",
        url: "/notification_read",
        dataType: "html",
        data: {
          id: notification_id,
          url: url_target,
        },
        success(data) {
          window.location.href = url_target;
        },
        error(data) {
          return false;
        },
      });
    } else {
      window.location.href = url_target;
    }
  }

  mark_all_as_read() {
    $.ajax({
      type: "PATCH",
      url: "/notification_read_all",
      dataType: "html",
      data: {
        url: window.location.pathname,
      },
      success(data) {
        $("#notificationList").load(" #notificationList");
        $("#open_notification").load(" #open_notification");
      },
      error(data) {
        return false;
      },
    });
  }
}
