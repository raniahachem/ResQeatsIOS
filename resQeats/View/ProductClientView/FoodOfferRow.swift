//
//  FoodOfferButton.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct FoodOfferRow: View {
    @EnvironmentObject var cartManager: CartManager
    var offer: FoodOffer

    var body: some View {
        HStack(spacing: 20) {
            Image(offer.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 10) {
                Text(offer.title)
                    .bold()

                Text("\(offer.price) TND")
            }

            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(offer: offer)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

