package com.example

import com.example.data.UserEntity
import com.example.data.UsersDataSource
import io.ktor.serialization.kotlinx.json.*
import io.ktor.server.application.*
import io.ktor.server.plugins.contentnegotiation.*
import io.ktor.server.request.receive
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import java.io.File

fun Application.configureRouting(usersDataSource: UsersDataSource) {
    routing {
        post("user"){
            val user = call.receive<User>()
            val entity = user.toUserEntity()

            val result = usersDataSource.insertOneUser(entity)
            call.respond(mapOf("success" to result))
        }
        post("users"){
            val users = call.receive<List<User>>()
            val entities = users.map { it.toUserEntity() }

            val result = usersDataSource.insertMultipleUser(entities)
            call.respond(mapOf("success" to result))
        }
        // adding to database form json file
        post("usersFromFile"){

            val path = "dummy_data/users.json"
            val jsonString = File(path).readText()

            val users : List<User> = Json.decodeFromString(jsonString)
            val entities = users.map { it.toUserEntity() }

            val result = usersDataSource.insertMultipleUser(entities)
            call.respond(mapOf("success" to result))
        }
    }
}

@Serializable
data class User(
    val id: String ? = null,
    val name:String,
    val email:String,
    val profession : String,
    val age : Int,
    val country : String
){
    fun toUserEntity(): UserEntity{
        return UserEntity(
            name = name,
            email = email,
            profession = profession,
            age = age,
            country = country
        )
    }
}