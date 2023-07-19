import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
let index = 0;
export default class extends Controller {
  static targets = [];

  nextAction() {
    let track = $(".track");
    let next = $(".next");
    let prev = $(".prev");
    let card = $(".card-container");
    let width_card = card.width();
    let items_count = Math.floor($(".slide").width() / card.width());
    if (index == 0) {
      prev.removeClass("d-none");
    }
    index++;
    track.css("transform", `translateX(${-index * width_card}px)`);
    if (items_count + index > card.length - 1) {
      next.addClass("d-none");
    }
  }

  prevAction() {
    let track = $(".track");
    let prev = $(".prev");
    let next = $(".next");
    let card = $(".card-container");
    let width = card[0].offsetWidth;
    let items_count = Math.floor($(".slide").width() / card.width());

    index--;
    if (index == 0) {
      prev.addClass("d-none");
    }

    if (items_count + index < card.length) {
      next.removeClass("d-none");
    }

    track.css("transform", `translateX(${-index * width}px)`);
  }

  filterAction() {
    let filter_data = {
      sort_type: $("#select-sort").find(":selected").val(),
    };

    this.filterMethod(filter_data);
    $(".btn-clear").removeClass("d-none");
  }

  filterMethod(filter_data) {
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

  clearFilterAction() {
    let select_sort = $("#select-sort");
    let search = $("#search");

    select_sort.prop("selectedIndex", 0);
    search.val("");

    let filter_data = {
      search_content: search.val(),
      sort_type: select_sort.find(":selected").val(),
    };

    this.filterMethod(filter_data);
    $(".btn-clear").addClass("d-none");
  }

  showSlider() {
    let arrow_up = $(".fa-chevron-up");
    let arrow_down = $(".fa-chevron-down");
    let recommend_card = $("#recommend");
    arrow_down.toggleClass("d-none", "");
    arrow_up.toggleClass("d-none", "");
    recommend_card.toggleClass("d-none", "");
  }
}
