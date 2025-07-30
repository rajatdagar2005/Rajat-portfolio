package com.example.entityAndDataSourcesPortfolio

import com.example.data.MongoDatabaseFactory
import kotlinx.coroutines.flow.toList

class ExperienceDataSource {

    private val db = MongoDatabaseFactory.db
    val experienceData = db.getCollection<Experience>("experience")

    // for inserting one user in database
    suspend fun insertExperience(entity: List<Experience>): Boolean{
        return experienceData.insertMany(entity).wasAcknowledged()
    }
    suspend fun getAllExperiences(): List<Experience> = experienceData.find().toList()
}