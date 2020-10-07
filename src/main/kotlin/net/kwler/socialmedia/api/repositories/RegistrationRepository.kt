package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.Registration
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.security.access.prepost.PreAuthorize
import java.util.*

@PreAuthorize("hasAuthority('SCOPE_social/registration')")
interface RegistrationRepository : JpaRepository<Registration, UUID> {

    fun findFirstByEmailAndConfirmationCode(email: String, confirmationCode: String): Registration?
}