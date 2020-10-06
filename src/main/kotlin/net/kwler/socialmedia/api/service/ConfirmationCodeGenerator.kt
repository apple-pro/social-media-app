package net.kwler.socialmedia.api.service

interface ConfirmationCodeGenerator {

    fun generate(): String
}