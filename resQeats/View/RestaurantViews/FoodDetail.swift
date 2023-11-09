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
    var restaurantName: String // Le nom du restaurant

    var body: some View {
        VStack(alignment: .center) {
            Image(offer.title)
                .resizable()
            HStack {
                Text(offer.title)
                    .font(.headline)
                    .padding(.leading, 10.0)
                Spacer()
                Text("Price: \(offer.price, specifier: "%.2f") TND")
                    .padding(.trailing, 20.0)
            }
            Spacer()
            Text(offer.category)
                .font(.subheadline)
                .padding(.trailing, 280.0)
            Spacer()
            Text(offer.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .padding(.trailing, 220.0)
            
            HStack {
                Button(action: {
                    viewModel.addToCart(offer)
                }) {
                    HStack {
                        Text("Add to cart")
                            .font(.title)
                            .foregroundColor(Color.white)
                        Image(systemName: "cart.badge.plus")
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(hex: "566F5C"))
                    .cornerRadius(10)
                }
            }

        .background(Color(hex: "F1FDDE"))
        .padding(.bottom, 16)
    }.background(Color(hex: "F1FDDE"))
}
}
struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(offer: restaurants[0].foodOffers[0], viewModel: RestaurantDetailViewModel(restaurant: restaurants[0]), restaurantName: restaurants[0].name)
    }
}
