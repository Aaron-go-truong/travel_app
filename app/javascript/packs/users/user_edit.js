import $, { data } from "jquery";

$(() => {
  initialPage();

  $("#email-edit-button").on("click", () => {
    showInput("email");
  });

  $("#email-tool-cancel").on("click", () => {
    hideInput("email");
  });

  $("#fullname-edit-button").on("click", () => {
    showInput("fullname");
  });

  $("#fullname-tool-cancel").on("click", () => {
    hideInput("fullname");
  });

  $("#birthday-edit-button").on("click", () => {
    showInput("birthday");
  });

  $("#birthday-tool-cancel").on("click", () => {
    hideInput("birthday");
  });

  $("input.floatNumber").on("input", function () {
    this.value = this.value.replace(/[^0-9.]/g, "").replace(/(\..*)\./g, "$1");
  });

  $("#gender-edit-button").on("click", () => {
    showInput("gender");
  });

  $("#gender-tool-cancel").on("click", () => {
    hideInput("gender");
  });

  $("#address-edit-button").on("click", () => {
    showInput("address");
  });

  $("#address-tool-cancel").on("click", () => {
    hideInput("address");
  });

  $("#reset-button").on("click", () => {
    $("#reset-button").hide();
    $("#reset-tool").show();
  });

  $("#reset-cancel").on("click", () => {
    $("#reset-button").show();
    $("#reset-tool").hide();
  });

  $("#delete-button").on("click", () => {
    $("#delete-button").hide();
    $("#delete-tool").show();
  });

  $("#delete-cancel").on("click", () => {
    $("#delete-button").show();
    $("#delete-tool").hide();
  });

  $("#security-page").on("click", () => {
    $("#security").show();
    $("#person-details").hide();
  });

  $("#person-details-page").on("click", () => {
    $("#security").hide();
    $("#person-details").show();
  });

  $("#fullname-tool-save").on("click", () => {
    saveInfo(`fullname`, { full_name: $("#fullname-value").val() });
  });

  $("#birthday-tool-save").on("click", () => {
    let date_of_birth = `${$("#birthday-day-value").val()}/${$(
      "#birthday-month-value"
    ).val()}/${$("#birthday-year-value").val()}`;

    saveInfo("birthday", { date_of_birth: date_of_birth });
  });

  $("#gender-tool-save").on("click", () => {
    saveInfo("gender", { gender: $("#gender-select").val() });
  });

  $("#address-tool-save").on("click", () => {
    saveInfo("address", { address: $("#address-value").val() });
  });

  $("#btn-save-avt").on("click", () => {
    console.log($("#filepond-avatar").find("img"));
  });
});

const initialPage = () => {
  $("#security").hide();
  // $('#save-avatar').hide()
  hideToolandInput("fullname");
  hideToolandInput("birthday");
  hideToolandInput("gender");
  hideToolandInput("address");
  hideToolandInput("reset");
  hideToolandInput("delete");
  hideToolandInput("email");
};

const hideToolandInput = (id) => {
  $(`#${id}-tool`).hide();
  $(`#${id}-input`).hide();
};

const showInput = (id) => {
  $(`#${id}` + "-edit-button").hide();
  $(`#${id}`).hide();
  $(`#${id}-tool`).show();
  $(`#${id}-input`).show();
};

const hideInput = (id) => {
  $(`#${id}-tool`).hide();
  $(`#${id}-input`).hide();
  $(`#${id}-edit-button`).show();
  $(`#${id}`).show();
};

const saveInfo = (field, data) => {
  $.ajax({
    type: "PATCH",
    url: "/users/edit_profile",
    dataType: "html",
    data: { user: data },
    success(data) {
      field == "birthday"
        ? $(`#${field}`).text(data.date_of_birth)
        : field == "gender"
        ? $(`#${field}`).text($("#gender-select :selected").text())
        : $(`#${field}`).text($(`#${field}-value`).val());
    },
    error(data) {
      return false;
    },
  }).then(hideInput(field));
};
