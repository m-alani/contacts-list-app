//
//  Models.swift
//  Contacts List
//
//  Created by Marwan Alani on 2018-11-03.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

/* This file holds definitions to all the data models used in the app */

import UIKit

// MARK: Netowrk models

struct ApiName: Codable {
    let first: String
    let last: String
}

struct ApiPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct ApiDob: Codable {
    let age: Int
}

struct ApiUser: Codable {
    let name: ApiName
    let email: String
    let dob: ApiDob
    let phone: String
    let picture: ApiPicture
}

struct ApiResponseInfo: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct ApiResponse: Codable {
    let results: [ApiUser]
    let info: ApiResponseInfo
}

// MARK: App models

struct User {
    let name: String
    let email: String
    let age: Int
    let phone: String
    let thumbnailUrl: String
    let pictureUrl: String
    
    init(name: String, email: String, phone: String, age: Int, thumbnailUrl: String, pictureUrl: String) {
        self.name = name
        self.email = email
        self.age = age
        self.phone = phone
        self.thumbnailUrl = thumbnailUrl
        self.pictureUrl = pictureUrl
    }
    
    init(fromNetworkUser user: ApiUser) {
        self.name = "\(user.name.first) \(user.name.last)"
        self.email = user.email
        self.age = user.dob.age
        self.phone = user.phone
        self.thumbnailUrl = user.picture.thumbnail
        self.pictureUrl = user.picture.large
    }
}
