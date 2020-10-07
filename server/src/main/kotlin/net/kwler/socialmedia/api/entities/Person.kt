package net.kwler.socialmedia.api.entities

import org.hibernate.id.UUIDGenerator
import java.util.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Person(

        @Id @GeneratedValue(generator = UUIDGenerator.GENERATOR_NAME)
        val id: UUID,

        var firstName: String,
        var lastName: String,

        val email: String
) {

        companion object Builder {

                fun from(registration: Registration): Person =
                        Person(UUID.randomUUID(), registration.firstName, registration.lastName, registration.email)
        }
}