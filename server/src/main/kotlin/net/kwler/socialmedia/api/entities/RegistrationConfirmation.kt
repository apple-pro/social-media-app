package net.kwler.socialmedia.api.entities

import org.hibernate.id.UUIDGenerator
import java.util.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class RegistrationConfirmation (

        @Id @GeneratedValue(generator = UUIDGenerator.GENERATOR_NAME)
        val id: UUID,

        val confirmationCode: String,

        val email: String
)