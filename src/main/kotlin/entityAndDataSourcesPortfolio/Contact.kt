package com.example.entityAndDataSourcesPortfolio

import kotlinx.serialization.Serializable

@Serializable
data class Contact(
    val name: String,
    val email: String,
    val message: String
)
