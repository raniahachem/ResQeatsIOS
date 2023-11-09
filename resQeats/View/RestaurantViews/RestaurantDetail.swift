//
//  RestaurantDetail.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import SwiftUI

struct RestaurantDetail: View {
    @ObservedObject var viewModel: RestaurantDetailViewModel

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack {
                            Text("Latest offers posted by \(viewModel.restaurant.name)")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 16)

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.restaurant.foodOffers) { offer in
                    NavigationLink(destination: FoodDetail(offer: offer, viewModel: viewModel, restaurantName: viewModel.restaurant.name)) {
                        FoodCardView(offer: offer)
                    }
                }
            }
            .padding()
        }
    }
}
}
struct FoodCardView: View {
    var offer: FoodOffer

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 3)

            VStack {
                Image(offer.title)
                    .resizable()
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Text(offer.title)
                    .font(.headline)
                    .foregroundColor(.black)

                Text(offer.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}




