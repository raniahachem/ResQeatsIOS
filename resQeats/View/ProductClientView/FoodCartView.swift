//
//  FoodCartView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct FoodCartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                Text("Thanks for your purchase! Your delicious food will be on its way to you. You'll also receive an email confirmation shortly.")
                    .padding()
            } else {
                if cartManager.foodOffers.count > 0 {
                    ForEach(cartManager.foodOffers, id: \.id) { offer in
                        FoodOfferRow(offer: offer)
                    }

                    HStack {
                        Text("Total du panier")
                        Spacer()
                        Text("\(cartManager.total).00 TND")
                            .bold()
                    }
                    .padding()

                    // Bouton pour continuer la commande
                                
                    
                    // Bouton pour payer avec Apple Pay
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    

                } else {
                    Text("Votre panier est vide.")
                }
            }
        }
        .navigationTitle(Text("Mon panier"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

struct FoodCartView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCartView()
            .environmentObject(CartManager())
    }
}


