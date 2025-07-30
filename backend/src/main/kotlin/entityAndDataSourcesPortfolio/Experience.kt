package com.example.entityAndDataSourcesPortfolio

import kotlinx.serialization.Serializable
import org.bson.codecs.pojo.annotations.BsonId
import org.bson.types.ObjectId
//
//@Serializable
//data class Experience(
//    @BsonId  // for primary key of users
//    val id: String? = ObjectId().toString(),
//    val role: String,
//    val company: String,
//    val startDate: String,
//    val endDate: String?,
//    val description: String
//)

@Serializable
data class Experience(
    //@BsonId
    val id: String = ObjectId().toHexString(),  // CONVERT ObjectId to string
    val role: String,
    val company: String,
    val startDate: String,
    val endDate: String?,
    val description: String
)

