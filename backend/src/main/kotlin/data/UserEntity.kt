package com.example.data

import org.bson.codecs.pojo.annotations.BsonId
import org.bson.types.ObjectId

data class UserEntity(
    @BsonId  // for primary key of users
    val id:String = ObjectId().toString(),
    val name:String,
    val email:String,
    val profession : String,
    val age : Int,
    val country : String
)