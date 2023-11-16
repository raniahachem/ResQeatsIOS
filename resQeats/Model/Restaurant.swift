//
//  Restaurant.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import Foundation
import SwiftUI
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var imageName: String
    var description: String
    var foodOffers: [FoodOffer] // Utilisez le modèle FoodOffer
}
/*var restaurants = [
    Restaurant(name: "Le zink", category: "Fast food", imageName: "zink", description: "Le zink specialisé en Burgers gourmets , salades, pastrami… Les chefs y sont très doués et inventifs, une des meilleures adresses en Tunisie", foodOffers: [
        offers[0],
        offers[1],
        offers[2],
]),
Restaurant(name: "Slayta", category: "Healthy", imageName: "Slayta", description: "Slayta Bar à Salade, une des meilleures adresses pour la healthy bouffe en Tunisie", foodOffers: [
    offers[3]
]),
Restaurant(name: "Joe's Pizza", category: "Fast food", imageName: "joespizza", description: "Chez Joe's Pizza, nous servons les pizzas les plus délicieuses tout en nous engageant à réduire le gaspillage alimentaire.Chez Joe's Pizza, chaque bouchée compte ", foodOffers: [
    offers[4]
]),
    Restaurant(name: "Tik Tak Family", category: "Gluten Free", imageName: "Tiktak", description: "Avec une option sans gluten disponible, leurs créations sucrées et salées vous feront saliver à chaque bouchée.", foodOffers: [
        offers[5]
    ])
]*/
