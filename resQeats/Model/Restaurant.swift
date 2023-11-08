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
    var imageName: String
    var foodOffers: [FoodOffer]
}

// Données de restaurants et offres alimentaires
var restaurants = [
    Restaurant(name: "Le zink", imageName: "Zink", foodOffers: [
        FoodOffer(title: "Burger", category: "Plat principal", description: "Un délicieux burger", price: 10.99, image: "burger"),
        FoodOffer(title: "Salade", category: "Entrée", description: "Une salade fraîche", price: 7.99, image: "salad")
    ]),
    Restaurant(name: "Slayta", imageName: "Slayta", foodOffers: [
        FoodOffer(title: "Pizza", category: "Plat principal", description: "Pizza pepperoni, tomate mozza", price: 12.99, image: "pizza")
    ]),
    Restaurant(name: "Joes Pizza", imageName: "joespizza", foodOffers: [
        FoodOffer(title: "Pasta", category: "Plat principal", description: "Avec de la sauce blanche", price: 6.99, image: "pasta")
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
