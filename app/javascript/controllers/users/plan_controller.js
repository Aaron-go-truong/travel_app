import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["plancard", "editPlan", "likebtn"];

  navigate() {
    window.location.href = `/plans/${this.plancardTarget.id}`;
  }

  editPlanTargetConnected(inputTarget) {
    inputTarget.hidden = true;
  }

  edit() {
    this.editPlanTarget.hidden = !this.editPlanTarget.hidden;

    $("#form-plan-edit").hide();
    $("#form-plan-create").hide();
    $("#add-plan").show();
  }

  edit_child() {
    alert("click");
  }

  like_action() {
    let url = `/like`;
    let like_elm = $(`#${this.likebtnTarget.id}`);
    let plan_id = this.plancardTarget.id.replace("like_", "");
    let is_liked = like_elm.hasClass("heart--active");
    let like_count = Number($(`#like-count-${plan_id}`).text());
    $.ajax({
      type: is_liked ? "DELETE" : "POST",
      url: is_liked ? url + "_destroy" : url + "_new",
      dataType: "html",
      data: {
        like: {
          likeable_id: plan_id,
          likeable_type: "Plan",
        },
        plan_id: plan_id,
      },
      success(data) {
        if (is_liked) {
          if (like_count == 1) {
            $(`#like-count-${plan_id}`).addClass("d-none");
          } else {
            $(`#like-count-${plan_id}`).text(like_count - 1);
          }
          like_elm.removeClass("heart--active");
          like_elm.addClass("heart");
        } else {
          if (like_count == 0) {
            $(`#like-count-${plan_id}`).removeClass("d-none");
          }
          $(`#like-count-${plan_id}`).text(like_count + 1);
          like_elm.removeClass("heart");
          like_elm.addClass("heart--active");
        }
      },
      error(data) {
        return false;
      },
    });
  }

  search_input(event) {
    if (event.keyCode === 13) this.filterAction();
  }

  filterAction() {
    let page = $("#page").val().replace("value ", "");
    let filter_data = {
      search_content: $("#search").val(),
      sort_type: $("#select-sort").find(":selected").val(),
      status_type: $("#select-status").find(":selected").val(),
      user_id: $("#user_id").val().replace("value ", ""),
      page: page,
    };
    this.filterMethod(filter_data, page);
    $(".btn-clear").removeClass("d-none");
  }

  filterMethod(filter_data, page) {
    $.ajax({
      type: "GET",
      url: "/plans",
      dataType: "JSON",
      data: filter_data,
      success(data) {
        $("#plans_list").html("");
        $("#plans_list").html(data.html);
        if (page != "userProfile") $("#plans_list").append(data.sub_html);
      },
      error(data) {
        return false;
      },
    });
  }

  clearFilterAction() {
    let page = $("#page").val().replace("value ", "");
    let select_sort = $("#select-sort");
    let select_status = $("#select-status");
    let search = $("#search");

    select_sort.prop("selectedIndex", 0);
    select_status.prop("selectedIndex", 0);
    search.val("");

    let filter_data = {
      search_content: search.val(),
      sort_type: select_sort.find(":selected").val(),
      status_type: select_status.find(":selected").val(),
      user_id: $("#user_id").val().replace("value ", ""),
      page: page,
    };

    this.filterMethod(filter_data, page);
    $(".btn-clear").addClass("d-none");
  }

  addActivities(event) {
    let type = event.target.id.replace("_add_activities", "");
    let activities_group = $(`#${type}_activities_group`);
    let input = $(`#plan_${type}_activities_item`).prop("outerHTML");
    let last_input = activities_group.find("input:last");
    if (last_input.val() != "") {
      activities_group.append(input);
      activities_group.find("input:last").val("");
      $(`#${type}_close_activities`).removeClass("d-none");
      $(`#warning_${type}`).addClass("d-none");
    } else {
      $(`#warning_${type}`).removeClass("d-none");
    }
  }

  removeActivities(event) {
    let type = event.target.id.replace("_close_activities", "");
    let activities_group = $(`#${type}_activities_group`);
    activities_group.find("input:last").remove();
    if (activities_group.children().length < 4) {
      $(`#${event.target.id}`).addClass("d-none");
    }
  }

  formSubmit(event) {
    let type = event.target.id.replace("btn-save-", "");
    let form = $(`#plan_${type}`);
    let title = $(`#plan_${type}_title`);
    let time = $(`#plan_${type}_time`);
    let image = $("#plan_image_description");
    let address = $(`#plan_${type}_address`);
    let budget = $(`#plan_${type}_budget`);
    let activities = $(`.input-activities-${type}`);
    let list_activities = [];
    let activities_group = $(`#plan_activities_${type}`);

    activities.map((i, element) => {
      list_activities.push(element.value);
    });
    if (!title.val() || !time.val() || !address.val() || !budget.val()) {
      if (!title.val()) {
        title.addClass("input-warning");
        $(`#${type}_title_warning`).removeClass("d-none");
      } else {
        title.removeClass("input-warning");
        $(`#${type}_title_warning`).addClass("d-none");
      }

      if (!time.val()) {
        time.addClass("input-warning");
        $(`#${type}_time_warning`).removeClass("d-none");
      } else {
        time.removeClass("input-warning");
        $(`#${type}_time_warning`).addClass("d-none");
      }

      if (!address.val()) {
        address.addClass("input-warning");
        $(`#${type}_address_warning`).removeClass("d-none");
      } else {
        address.removeClass("input-warning");
        $(`#${type}_address_warning`).addClass("d-none");
      }

      if (!budget.val()) {
        budget.addClass("input-warning");
        $(`#${type}_budget_warning`).removeClass("d-none");
      } else {
        budget.removeClass("input-warning");
        $(`#${type}_budget_warning`).addClass("d-none");
      }
    } else {
      activities_group.val(list_activities);
      form.submit();
    }
  }

  displayPlan() {
    $(".align-plan-details").toggleClass("d-none");
  }
  modalShow() {
    console.log($("#create_planModal"));
    $("#create_planModal").addClass("show");
    $("#create_planModal").css("display", "block");
    console.log($("#create_planModal"));
  }

  likeDetail(event) {
    let url = `/like`;
    let like_elm = $(`#${event.target.id}`);
    let plan_id = event.target.id.replace("like_section_", "");
    let is_liked = like_elm.hasClass("like-color");
    let like_count = Number($(`#like-count-${plan_id}`).text());

    $.ajax({
      type: is_liked ? "DELETE" : "POST",
      url: is_liked ? url + "_destroy" : url + "_new",
      dataType: "html",
      data: {
        like: {
          likeable_id: plan_id,
          likeable_type: "Plan",
        },
        plan_id: plan_id,
      },
      success(data) {
        if (is_liked) {
          if (like_count == 1) {
            $(`#like-count-${plan_id}`).addClass("d-none");
          } else {
            $(`#like-count-${plan_id}`).text(like_count - 1);
          }
          like_elm.removeClass("like-color");
          like_elm.addClass("text-muted");
        } else {
          if (like_count == 0) {
            $(`#like-count-${plan_id}`).removeClass("d-none");
          }
          $(`#like-count-${plan_id}`).text(like_count + 1);
          like_elm.removeClass("text-muted");
          like_elm.addClass("like-color");
        }
      },
      error(data) {
        return false;
      },
    });
  }
}
