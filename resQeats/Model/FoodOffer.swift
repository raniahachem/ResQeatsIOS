//
//  FoodOffer.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//
import Foundation
enum Category: String, CaseIterable, Identifiable, Decodable {
    case fastFood = "fast food"
    case mainMeal = "main meal"
    case glutenFree = "gluten free"
    case healthy = "healthy"
    case dessert = "dessert"
    case drink = "drink"
    case sweet = "sweet"
    case salty = "salty"
    
    var id: Category { self }
    
    init?(rawValue: String) {
        // Logique personnalisée pour faire correspondre les chaînes JSON aux cas de l'énumération
        switch rawValue.lowercased() {
        case "fast_food": self = .fastFood
        case "main_meal": self = .mainMeal
        case "gluten_free": self = .glutenFree
        case "healthy": self = .healthy
        case "dessert": self = .dessert
        case "drink": self = .drink
        case "sweet": self = .sweet
        case "salty": self = .salty
        default: return nil
        }
    }
}

struct FoodOffer: Identifiable, Decodable {
    var id = UUID()
    var title: String
    var category: Category
    var description: String
    var price: Int
    var image: String
    var quantity: Int
    var restaurantName: String
}

/*enum Category: String,  CaseIterable, Identifiable {
    case fastFood = "Fast Food"
    case mainMeal = "Main Meal"
    case glutenFree = "Gluten Free"
    case healthy = "Healthy"
    case dessert = "Dessert"
    case drink = "Drink"
    case sweet = "Sweet"
    case salty = "Salty"
    var id: Category { self }
}
//hedhi lel allcases belcaseiterable
let allCategories = Category.allCases
//hedhi lel for each bel identifiable avec lajout de id


struct FoodOffer: Identifiable, Decodable{
    var id = UUID()
    var title: String
    var category: Category
    var description: String
    var price: Int
    var image: String
    var quantity: Int
    var restaurantName: String
}*/

var offers = [
    FoodOffer(title: "Korean BBQ Burger", category: .fastFood, description: "A beef patty marinated in a sweet and spicy Korean BBQ", price: 10, image: "Korean BBQ Burger", quantity: 2, restaurantName: "Le zink"),
    FoodOffer(title: "Burger", category: .fastFood, description: "Un délicieux burger", price: 10, image: "Burger", quantity: 2, restaurantName: "Le zink"),
    FoodOffer(title: "Pasta", category: .mainMeal, description: "Avec de la sauce blanche", price: 6, image: "Pasta", quantity: 2, restaurantName: "Le zink"),
    FoodOffer(title: "Salad", category: .healthy, description: "Une salade fraîche", price: 7, image: "Salad", quantity: 2, restaurantName: "Slayta"),
    FoodOffer(title: "Pizza", category: .fastFood, description: "Pizza pepperoni, tomate mozza", price: 9, image: "Pizza", quantity: 2, restaurantName: "Joe's Pizza"),
    FoodOffer(title: "Gluten free crepe", category: .glutenFree, description: "Crêpe sans gluten", price: 6, image: "Gluten free crepe", quantity: 2, restaurantName: "Tik Tak Family")
]

