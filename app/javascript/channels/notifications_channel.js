import consumer from "./consumer";
import $ from "jquery";

consumer.subscriptions.create("Noticed::NotificationChannel", {
  received(data) {
    $(() => {
      $("#notificationList").load(`${data.notification}`);
      $("#notification_count").removeClass("d-none");
      $("#notification_count").text(data.counter);
    });
  },
});
