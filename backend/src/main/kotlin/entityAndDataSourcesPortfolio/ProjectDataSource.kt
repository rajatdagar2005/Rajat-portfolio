package com.example.entityAndDataSourcesPortfolio

import com.example.data.MongoDatabaseFactory
import kotlinx.coroutines.flow.toList

class ProjectDataSource {
    private val db = MongoDatabaseFactory.db
    val ProjectCollection = db.getCollection<Project>("Project")

    // for inserting one project in database
    suspend fun insertOneProject(entity: Project): Boolean{
        return ProjectCollection.insertOne(entity).wasAcknowledged()
    }

    // for inserting multiple project in database
    suspend fun insertMultipleProject(entities: List<Project>): Boolean{
        return ProjectCollection.insertMany(entities).wasAcknowledged()
    }

    suspend fun getAllProjects(): List<Project> {
        return ProjectCollection.find().toList()
    }

}