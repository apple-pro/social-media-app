package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.RegistrationConfirmation
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.security.access.prepost.PreAuthorize
import java.util.*

@PreAuthorize("hasAuthority('SCOPE_social/registration')")
interface RegistrationConfirmationRepository : JpaRepository<RegistrationConfirmation, UUID>