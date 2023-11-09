//
//  Restaurant.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import Foundation
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var imageName: String
    var foodOffers: [FoodOffer]
}

// Données de restaurants et offres alimentaires
var restaurants = [
    Restaurant(name: "Le zink", category: "Fast food", imageName: "Zink", foodOffers: [
        FoodOffer(title: "Korean BBQ Burger", category: "Fast food", description: "A beef patty marinated in a sweet and spicy korean BBQ", price: 10.99, image: "Korean BBQ Burger"),
        FoodOffer(title: "Classic Burger", category: "Fast food", description: "A classic cheese burger", price: 6.99, image: "Classic Burger"),
        FoodOffer(title: "Burger", category: "Plat principal", description: "A double beef burger", price: 6.99, image: "Burger"),
        FoodOffer(title: "Pasta", category: "Main meal", description: "new pasta in da house", price: 6.99, image: "pasta")
        
    ]),
    Restaurant(name: "Slayta", category: "Healthy", imageName: "Slayta", foodOffers: [
        FoodOffer(title: "Salad", category: "Entrée", description: "Une salade fraîche", price: 7.99, image: "Salad"),
        FoodOffer(title: "Pasta", category: "Plat principal", description: "Avec de la sauce blanche", price: 6.99, image: "pasta")
    ]),
    Restaurant(name: "Joes Pizza", category: "Fast food", imageName: "joespizza", foodOffers: [
        FoodOffer(title: "Pizza", category: "Plat principal", description: "Pizza pepperoni, tomate mozza", price: 12.99, image: "Pizza")
        
    ])
]

/*func setupRestaurants() {
    let burgerOffer = FoodOffer(title: "Burger", category: "Plat principal", description: "Un délicieux burger", price: 10.99)
    let saladOffer = FoodOffer(title: "Salade", category: "Entrée", description: "Une salade fraîche", price: 7.99)
    let pastaOffer = FoodOffer(title: "Pasta", category: "Plat principal", description: "Avec de la sauce blanche", price: 6.99)
    let pizzaOffer = FoodOffer(title: "Pizza", category: "Plat principal", description: "Pizza pepperoni, tomate mozza", price: 12.99)

    restaurants[0].foodOffers = [burgerOffer, saladOffer]
    restaurants[1].foodOffers = [pizzaOffer]
    restaurants[2].foodOffers = [pastaOffer]
}*/
