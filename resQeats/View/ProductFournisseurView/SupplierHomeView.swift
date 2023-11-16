//
//  SupplierHome.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct SupplierHomeView: View {
    @ObservedObject var viewModel: RestaurantOffersViewModel

    var body: some View {
        NavigationView {
            
            ScrollView {
                SupplierOffers(viewModel: viewModel)
            }
            .navigationTitle("My offers")
        }
        .navigationViewStyle(.stack)
    }
}

/*struct SupplierHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurantLeZink = Restaurant(name: "Le zink", category: "Fast food", imageName: "zink", description: "Le zink specialisé en Burgers gourmets , salades, pastrami… Les chefs y sont très doués et inventifs, une des meilleures adresses en Tunisie", foodOffers: [
            offers[0],
            offers[1],
            offers[2],
        ])

        let viewModel =
        RestaurantOffersViewModel(restaurant: restaurantLeZink)
 // Créez un exemple de modèle de vue
        return SupplierHomeView(viewModel: viewModel)
    }
}*/

struct SupplierOffers: View {
    @ObservedObject var viewModel: RestaurantOffersViewModel
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            VStack {
                let filteredOffers = viewModel.restaurant.foodOffers.filter { $0.restaurantName == "Le zink" }
                HStack{
                Text("\(filteredOffers.count) offers posted")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.leading, 16)
                                    .opacity(0.7)
                                    
                    Spacer()
                    NavigationLink(destination: AddOfferView()) {
                        Image(systemName: "plus.circle.fill")
                            .padding(.trailing, 16.0)
                                .font(.system(size: 40))
                                .foregroundColor(Color("GreenforB"))
                        }
                }
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.restaurant.foodOffers.filter { $0.restaurantName == "Le zink" }) { offer in
                        NavigationLink(destination: FoodDetail(offer: offer, viewModel: viewModel, restaurantName: "Le zink")) {
                            SupplierOfferCardView(offer: offer)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct SupplierOfferCardView: View {
    var offer: FoodOffer

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
                    Text("\(offer.price) TND")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}
