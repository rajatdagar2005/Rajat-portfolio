package com.example

import com.example.entityAndDataSourcesPortfolio.Project
import com.example.entityAndDataSourcesPortfolio.ProjectDataSource
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import org.bson.types.ObjectId
import kotlinx.serialization.decodeFromString  // <== this is importantimport java.io.File
import java.io.File

fun Application.configureRouting3(projectDataSource: ProjectDataSource) {
    routing {
        // adding to database form json file
        post("Project"){

            val path = "dummy_data/project.json"
            val jsonString = File(path).readText()

            val json = Json { ignoreUnknownKeys = true }

            val projectDTOs = Json.decodeFromString<List<ProjectDTO>>(jsonString)
            val projects = projectDTOs.map { it.toProject() }

            val result = projectDataSource.insertMultipleProject(projects)
            call.respond(mapOf("success" to result))
        }
        get("/project") {
            val projects = projectDataSource.getAllProjects()
            call.respond(projects)
        }
    }
}

@Serializable
data class ProjectDTO(
    val id: String = java.util.UUID.randomUUID().toString(),
    val title: String,
    val description: String,
    val imageUrl: List<String>,
    val tags: List<String>,
    val projectUrl: String
){
    fun toProject(): Project{
        return Project(
            id = id,
            title = title,
            description = description,
            imageUrl = imageUrl,
            tags= tags,
            projectUrl = projectUrl
        )
    }
}