import { Controller } from "@hotwired/stimulus"

export default class Register extends Controller {
  static targets = [
    "passwordField",
    "passwordInput",
    "passwordConfirmationInput",
    "passwordValidityMessage"
  ]

  static values = {
    minimumPassword: String
  }

  connect() {
    this.checkPasswordAndAssignConfirmationPassword()
  }

  checkPasswordAndAssignConfirmationPassword() {
    const password = this.passwordInputTarget
    const passwordConfirmation = this.passwordConfirmationInputTarget
    const passwordValidityMessage = this.passwordValidityMessageTarget

    password.addEventListener('input', () => {
      if (password.value.length < this.minimumPasswordValue) {
        passwordValidityMessage.classList.remove('hidden')
        passwordValidityMessage.innerHTML = `setidaknya berjumlah ${this.minimumPasswordValue} karakter`
      } else {
        passwordValidityMessage.classList.add('hidden')
        passwordValidityMessage.innerHTML = ''
        passwordConfirmation.value = password.value
      }
    })
  }
}
