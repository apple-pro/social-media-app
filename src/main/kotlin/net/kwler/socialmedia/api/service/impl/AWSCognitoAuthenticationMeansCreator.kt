package net.kwler.socialmedia.api.service.impl

import net.kwler.socialmedia.api.config.AWSCognitoProperties
import net.kwler.socialmedia.api.service.AuthenticationMeansCreator
import org.springframework.stereotype.Component

@Component
class AWSCognitoAuthenticationMeansCreator(
        val awsCognitoProperties: AWSCognitoProperties
) : AuthenticationMeansCreator {

    //reference: https://docs.aws.amazon.com/sdk-for-java/v2/developer-guide/examples-cognito.html
    override fun create(username: String, password: String) {
        print("Props: $awsCognitoProperties")
    }
}