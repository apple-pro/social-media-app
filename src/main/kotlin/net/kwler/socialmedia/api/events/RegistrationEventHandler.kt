package net.kwler.socialmedia.api.events

import net.kwler.socialmedia.api.entities.Registration
import net.kwler.socialmedia.api.service.ConfirmationCodeGenerator
import net.kwler.socialmedia.api.service.EmailService
import org.springframework.data.rest.core.annotation.HandleAfterCreate
import org.springframework.data.rest.core.annotation.HandleBeforeCreate
import org.springframework.data.rest.core.annotation.RepositoryEventHandler
import org.springframework.stereotype.Service

@Service
@RepositoryEventHandler(Registration::class)
class RegistrationEventHandler(
        private val emailService: EmailService,
        private val confirmationCodeGenerator: ConfirmationCodeGenerator
) {

    @HandleBeforeCreate
    fun handleBeforeCreate(registration: Registration) {
        val confirmationCode = confirmationCodeGenerator.generate()

        registration.confirmationCode = confirmationCode
    }

    @HandleAfterCreate
    fun handleAfterCreate(registration: Registration) {
        val confirmationCode = registration.confirmationCode

        val message = """
            Hello ${registration.firstName} ${registration.lastName},
            
            To Confirm your email please click this link:
            
            https://localhost:4200/registration/confirm?code=$confirmationCode&email=${registration.email}
        """.trimIndent()

        emailService.send(registration.email, message)
    }

}