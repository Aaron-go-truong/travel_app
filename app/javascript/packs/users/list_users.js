import $ from "jquery";

$(() => {
  $("#search").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#listUsers .fit-content").filter(function () {
      $(this).toggle(
        $(this).find("#userName").text().toLowerCase().indexOf(value) > -1
      );
    });
    if ($("#listUsers .fit-content:visible").length === 0) {
      $("#notFound").removeClass("d-none");
    } else {
      $("#notFound").addClass("d-none");
    }
  });
});
