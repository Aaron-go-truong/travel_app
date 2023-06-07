import $ from "jquery";

$(() => {
  $("#notFound").hide();

  $("#follow-btn").on("click", () => {
    let url = `/users/index_${$("#follow-btn").text().toLowerCase()}`;
    let isFollow = $("#follow-btn").text() == "Follow";
    $.ajax({
      type: isFollow?"POST":"DELETE",
      url: url,
      dataType: "html",
      data: { user_id: $(followed_id).val() },
      success(data) {
        isFollow
          ? $("#follow-btn").text("Unfollow")
          : $("#follow-btn").text("Follow");
      },
      error(data) {
        return false;
      },
    });
  });

  $("#search").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#listUsers div#user-card").filter(function () {
      $(this).toggle(
        $(this).find("#userName").text().toLowerCase().indexOf(value) > -1
      );
    });
    if ($("#listUsers div#user-card:visible").length === 0) {
      $("#notFound").show();
    } else {
      $("#notFound").hide();
    }
  });
});
