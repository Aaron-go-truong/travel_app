import consumer from "./consumer";
import $ from "jquery";

consumer.subscriptions.create("Noticed::NotificationChannel", {
  received(data) {
    $(() => {
      $("#notificationList").append(`${data.notification}`);
      $("#notification_count").text(data.counter);
    });
  },
});
