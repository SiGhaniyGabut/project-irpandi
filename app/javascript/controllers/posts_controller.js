import {
    Controller
} from "@hotwired/stimulus"

export default class Posts extends Controller {
    static targets = ["postButton", "title"]

    // Create Constructor
    constructor(context) {
        super(context)
        this.#disablePostButton()
    }

    // Assign Property
    get buttonStyle() {
        return {
            enabled: ["bg-orange-400", "hover:bg-orange-300", "hover:cursor-pointer"],
            disabled: ["bg-gray-200", "hover:cursor-not-allowed"]
        }
    }


    connect() {
        console.log("Post Controller Connected")
        this.create()
    }

    create() {
        this.titleTarget.addEventListener("input", () => {
            if (this.titleTarget.value.length > 10) {
                this.#enablePostButton()
            } else {
                this.#disablePostButton()
            }
        })
    }

    // Create JS Private Method
    #disablePostButton() {
        this.postButtonTarget.classList.add(...this.buttonStyle.disabled)
        this.postButtonTarget.classList.remove(...this.buttonStyle.enabled)
        this.postButtonTarget.disabled = true
    }

    #enablePostButton() {
        this.postButtonTarget.classList.add(...this.buttonStyle.enabled)
        this.postButtonTarget.classList.remove(...this.buttonStyle.disabled)
        this.postButtonTarget.disabled = false
    }
}