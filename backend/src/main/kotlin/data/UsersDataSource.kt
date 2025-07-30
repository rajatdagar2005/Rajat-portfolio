package com.example.data

import com.example.data.MongoDatabaseFactory

class UsersDataSource {
    private val db = MongoDatabaseFactory.db
    val userCollection = db.getCollection<UserEntity>("users")

    // for inserting one user in database
    suspend fun insertOneUser(entity: UserEntity): Boolean{
        return userCollection.insertOne(entity).wasAcknowledged()
    }

    suspend fun insertMultipleUser(entities: List<UserEntity>): Boolean{
        return userCollection.insertMany(entities).wasAcknowledged()
    }
}