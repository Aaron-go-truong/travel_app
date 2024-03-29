import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  updateStatusAction(event) {
    let type = event.target.id.split("_")[0];
    let target_id = event.target.id.split("_")[1];
    $.ajax({
      type: "PATCH",
      url: `/admin/manage/${type}s/${target_id}/update_status`,
      dataType: "json",
      data: {},
      success(data) {
        $(`#${type}_td_${target_id}`).load(` #${type}_status_${target_id}`);
        $("#flash").html("");
        $("#flash").html(data.html);
      },
      error(data) {
        return false;
      },
    });
  }
}
