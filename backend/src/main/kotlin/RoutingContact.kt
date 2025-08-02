package com.example

import com.example.entityAndDataSourcesPortfolio.Contact
import com.example.entityAndDataSourcesPortfolio.ContactDataSource
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.io.File

fun Application.configureRouting1(contactDataSource: ContactDataSource) {
    routing {
        // Adding contact from JSON file to the database
        post("Contact") {
            val path = "dummy_data/contact.json"
            val jsonString = File(path).readText()

//            val info: ContactDTO = Json.decodeFromString(jsonString)
//            val entity = info.toContact()
//
//            val result = contactDataSource.insertOneContact(entity)
//            call.respond(mapOf("success" to result))

            val contactList: List<ContactDTO> = Json.decodeFromString(jsonString)
            val resultList = contactList.map { dto ->
                val entity = dto.toContact()
                contactDataSource.insertOneContact(entity)
            }

            call.respond(mapOf("success" to resultList.all { it } ))

        }
        get("/contact") {
            val contacts = contactDataSource.getAllContacts()
            call.respond(contacts)
        }
    }
}

@Serializable
data class ContactDTO(
    val name: String,
    val email: String,
    val message: String
) {
    fun toContact(): Contact {
        return Contact(
            name = name,
            email = email,
            message = message
        )
    }
}