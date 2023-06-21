import $ from "jquery";

// $(() => {

// });
$(document).ready(() => {
  let all_noti = $("#all-noti");
  let unread_noti = $("#unread-noti");
  $("#notificationContainer").hide();

  $("#open_notification").click(() => {
    $("#notificationContainer").removeClass('d-none');
    $("#notificationContainer").fadeToggle(300);
    // $("#notification_count").fadeOut("fast");
    return false;
  });

  $(document).click(() => {
    $("#notificationContainer").hide();
    $(".mark-as-read").hide();
  });

  $("#notificationContainer").click(() => {
    return false;
  });

  $(".more-options").click(() => {
    $(".mark-as-read").toggleClass("d-none");
  });

  all_noti.click(() => {
    if (!(all_noti.hasClass("filter-noti--active"))) {
        filterSelect(all_noti)
        filterRemove(unread_noti)
    }
  });

  $("#notification").click(() => {
    alert($("#url-noti").text());
  });

  unread_noti.click(() => {
    if (!(unread_noti.hasClass("filter-noti--active"))) {
        filterSelect(unread_noti)
        filterRemove(all_noti)
    }
  });

  // $('.noti-card').click(() => {
  //   alert(1)
  // })

  const filterSelect = (filter) => {
    filter.removeClass("filter-noti");
    filter.addClass("filter-noti--active");
  };
  const filterRemove = (filter) => {
    filter.removeClass("filter-noti--active");
    filter.addClass("filter-noti");
  };
});
