import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["likebtn"];

  like_action() {
    let url = `/like`;
    let like_elm = $(`#${this.likebtnTarget.id}`);
    let comment_id = this.likebtnTarget.id.replace("cmt_", "");
    let plan_id = $("#plan_id").val().replace("value ", "");
    let is_liked = like_elm.hasClass("btn-blue");


    $.ajax({
      type: is_liked ? "DELETE" : "POST",
      url: is_liked ? url + "_destroy" : url + "_new",
      dataType: "html",
      data: { comment_id: comment_id, plan_id: plan_id },
      success(data) {
        if (is_liked){
          like_elm.removeClass("btn-blue")
          like_elm.addClass("text-grey");
        }
        else{
          like_elm.removeClass("text-grey")
          like_elm.addClass("btn-blue");
        }
      },
      error(data) {
        return false;
      },
    });
  }
}
