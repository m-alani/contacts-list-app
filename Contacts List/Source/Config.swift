//
//  Shared.swift
//  Contacts List
//
//  Created by Marwan Alani on 2018-11-03.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

/* This file holds all the configuration and constant variables for the app */

import UIKit

// MARK: Configuration
let API_BASE_URL = "https://randomuser.me/api/?"
let REQUEST_FIELDS = ["name", "email", "phone", "id", "picture", "dob"]
let NUMBER_PER_REQUEST = 20
let USERS_NAT = "ca"

// MARK: Constants
// Colors
let darkColor = UIColor(red: 44/255, green: 46/255, blue: 49/255, alpha: 1)
let greenColor = UIColor(red: 131/255, green: 186/255, blue: 67/255, alpha: 1)
let lightColor: UIColor = .white
let greyColor: UIColor = .lightGray

// TableView
let UserCellIdentifier = "UserCell"

// Segues
let ShowUserDetailsSegue = "showUserDetailsScreen"

// MARK: Config-dependant variables
// randomuser.me API Url (as a string)
var apiUrlString: String {
    return API_BASE_URL +
        "inc=\(REQUEST_FIELDS.joined(separator: ","))" +
        "&nat=\(USERS_NAT)" +
        "&results=\(NUMBER_PER_REQUEST)"
}
