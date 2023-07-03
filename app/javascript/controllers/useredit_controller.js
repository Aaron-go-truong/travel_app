import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  connect() {
    let date = $("#birthday").text().split("/");
    $("#birthday-day-value").val(date[0]);
    $(`#birthday-month-value option:eq(${date[1]})`).prop("selected", true);
    $("#birthday-year-value").val(date[2]);
  }

  show_edit(event) {
    let target = event.target.id.replace("-edit-button", "");
    if (this.is_editing()) this.showInput(target);
  }

  hide_edit(event) {
    let target = event.target.id.replace("-tool-cancel", "");
    this.hideInput(target);
    $(`#${target}-input`).children(".text-danger").addClass("d-none");

    if (target == "birthday") {
      $(`#${target}-day-value`).removeClass("is-invalid");
      $(`#${target}-month-value`).removeClass("is-invalid");
      $(`#${target}-year-value`).removeClass("is-invalid");
    } else $(`#${target}-value`).removeClass("is-invalid");
  }

  validates(field_value, field) {
    if (field == "birthday")
      return field_value && this.checkDateisValid(field_value);
    return field_value;
  }

  checkDateisValid(date) {
    return date instanceof Date && !isNaN(date);
  }

  save_action(event) {
    let data = {};
    let field = event.target.id.replace("-tool-save", "");
    if (field != "birthday") data[`${field}`] = $(`#${field}-value`).val();
    else {
      let date_of_birth = `${$(`#${field}-year-value`).val()}-${$(
        `#${field}-month-value`
      ).val()}-${$(`#${field}-day-value`).val()}`.replace("--", "");
      data.date_of_birth = new Date(date_of_birth);
    }

    if (this.validates(Object.values(data)[0], field))
      this.ajax_update_user_profile(field, data);
    else {
      $(`#${field}-input`).children(".text-danger").removeClass("d-none");

      if (field == "birthday") {
        $(`#${field}-day-value`).addClass("is-invalid");
        $(`#${field}-month-value`).addClass("is-invalid");
        $(`#${field}-year-value`).addClass("is-invalid");
      } else $(`#${field}-value`).addClass("is-invalid");
    }
  }

  ajax_update_user_profile(field, data) {
    $.ajax({
      type: "PATCH",
      url: "/users/edit_profile",
      dataType: "html",
      data: { user: data },
      success(data) {
        field == "birthday"
          ? $(`#${field}`).text(data.date_of_birth)
          : field == "gender"
          ? $(`#${field}`).text($("#gender-value :selected").text())
          : $(`#${field}`).text($(`#${field}-value`).val());
      },
      error(data) {
        return false;
      },
    }).then(this.hideInput(field));
  }

  showInput(target) {
    $(`#${target}` + "-edit-button").addClass("d-none");
    $(`#${target}`).addClass("d-none");
    $(`#${target}-tool`).removeClass("d-none");
    $(`#${target}-input`).removeClass("d-none");
    $("span:contains(Edit)").addClass("disabled-button")
  }

  hideInput(target) {
    $(`#${target}-tool`).addClass("d-none");
    $(`#${target}-input`).addClass("d-none");
    $(`#${target}-edit-button`).removeClass("d-none");
    $(`#${target}`).removeClass("d-none");
  }

  is_editing() {
    if ($("span:contains(Edit)").hasClass("d-none")) return false;
    return true;
  }
}
