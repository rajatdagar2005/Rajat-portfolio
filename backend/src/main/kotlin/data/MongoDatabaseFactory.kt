package com.example.data

import com.mongodb.kotlin.client.coroutine.MongoClient

object MongoDatabaseFactory {

    private val connectionString = System.getenv("MONGO_DB_URI")
    val db = MongoClient.Factory.create(connectionString).getDatabase("portfolio_database")

//    val projects = db.getCollection<Project>("projects")
//    val experiences = db.getCollection<Experience>("experiences")
}