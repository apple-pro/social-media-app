package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.Registration
import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface RegistrationRepository : JpaRepository<Registration, UUID> {

    fun findFirstByEmailAndConfirmationCode(email: String, confirmationCode: String): Registration?
}