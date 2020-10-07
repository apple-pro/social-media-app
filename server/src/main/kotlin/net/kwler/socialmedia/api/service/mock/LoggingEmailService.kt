package net.kwler.socialmedia.api.service.mock

import net.kwler.socialmedia.api.service.EmailService
import org.springframework.stereotype.Component

@Component
class LoggingEmailService : EmailService {

    override fun send(to: String, message: String) {
        println("Send Email Message to: $to message: $message")
    }
}