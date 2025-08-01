package com.example

import com.example.entityAndDataSourcesPortfolio.ContactDataSource
import com.example.data.UsersDataSource
import com.example.entityAndDataSourcesPortfolio.ExperienceDataSource
import com.example.entityAndDataSourcesPortfolio.ProjectDataSource
import io.ktor.server.application.*

import io.ktor.http.*
import io.ktor.server.plugins.cors.routing.CORS

import io.ktor.server.http.content.*
import io.ktor.server.routing.*

import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.server.application.*



fun main() {
    //io.ktor.server.netty.EngineMain.main(args)
    val port = System.getenv("PORT")?.toIntOrNull() ?: 8080

    embeddedServer(Netty, port = port, module = Application::module).start(wait = true)
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

    routing {
        // ✅ HEALTH CHECK ROUTE
        get("/") {
            call.respondText("✅ Ktor backend is running!", ContentType.Text.Plain)
        }

        // ✅ STATIC RESOURCES (if any)
        staticResources("/static", "static")
    }

}