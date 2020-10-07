package net.kwler.socialmedia.api.events

import net.kwler.socialmedia.api.entities.Person
import net.kwler.socialmedia.api.entities.RegistrationConfirmation
import net.kwler.socialmedia.api.repositories.PersonRepository
import net.kwler.socialmedia.api.repositories.RegistrationRepository
import net.kwler.socialmedia.api.service.AuthenticationMeansCreator
import org.springframework.data.rest.core.annotation.HandleAfterCreate
import org.springframework.data.rest.core.annotation.RepositoryEventHandler
import org.springframework.stereotype.Service

@Service
@RepositoryEventHandler(RegistrationConfirmation::class)
class RegistrationConfirmationEventHandler(
        private val registrationRepository: RegistrationRepository,
        private val personRepository: PersonRepository,
        private val authenticationMeansCreator: AuthenticationMeansCreator
) {

    @HandleAfterCreate
    fun handleAfterCreate(confirmation: RegistrationConfirmation) {

        val email = confirmation.email
        val code = confirmation.confirmationCode

        val registration = registrationRepository.findFirstByEmailAndConfirmationCode(email, code)
                ?: throw IllegalArgumentException("Invalid Confirmation Code: $email - $code")

        val existingPerson = personRepository.findFirstByEmail(registration.email)

        if (existingPerson != null) {
            throw IllegalArgumentException("This person already exists: ${registration.email}")
        }

        val person = Person.from(registration)

        personRepository.save(person)
        authenticationMeansCreator.create("test", "test")
    }
}