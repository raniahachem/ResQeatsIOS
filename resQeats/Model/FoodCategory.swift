//
//  Restaurant.swift
//  resQeats
//
//  Created by rania hm on 7/11/2023.
//

import Foundation

struct FoodCategory: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

var foodCategories = [
    FoodCategory(name: "Gluten Free", imageName: "Gluten"),
    FoodCategory(name: "Vegan", imageName: "vegan"),
    FoodCategory(name: "Healthy", imageName: "healthy"),
    FoodCategory(name: "Tunisian", imageName: "tunisian"),
]
