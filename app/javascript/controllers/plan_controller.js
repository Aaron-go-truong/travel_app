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
      page: page,
    };
    if (page == "userProfile") {
      filter_data.user_id = $("#user_id").val().replace("value ", "");
    }
    this.filterMethod(filter_data);
    $(".btn-clear").removeClass("d-none");
  }

  filterMethod(filter_data) {
    $.ajax({
      type: "GET",
      url: "/plans",
      dataType: "JSON",
      data: filter_data,
      success(data) {
        $("#plans_list").html("");
        $("#plans_list").html(data.html);
        $("#plans_list").append(data.sub_html);
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
      page: page,
    };
    if (page == "userProfile") {
      filter_data.user_id = $("#user_id").val().replace("value ", "");
    }

    this.filterMethod(filter_data);
    $(".btn-clear").addClass("d-none");
  }

  addActivities(event) {
    let type = event.target.id.replace("_add_activities","")
    let activities_group = $(`#${type}_activities_group`);
    let input = $("#plan_activities").prop("outerHTML");
    let last_input = activities_group.find("input:last")
    if(last_input.val()!=""){
      activities_group.append(input);
      $("#close_activities").removeClass("d-none");
      $("#warning").addClass("d-none");
    }
    else{
      $("#warning").removeClass("d-none");
    }
  }

  removeActivities() {
    let type = $("#type").val().replace("value ","")
    let activities_group = $(`#${type}_activities_group`);
    activities_group.find("input:last").remove();
    if (activities_group.children().length < 3) {
      $("#close_activities").addClass("d-none");
    }
  }

  formSubmit(){
    let type = $("#type").val().replace("value ","")
    let form = $(`#plan_${type}`)
    let title = $("#plan_title")
    let time = $("#plan_time")
    let image = $("#plan_image_description")
    let address = $("#plan_address")
    let budget = $("#plan_amount")

    if(!title.val())
      alert(1)
    // form.submit();
  }
}
