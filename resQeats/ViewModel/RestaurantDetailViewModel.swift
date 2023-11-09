//
//  RestaurantDetailViewModel.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import Foundation
class RestaurantDetailViewModel: ObservableObject {
    @Published var restaurant: Restaurant
    @Published var cart: [FoodOffer] = []

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }

    func addToCart(_ offer: FoodOffer) {
        if let index = restaurant.foodOffers.firstIndex(where: { $0.id == offer.id }) {
            var updatedOffers = restaurant.foodOffers
            updatedOffers[index].isInCart = true
            cart.append(offer)
            restaurant.foodOffers = updatedOffers
        }
    }
}

