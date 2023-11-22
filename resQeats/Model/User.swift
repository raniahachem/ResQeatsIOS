//
//  User.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 16/11/2023.
//


import Foundation

struct User : Codable{
     
    
    let name:String
    let password:String
    let email:String
    let phoneNumber:String
    let verif_pass:String
    init( username: String, password: String, email: String, phoneNumber: String, adresse: String) {
        
        self.name = username
        self.password = password
        self.email = email
        self.phoneNumber = phoneNumber
        self.verif_pass = adresse
    }

}
