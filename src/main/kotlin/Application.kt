package com.example

import com.example.entityAndDataSourcesPortfolio.ContactDataSource
import com.example.data.UsersDataSource
import com.example.entityAndDataSourcesPortfolio.ExperienceDataSource
import com.example.entityAndDataSourcesPortfolio.ProjectDataSource
import io.ktor.server.application.*

import io.ktor.http.*
import io.ktor.server.plugins.cors.routing.CORS


fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {

    install(CORS) {
        anyHost() // ⚠️ For development only
        allowMethod(HttpMethod.Get)
        allowMethod(HttpMethod.Post)
        allowMethod(HttpMethod.Options)
        allowHeader(HttpHeaders.ContentType)
    }

    val usersDataSource = UsersDataSource()
    val contactDataSource = ContactDataSource()
    val experienceDataSource = ExperienceDataSource()
    val projectDataSource = ProjectDataSource()

    configureSerialization()
    configureRouting(usersDataSource)
    configureRouting1(contactDataSource)
    configureRouting2(experienceDataSource)
    configureRouting3(projectDataSource)

}