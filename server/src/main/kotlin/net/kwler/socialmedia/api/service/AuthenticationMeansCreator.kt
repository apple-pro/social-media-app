package net.kwler.socialmedia.api.service

interface AuthenticationMeansCreator {
    fun create(username: String, password: String)
}