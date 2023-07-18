import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = [
    "likebtn",
    "edit_comment",
    "cancel_edit",
    "reply_comment",
    "create_comment",
    "delete_comment",
  ];
  connect() {
    this.disable_submit_btn();
  }

  like_action() {
    let url = `/like`;
    let like_elm = $(`#${this.likebtnTarget.id}`);
    let comment_id = this.likebtnTarget.id.replace("cmt_", "");
    let plan_id = $("#plan_id").val().replace("value ", "");
    let is_liked = like_elm.hasClass("btn-blue");
    let comment_like_count = $(`#cmt_count_${comment_id}`);
    let like_count = Number(comment_like_count.text());
    $.ajax({
      type: is_liked ? "DELETE" : "POST",
      url: is_liked ? url + "_destroy" : url + "_new",
      dataType: "html",
      data: {
        like: {
          likeable_id: comment_id,
          likeable_type: "Comment",
        },
        plan_id: plan_id,
      },
      success(data) {
        if (is_liked) {
          like_elm.removeClass("btn-blue");
          like_elm.addClass("text-grey");
          if (like_count == 1) {
            comment_like_count.addClass("d-none");
          }
          comment_like_count.removeClass("btn-blue");
          comment_like_count.addClass("text-grey");
          comment_like_count.text(like_count - 1);
        } else {
          like_elm.removeClass("text-grey");
          like_elm.addClass("btn-blue");
          if (like_count == 0) {
            comment_like_count.removeClass("d-none");
          }
          comment_like_count.addClass("btn-blue");
          comment_like_count.removeClass("text-grey");
          comment_like_count.text(like_count + 1);
        }
      },
      error(data) {
        return false;
      },
    });
  }

  comment_action(event) {
    let form_cmt = $(`#form_${this.create_commentTarget.id}`);
    let input_cmt = $(`#input_cmt_${this.create_commentTarget.id}`);

    if (event.target.className.search("btn-disabled") < 0) {
      $.ajax({
        type: "POST",
        url: form_cmt.attr("action"),
        dataType: "html",
        data: form_cmt.serialize(),
        success(data) {
          $("#modal-body-cmt").load(" #modal-body-cmt");
          $("#modal-body-cmt").scrollTop = $("#modal-body-cmt").scrollHeight;
          input_cmt.val("");
        },
        error(data) {
          return false;
        },
      });
    }
  }

  edit_action(event) {
    let comment_id = this.edit_commentTarget.id.replace("edit_cmt_btn_", "");
    let comment_element = $(`#comment_${comment_id}`);
    let edit_comment_element = $(`#edit_cmt_${comment_id}`);

    comment_element.addClass("d-none");

    edit_comment_element.removeClass("d-none");
  }

  cancel_edit() {
    let comment_id = this.cancel_editTarget.id.replace("cancel_edit_cmt_", "");
    let comment_element = $(`#comment_${comment_id}`);
    let edit_comment_element = $(`#edit_cmt_${comment_id}`);

    comment_element.removeClass("d-none");

    edit_comment_element.addClass("d-none");
    $("#modal-body-cmt").load(" #modal-body-cmt");
  }

  reply_action() {
    let comment_id = this.reply_commentTarget.id.replace("reply_", "");
    let comment_reply_element = $(`#reply_cmt_${comment_id}`);
    comment_reply_element.removeClass("d-none");
  }

  delete_action(event) {
    $.ajax({
      type: "DELETE",
      url: event.target.nextElementSibling.href,
      dataType: "html",
      success(data) {
        $("#modal-body-cmt").load(" #modal-body-cmt");
        // $("#modal-body-cmt").scrollTop = $("#modal-body-cmt").scrollHeight;
        // input_cmt.val("");
      },
      error(data) {
        return false;
      },
    });
  }

  cmt_typing(event) {
    if (event.target.value.length > 0) {
      this.enable_submit_btn();
    } else {
      this.disable_submit_btn();
    }
  }

  disable_submit_btn() {
    $("#btn-cmt").prop("disabled", true);
    $("#btn-cmt").addClass("button-cmt--disabled", true);
    $(".fa-paper-plane").addClass("btn-disabled");
  }

  enable_submit_btn() {
    $("#btn-cmt").prop("disabled", false);
    $("#btn-cmt").removeClass("button-cmt--disabled");
    $(".fa-paper-plane").removeClass("btn-disabled");
  }
}
