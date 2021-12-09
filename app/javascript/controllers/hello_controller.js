import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
   static targets = [ "name", "output" ]

   connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`Hello, ${name}!`)
  }
}
