//
//  RestaurantDetail.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import SwiftUI

/*struct RestaurantDetail: View {
    @ObservedObject var viewModel: RestaurantDetailViewModel

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.restaurant.foodOffers) { offer in
                    FoodOfferRow(offer: offer, addToCart: { viewModel.addToCart(offer) })
                }

                NavigationLink(destination: PaymentView(cart: $viewModel.cart)) {
                    Text("Passer au paiement")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}*/

struct RestaurantDetail: View {
    @ObservedObject var viewModel: RestaurantDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.restaurant.foodOffers) { offer in
                    NavigationLink(destination: FoodDetail(offer: offer, viewModel: viewModel)) {
                        FoodImageCategoryView(offer: offer)
                    }
                }
            }
        }
    }
}
struct FoodImageCategoryView: View {
    var offer: FoodOffer

    var body: some View {
        VStack {
            Image(offer.title)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 200)
            Text(offer.title)
                .font(.caption)
            Text(offer.category)
                .font(.caption)
        }
    }
}


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

