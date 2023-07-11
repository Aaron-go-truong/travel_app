import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [];

  connect() {}

  filter_action() {
    let filter_data = {
      sort_type: $("#select-sort").find(":selected").val(),
    };

    this.filter_method(filter_data);
    $(".btn-clear").removeClass("d-none");
  }

  filter_method(filter_data) {
    $.ajax({
      type: "GET",
      url: "/users",
      dataType: "JSON",
      data: filter_data,
      success(data) {
        $("#listUsers").html("");
        $("#listUsers").html(data.html);
      },
      error(data) {
        return false;
      },
    });
  }

  clear_filter_action() {
    let select_sort = $("#select-sort");
    let search = $("#search");

    select_sort.prop("selectedIndex", 0);
    search.val("");

    let filter_data = {
      search_content: search.val(),
      sort_type: select_sort.find(":selected").val(),
    };

    this.filter_method(filter_data);
    $(".btn-clear").addClass("d-none");
  }
}
