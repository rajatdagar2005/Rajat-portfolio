package com.example.entityAndDataSourcesPortfolio

import kotlinx.serialization.Serializable
import org.bson.codecs.pojo.annotations.BsonId
import org.bson.types.ObjectId

@Serializable
data class Project(
    val id: String = java.util.UUID.randomUUID().toString(),
    val title: String,
    val description: String,
    val imageUrl: List<String>,
    val tags: List<String>,
    val projectUrl: String
)