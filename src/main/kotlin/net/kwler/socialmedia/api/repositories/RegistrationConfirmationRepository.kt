package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.RegistrationConfirmation
import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface RegistrationConfirmationRepository : JpaRepository<RegistrationConfirmation, UUID>