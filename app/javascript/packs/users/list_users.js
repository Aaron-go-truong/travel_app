import $ from "jquery";

$(() => {
  $('#notFound').hide()

  $("#search").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#listUsers div#user-card").filter(function () {
      $(this).toggle(
        $(this).find("#userName").text().toLowerCase().indexOf(value) > -1
      );
    });
    if ($("#listUsers div#user-card:visible").length === 0) {
      $('#notFound').show();
    }
    else{
      $('#notFound').hide();
    }
  });
});
