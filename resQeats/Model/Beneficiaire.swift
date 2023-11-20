//
//  Beneficiaire.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 16/11/2023.
//

import Foundation
struct Beneficiaire:Identifiable{
    let id: ObjectIdentifier
    let username:String
    let password:String
    let email:String
    let phoneNumber:String
    let adresse:String
    let role:String
    init(id: ObjectIdentifier, username: String, password: String, email: String, phoneNumber: String, adresse: String, role: String) {
        self.id = id
        self.username = username
        self.password = password
        self.email = email
        self.phoneNumber = phoneNumber
        self.adresse = adresse
        self.role = role
    }
}
