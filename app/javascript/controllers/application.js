import { Application } from "@hotwired/stimulus"
import Notification from 'stimulus-notification'
import Dropdown from 'stimulus-dropdown'
import ReadMore from 'stimulus-read-more'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register('notification', Notification)
application.register('dropdown', Dropdown)
application.register('read-more', ReadMore)

export { application }
