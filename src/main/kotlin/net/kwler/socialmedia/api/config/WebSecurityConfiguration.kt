package net.kwler.socialmedia.api.config

import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.builders.WebSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
class WebSecurityConfiguration : WebSecurityConfigurerAdapter() {

    override fun configure(web: WebSecurity?) {
        web?.ignoring()?.antMatchers("explorer/index.html")
    }

    override fun configure(http: HttpSecurity?) {
        http
                ?.authorizeRequests { it.antMatchers("explorer/index.html").permitAll() }
                ?.oauth2ResourceServer { it.jwt() }
    }
}