package net.kwler.socialmedia.api.events

import net.kwler.socialmedia.api.entities.RegistrationConfirmation
import org.springframework.data.rest.core.annotation.RepositoryEventHandler
import org.springframework.stereotype.Service

@Service
@RepositoryEventHandler(RegistrationConfirmation::class)
class RegistrationConfirmationEventHandler {
}