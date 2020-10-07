package net.kwler.socialmedia.api.service

interface EmailService {

    fun send(to: String, message: String)
}