package com.example

import com.example.entityAndDataSourcesPortfolio.Experience
import com.example.entityAndDataSourcesPortfolio.ExperienceDataSource
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import org.bson.types.ObjectId
import java.io.File
import kotlin.collections.mapOf

fun Application.configureRouting2(experienceDataSource: ExperienceDataSource) {
    routing {
        // Adding contact from JSON file to the database
        // Adding experience from JSON file to the database
        post("Experience") {
            val path = "dummy_data/experience.json"
            val jsonString = File(path).readText()

            val info: List<ExperienceDTO> = Json.decodeFromString(jsonString)
            val entity = info.map { it.toExperience() }

            val result = experienceDataSource.insertExperience(entity)
            call.respond(mapOf("success" to result))

        }
        get("/experience") {
            val experiences = experienceDataSource.getAllExperiences()
            call.respond(experiences)
        }
    }
}

@Serializable
data class ExperienceDTO(
    val id: String ? = null,
    val role: String,
    val company: String,
    val startDate: String,
    val endDate: String?,
    val description: String
) {
    fun toExperience(): Experience {
        return Experience(
            id = id ?: ObjectId().toString(),
            role = role,
            company = company,
            startDate = startDate,
            endDate = endDate,
            description = description
        )
    }
}