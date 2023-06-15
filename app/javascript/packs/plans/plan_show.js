import $ from "jquery";

$(() => {
  let form_plan_edit = $("#form-plan-edit");
  let form_plan_child = $("#form-plan-edit-child");
  let form_plan_create = $("#form-plan-create");
  let add_plan_btn = $("#add-plan")

  form_plan_edit.hide();
  form_plan_create.hide();
  form_plan_child.hide();

  $("btn-cancel").hide();
  $("#edit-plan").on("click", () => {
    form_plan_child.hide();
    form_plan_edit.toggle();
    add_plan_btn.show();
    form_plan_create.hide();
    form_plan_create.hide();
  });
  add_plan_btn.on("click", () => {
    form_plan_create.show();
    add_plan_btn.hide();
    form_plan_edit.hide();
    form_plan_child.hide();
  });
});
