//
//  RestaurantOffers.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
struct RestaurantOffers: View {
    @ObservedObject var viewModel: RestaurantOffersViewModel
    var restaurantName: String
    @EnvironmentObject var cartManager: CartManager // Ajoutez l'environnement CartManager

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack {
                Text("Latest offers posted by \(restaurantName)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.restaurant.foodOffers) { offer in
                        NavigationLink(destination: FoodDetail(offer: offer, viewModel: viewModel, restaurantName: restaurantName)) {
                            FoodCardView(offer: offer)
                        }
                    }
                }
                .padding()
            }
        }
        .toolbar {
                   NavigationLink(destination: FoodCartView().environmentObject(cartManager)) {
                       FoodCartButton(numberOfOffers: cartManager.foodOffers.count)
                   }
        }
    }
}

struct FoodCardView: View {
    var offer: FoodOffer
    @EnvironmentObject var cartManager: CartManager
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 3)

                VStack {
                    Image(offer.image)
                        .resizable()
                        .frame(height: 150)
                        .cornerRadius(10)
                    
                    Text(offer.title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    Spacer()
                    HStack {
                    Text(offer.category.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        Spacer()
                        Text("\(offer.price) TND") // Convert the price to String
                                                .font(.title3)
                        .foregroundColor(.black)
                    }
                }
                .padding()
                Button {
                    cartManager.addToCart(offer: offer)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }


