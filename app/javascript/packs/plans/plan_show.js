import $ from "jquery";

$(() => {
  let form_plan = $("#form-plan");

  form_plan.hide();
  $("btn-cancel").hide();
  $("#edit-plan").on("click", () => {
    form_plan.show();
    $("#add-plan").hide();
  });
  $("#add-plan").on("click", () => {
    form_plan.show();
    $("#add-plan").hide();
  });
});
