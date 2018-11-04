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

struct PayloadName: Codable {
    let first: String
    let last: String
}

struct PayloadPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct PayloadUser: Codable {
    let name: PayloadName
    let email: String
    let phone: String
    let picture: PayloadPicture
}

// MARK: App models

struct User {
    let name: String
    let email: String
    let phone: String
    let thumbnail: UIImage?
    let picture: UIImage?
}
