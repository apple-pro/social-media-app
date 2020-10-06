package net.kwler.socialmedia.api.repositories

import net.kwler.socialmedia.api.entities.Person
import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface PersonRepository : JpaRepository<Person, UUID> {

    fun findFirstByEmail(email: String): Person?
}