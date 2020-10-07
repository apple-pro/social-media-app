package net.kwler.socialmedia.api

import net.kwler.socialmedia.api.config.AWSCognitoProperties
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication

@EnableConfigurationProperties(AWSCognitoProperties::class)
@SpringBootApplication
class SocialMediaBackendApplication

fun main(args: Array<String>) {
	runApplication<SocialMediaBackendApplication>(*args)
}
