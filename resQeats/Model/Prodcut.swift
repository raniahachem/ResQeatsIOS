//
//  Prodcut.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import Foundation
import SwiftUI
struct Product: Codable{
    var _id: String
    var title: String
    var category: String
    var description: String
    var price: Int
    var image: String
    var quantity: Int
    var restaurant: String

    init(id: String, title: String, category: String, description: String, price: Int, image: String, quantity: Int, restaurant: String) {

        self._id = id
        self.title = title
        self.category = category
        self.description = description
        self.price = price
        self.image = image
        self.quantity = quantity
        self.restaurant = restaurant

    }

    enum Category: String, CaseIterable {
        case healthy = "healthy"
        case mainMeal = "mainMeal"
        case dessert = "dessert"
        case fastFood = "fastFood"
    }
}

