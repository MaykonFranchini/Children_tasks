import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static target = ['tabsLink']

  connect() {
    console.log(`Connected:`, this.tabsLinkTarget);
  }

}
