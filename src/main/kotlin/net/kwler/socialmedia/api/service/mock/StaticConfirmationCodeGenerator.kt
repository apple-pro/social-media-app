package net.kwler.socialmedia.api.service.mock

import net.kwler.socialmedia.api.service.ConfirmationCodeGenerator
import org.springframework.stereotype.Component

@Component
class StaticConfirmationCodeGenerator : ConfirmationCodeGenerator {

    override fun generate(): String = "123456"

}