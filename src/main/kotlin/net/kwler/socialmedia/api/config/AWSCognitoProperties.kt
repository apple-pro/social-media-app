package net.kwler.socialmedia.api.config

import org.springframework.boot.context.properties.ConfigurationProperties

@ConfigurationProperties(prefix = "services.aws.cognito")
data class AWSCognitoProperties(
        var accessKey: String = "",
        var accessSecret: String = "",
        var id: String = ""
)