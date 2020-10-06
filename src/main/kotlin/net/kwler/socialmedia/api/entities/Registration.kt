package net.kwler.socialmedia.api.entities

import org.hibernate.id.UUIDGenerator
import java.util.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Registration (

    @Id @GeneratedValue(generator = UUIDGenerator.GENERATOR_NAME)
    val id: UUID,

    val firstName: String,
    val lastName: String,
    val email: String

)