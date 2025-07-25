package com.example.entityAndDataSourcesPortfolio

import com.example.data.MongoDatabaseFactory
import kotlinx.coroutines.flow.toList

class ContactDataSource {

    private val db = MongoDatabaseFactory.db
    val userCollection = db.getCollection<Contact>("contact")

    suspend fun insertOneContact(entity: Contact): Boolean{
        return userCollection.insertOne(entity).wasAcknowledged()
    }

    //suspend fun getAllContacts(): List<Contact> = userCollection.find().toList()

    suspend fun getAllContacts(): List<Contact> {
        print("this is error");
        return try {
            userCollection.find().toList()
        } catch (e: Exception) {
            println("Read failed: ${e.message}")
            throw e
        }
    }
}