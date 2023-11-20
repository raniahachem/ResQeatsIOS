//
//  Fournisseur.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 16/11/2023.
//

import Foundation
struct Fournisseur:Identifiable{
    let id: ObjectIdentifier
    let username:String
    let password:String
    let email:String
    let phoneNumber:String
    let adresse:String
    let workHours:String
    let image:String
    init(id: ObjectIdentifier, username: String, password: String, email: String, phoneNumber: String, adresse: String, workHours: String, image: String) {
        self.id = id
        self.username = username
        self.password = password
        self.email = email
        self.phoneNumber = phoneNumber
        self.adresse = adresse
        self.workHours = workHours
        self.image = image
    }
    
}
