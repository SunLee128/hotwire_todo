import Rails from "@rails/ujs";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    reset() {
        this.element.reset();
    }
}
