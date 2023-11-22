//
//  Restaurant2.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import Foundation
import SwiftUI
struct Restaurant2: Codable{
    var _id: String
    var category: String
    var image: String
    var description: String
    var orders: [String]
    var username: String
    var password: String
    var email: String
    var phoneNumber: String
    var adresse: String
    var role: String
    var type: String

    init(id: String, category: String, image: String, description: String, orders: [String], username: String, password: String, email: String, phoneNumber: String, adresse: String, role: String, type: String) {
           self._id = id
           self.category = category
           self.image = image
           self.description = description
           self.orders = orders
           self.username = username
           self.password = password
           self.email = email
           self.phoneNumber = phoneNumber
           self.adresse = adresse
           self.role = role
           self.type = type
       }
   }

