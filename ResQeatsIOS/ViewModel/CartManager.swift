//
//  CartManager.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0

    // Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false

    // Functions to add and remove from cart
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(product: Product) {
        products = products.filter { $0._id != product._id }
        total -= product.price
    }

    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
    
    // Fonction pour augmenter la quantité d'un produit
    func increaseQuantity(product: Product) {
        if let index = products.firstIndex(where: { $0._id == product._id }) {
            products[index].quantity += 1
            updateTotal()
        }
    }

    // Fonction pour diminuer la quantité d'un produit
    func decreaseQuantity(product: Product) {
        if let index = products.firstIndex(where: { $0._id == product._id }) {
            if products[index].quantity > 1 {
                products[index].quantity -= 1
            } else {
                removeFromCart(product: product)
            }
            updateTotal()
        }
    }

    // Fonction pour obtenir la quantité d'un produit dans le panier
    func quantity(for product: Product) -> Int {
        return products.first(where: { $0._id == product._id })?.quantity ?? 0
    }

    // Fonction pour mettre à jour le total
    private func updateTotal() {
        total = products.reduce(0) { $0 + ($1.price * $1.quantity) }
    }
}
