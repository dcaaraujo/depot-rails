import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["selection", "additionalFields"];

  initialize() {
    this.showAdditionalFields();
  }

  showAdditionalFields() {
    const selection = this.selectionTarget.value;
    for (let fields of this.additionalFieldsTargets) {
      const isSelectedType = fields.dataset.type != selection;
      fields.disabled = fields.hidden = isSelectedType;
    }
  }
}
