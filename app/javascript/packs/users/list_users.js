import $ from "jquery";

$(() => {
  $("#notFound").hide();

  $("#search").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#listUsers .fit-content").filter(function () {
      $(this).toggle(
        $(this).find("#userName").text().toLowerCase().indexOf(value) > -1
      );
    });
    if ($("#listUsers .fit-content:visible").length === 0) {
      $("#notFound").show();
    } else {
      $("#notFound").hide();
    }
  });
});
