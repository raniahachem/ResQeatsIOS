//
//  FoodDetail.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import SwiftUI

struct FoodDetail: View {
    var offer: FoodOffer
    @ObservedObject var viewModel: RestaurantDetailViewModel
    
    var body: some View {
        VStack {
            Text(offer.title)
                .font(.title)
            Text(offer.category)
                .font(.caption)
            Text(offer.description)
            Text("Prix : \(offer.price)")
            
            Button(action: {
                viewModel.addToCart(offer)
            }) {
                Text("Ajouter au panier")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
