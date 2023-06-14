import $ from "jquery";

$(() => {
  console.log($("#form-plan"))
  $("#form-plan").hide();
  $("btn-cancel").hide();
  $("#edit-plan").on("click", () => {
    $("#form-plan").show();
    $("#add-plan").hide();
  });
  $("#add-plan").on("click", () => {
    $("#form-plan").show();
    $("#add-plan").hide();
  });
});
