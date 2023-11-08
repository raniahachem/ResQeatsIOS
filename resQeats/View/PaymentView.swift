//
//  PaymentView.swift
//  resQeats
//
//  Created by rania hm on 7/11/2023.
//

import SwiftUI
struct PaymentView: View {
    @Binding var cart: [FoodOffer]
    @State private var paymentMethod: String = ""
    @State private var paymentSuccess = false

    var body: some View {
        VStack {
            Text("Résumé de la commande")
                .font(.largeTitle)
                .padding()

            List {
                ForEach(cart) { offer in
                    HStack {
                        Text(offer.title)
                        Spacer()
                        Text("\(offer.price) DT")
                    }
                }
            }

            Text("Total : \(totalPrice()) DT")
                .font(.title)

            TextField("Moyen de paiement", text: $paymentMethod)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Effectuer le paiement
                paymentSuccess = true
            }) {
                Text("Payer")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if paymentSuccess {
                Text("Paiement réussi !")
                    .font(.title)
                    .foregroundColor(.green)
            }
        }
        .padding()
    }

    // Fonction pour calculer le total du panier
    func totalPrice() -> Double {
        return cart.reduce(0.0) { $0 + $1.price }
    }
}


struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(cart: .constant([]))
    }
}

