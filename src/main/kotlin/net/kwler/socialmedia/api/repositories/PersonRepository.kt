package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.Person
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.security.access.prepost.PreAuthorize
import java.util.*

@PreAuthorize("hasAuthority('SCOPE_registration')")
interface PersonRepository : JpaRepository<Person, UUID> {

    fun findFirstByEmail(email: String): Person?
}