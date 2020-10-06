package net.kwler.socialmedia.api.entities

import net.minidev.json.annotate.JsonIgnore
import org.hibernate.annotations.Formula
import org.hibernate.id.UUIDGenerator
import java.util.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Registration (

    @Id @GeneratedValue(generator = UUIDGenerator.GENERATOR_NAME)
    val id: UUID,

    var firstName: String,
    var lastName: String,

    var email: String,

    @JsonIgnore
    var confirmationCode: String,

    @Formula("""
        (
            select count(*) > 0 from registration_confirmation rc 
            where rc.email = email 
            and rc.confirmation_code = confirmation_code
        )
        """)
    var confirmed: Boolean

)