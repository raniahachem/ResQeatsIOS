//
//  CartManager.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var foodOffers: [FoodOffer] = []
    @Published private(set) var total: Int = 0

    // Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false

    // Functions to add and remove from cart
    func addToCart(offer: FoodOffer) {
        foodOffers.append(offer)
        total += offer.price
    }

    func removeFromCart(offer: FoodOffer) {
        foodOffers = foodOffers.filter { $0.id != offer.id }
        total -= offer.price
    }

    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(foodOffers: foodOffers, total: total) { success in
            self.paymentSuccess = success
            self.foodOffers = []
            self.total = 0
        }
    }
}
