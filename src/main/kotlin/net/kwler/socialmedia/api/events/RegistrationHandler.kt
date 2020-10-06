package net.kwler.socialmedia.api.events

import net.kwler.socialmedia.api.entities.Registration
import net.kwler.socialmedia.api.service.EmailService
import org.springframework.data.rest.core.annotation.HandleAfterCreate
import org.springframework.data.rest.core.annotation.RepositoryEventHandler
import org.springframework.stereotype.Service

@Service
@RepositoryEventHandler(Registration::class)
class RegistrationHandler(val emailService: EmailService) {

    @HandleAfterCreate
    fun handleAfterCreate(registration: Registration) {
        emailService.send(registration.email, "Hello ${registration.firstName}")
    }

}