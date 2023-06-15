import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {
  static targets = ["plancard", "editPlan"];

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
}
